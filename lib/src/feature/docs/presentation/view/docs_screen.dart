import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_docs_list.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/create_doc_folder_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/docs_widget.dart';
import 'dart:developer';

import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/folder_filter_widget.dart';

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
          child: RefreshIndicator(
        displacement: 10.0,
        color: ref.watch(primaryColorProvider),
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          HapticFeedback.mediumImpact();
          return await ref.refresh(docsControllerProvider.notifier).getDocs();
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: docsData.when(
              data: (data) {
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
                            'fileUrl': file.url
                          },
                        )
                        .toList())
                    .toList();

                // Map file IDs to be equal to folder IDs
                final filesWithFolderId = allFiles.map((file) {
                  log("filesWithFolderIdData " + file.toString());
                  return {
                    'folderId':
                        file['documentId'], // Using document ID as fileId
                    'fileName': file['name'],
                    'path': file['path'],
                    'uploadedBy': file['uploadedBy'] ?? '',
                    'fileId': file['fileId'],
                    'fileUrl': file['fileUrl']
                  };
                }).toList();

                // Filter files based on the selected document
                final filteredFiles = selectedDocumentId != null
                    ? filesWithFolderId
                        .where((file) => file['folderId'] == selectedDocumentId)
                        .toList()
                    : filesWithFolderId; // Show all files initially

                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                context.push('/notifications');
                              },
                              child:
                                  SvgPicture.asset('assets/images/home.svg')),
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              showModalBottomSheet(
                                  useRootNavigator: true,
                                  isScrollControlled: true,
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => FolderFilterWidget(
                                        folders: data,
                                        onChange: (String id) {
                                          setState(() {
                                            selectedDocumentId = id;
                                          });
                                          context.pop();
                                        },
                                      ));
                            },
                            child: Row(
                              children: [
                                // SvgPicture.asset('assets/images/search.svg'),
                                SizedBox(width: 12.w),
                                ConstrainedBox(
                                  constraints: new BoxConstraints(
                                    maxHeight: 30.h,
                                    maxWidth: 30.w,
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/images/sort.svg'),
                                ),
                                SizedBox(width: 12.w),
                                InkWell(
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      _showAddBottomSheet(
                                          context, categoryList);
                                    },
                                    child: SvgPicture.asset(
                                        'assets/images/plus.svg')),
                              ],
                            ),
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
                                letterSpacing: -1,
                                fontSize: 36.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.h),
                      DocsWidget(files: filteredFiles),
                    ],
                  ),
                );
              },
              error: (err, _) {
                return const Text("Failed to load Docs",
                    style: TextStyle(
                        letterSpacing: -0.3, color: Helper.errorColor));
              },
              loading: () => LoadingDocsList(),
            ),
          ),
        ),
      )),
    );
  }

  _showAddBottomSheet(context, categoryList) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text(
            'Add new',
          ),
          // message: const Text('Message'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.doc,
                    color: Helper.primary,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Add document',
                    style: TextStyle(color: Helper.primary),
                  ),
                ],
              ),
              onPressed: () {
                context.push('/addDocs', extra: {"category": categoryList});
                context.pop();
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.plus_square,
                    color: Helper.primary,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Add new category',
                    style: TextStyle(color: Helper.primary),
                  ),
                ],
              ),
              onPressed: () {
                context.pop();
                _showCategoryBottomSheet(context);
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              'Cancel',
              style: TextStyle(color: Helper.errorColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
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
                      letterSpacing: -0.3,
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
                  highlightColor: Colors.transparent,
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
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  highlightColor: Colors.transparent,
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
                          letterSpacing: -0.3,
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
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 238.h,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
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
                          letterSpacing: -0.3,
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
                          letterSpacing: -0.3,
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
                            letterSpacing: -0.3,
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
                            borderSide: BorderSide(
                                color: ref.watch(primaryColorProvider)),
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
                                  letterSpacing: -0.3,
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
                                value.fold((failure) {}, (res) {
                                  ref
                                      .watch(docsControllerProvider.notifier)
                                      .getDocs();
                                  _categoryController.clear();
                                });
                                Utils.toastSuccessMessage(
                                    "Category added", context);
                              });
                              context.pop();
                            },
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 11),
                                backgroundColor:
                                    ref.watch(primaryColorProvider),
                                side: BorderSide(color: Helper.textColor300),
                                fixedSize: Size.infinite),
                            child: Text(
                              "Confirm",
                              style: TextStyle(
                                  letterSpacing: -0.3,
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
        ),
      ),
    );
  }
}
