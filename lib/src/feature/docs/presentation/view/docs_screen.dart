import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_docs_list.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/create_doc_folder_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/docs_widget.dart';

class DocsScreen extends ConsumerStatefulWidget {
  final label;
  final detailsPath;
  const DocsScreen({super.key, this.label, this.detailsPath});

  @override
  ConsumerState<DocsScreen> createState() => _DocsScreenState();
}

class _DocsScreenState extends BaseConsumerState<DocsScreen> {
  TextEditingController _categoryController = TextEditingController();
  List<Map<String, dynamic>> categoryList = [];
  String? selectedDocumentId;
  List<String> documentNames = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(docsControllerProvider.notifier).getDocs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final docsData =
        ref.watch(docsControllerProvider.select((value) => value.docs));
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: docsData.when(
            data: (data) {
              print("data fetched" + data.toString());
              categoryList = data.map((map) {
                return {
                  '_id': map.id,
                  'name': map.name,
                };
              }).toList();

              // Get the list of files from all documents
              final allFiles = data
                  .where((document) =>
                      document.files != null && document.id!.isNotEmpty)
                  .expand((document) => document.files!
                      .map<Map<String, dynamic>>(
                        (file) => {
                          'documentId': document.id,
                          'fileId': file.id,
                          'name': file.name,
                          'path': file.path,
                          'uploadedBy': file.uploadedBy?.name ?? '',
                        },
                      )
                      .toList())
                  .toList();
              print("allFiles " + allFiles.toString());

              // Map file IDs to be equal to folder IDs
              final filesWithFolderId = allFiles.map((file) {
                print("filesWithFolderIdData " + file.toString());
                return {
                  'folderId': file['documentId'], // Using document ID as fileId
                  'fileName': file['name'],
                  'path': file['path'],
                  'uploadedBy': file['uploadedBy'] ?? '',
                  'fileId': file['fileId']
                };
              }).toList();
              print("filesWithFolderId " + filesWithFolderId.toString());

              // Filter files based on the selected document
              final filteredFiles = selectedDocumentId != null
                  ? filesWithFolderId
                      .where((file) => file['folderId'] == selectedDocumentId)
                      .toList()
                  : filesWithFolderId; // Show all files initially

              print("filteredFiles " + filteredFiles.toString());

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/images/home.svg'),
                      Row(
                        children: [
                          SvgPicture.asset('assets/images/search.svg'),
                          SizedBox(width: 12.w),
                          PopupMenuButton(
                            icon: SvgPicture.asset('assets/images/sort.svg'),
                            position: PopupMenuPosition.under,
                            itemBuilder: (BuildContext context) {
                              return data.map((folder) {
                                return PopupMenuItem(
                                    value: folder
                                        .id, // Use a unique identifier for each item
                                    child: ListTile(
                                      horizontalTitleGap: 8.w,
                                      dense: true,
                                      visualDensity: VisualDensity(
                                          horizontal: 0, vertical: -4),
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        folder.name!,
                                        style: TextStyle(
                                            color: Helper.baseBlack,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ));
                              }).toList();
                            },
                            onSelected: (value) {
                              print(value.toString());
                              setState(() {
                                selectedDocumentId = value!;
                                print(
                                    "selectedDocumentId: $selectedDocumentId");
                              });
                            },
                          ),
                          SizedBox(width: 12.w),
                          InkWell(
                              onTap: () {
                                _showUserBottomSheet(context, categoryList);
                              },
                              child:
                                  SvgPicture.asset('assets/images/plus.svg')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Documents",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  DocsWidget(files: filteredFiles),
                ],
              );
            },
            error: (err, _) {
              return const Text("Failed to load Docs",
                  style: TextStyle(color: Helper.errorColor));
            },
            loading: () => LoadingDocsList(),
          ),
        ),
      )),
    );
  }

  _showUserBottomSheet(context, categoryList) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 216.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add new',
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    context.push('/addDocs', extra: {"category": categoryList});
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Add document',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.pop();
                    _showCategoryBottomSheet(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Add new category',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _showCategoryBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 238.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add new category',
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomInputWidget(
                  title: "Category name",
                  formField: FormBuilderTextField(
                    name: '_category',
                    controller: _categoryController,
                    // focusNode: focusNode,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Category is required';
                      }
                      return null;
                    },
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 14.w),
                      hintText: "Enter name",
                      hintStyle: TextStyle(
                        color: Helper.textColor500,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      // hintText: widget.control.label,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Helper.textColor300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: BorderSide(color: Helper.primary),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () async {
                          context.pop();
                        },
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 11),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            backgroundColor: Colors.white,
                            fixedSize: Size.infinite),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Helper.neutral500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          Map<String, dynamic> data = {
                            "name": _categoryController.text,
                          };
                          await ref
                              .watch(createDocFolderProvider.notifier)
                              .createDocFolder(data)
                              .then((value) async {
                            value.fold((failure) {
                              print("errorrrrrr");
                            }, (res) {
                              ref
                                  .watch(docsControllerProvider.notifier)
                                  .getDocs();
                              _categoryController.clear();
                            });
                            Utils.toastSuccessMessage("Category added");
                          });
                          context.pop();
                        },
                        style: TextButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 11),
                            backgroundColor: Helper.primary,
                            side: BorderSide(color: Helper.textColor300),
                            fixedSize: Size.infinite),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
