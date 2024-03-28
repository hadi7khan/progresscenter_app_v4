import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/provider/site_gallery_controller.dart';

class AddSiteGalleryScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const AddSiteGalleryScreen(
      {super.key, required this.projectId, required this.projectName});

  @override
  ConsumerState<AddSiteGalleryScreen> createState() =>
      _AddSiteGalleryScreenState();
}

class _AddSiteGalleryScreenState
    extends BaseConsumerState<AddSiteGalleryScreen> {
  FilePickerResult? result;
  bool loader = false;
  List<PlatformFile> docFiles = [];

  String _formatFileSize(int size) {
    // Convert bytes to kilobytes
    double kbSize = size / 1024;

    if (kbSize < 1024) {
      return '${kbSize.toStringAsFixed(2)} KB';
    } else {
      // Convert kilobytes to megabytes
      double mbSize = kbSize / 1024;
      return '${mbSize.toStringAsFixed(2)} MB';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: AppBar(
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 12.0.w,
              leading: InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  'assets/images/close-x.svg',
                ),
              ),
              leadingWidth: 12,
              title: Text(
                "Add Site Gallery",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actionsIconTheme: IconThemeData(color: Helper.iconColor),
            ),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "You can add upto 25 files (photos or videos) at a time from here",
                    style: TextStyle(
                        letterSpacing: -0.3,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Helper.textColor600),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 200.h,
                    padding: EdgeInsets.all(10.h),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Helper.textColor300),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.image,
                          color: Colors.grey.shade400,
                          size: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: '',
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Upload file',
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        result =
                                            await FilePicker.platform.pickFiles(
                                          allowMultiple: true,
                                          type: FileType.custom,
                                          allowedExtensions: [
                                            'jpg',
                                            'jpeg',
                                            'png',
                                            'mp4'
                                          ],
                                        );
                                        if (result != null) {
                                          result!.files.map((path) {
                                            docFiles.add(path);
                                          }).toList();
                                          setState(() {});
                                        }
                                      },
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            ref.watch(primaryColorProvider))),
                              ],
                            ),
                          ),
                        ),
                        Text(
                          "Browse JPG/PNG/MP4",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: Helper.textColor600),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  docFiles != null
                      ? Expanded(
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 6.h);
                            },
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              PlatformFile file = docFiles[index];
                              return Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.w, vertical: 8.h),
                                // height: 72.h,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border:
                                      Border.all(color: Helper.textColor300),
                                ),
                                child: ListTile(
                                  key: ValueKey(index),
                                  horizontalTitleGap: 8.w,
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 6.w, vertical: 6.h),
                                    width: 32.w,
                                    height: 32.h,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(229, 240, 255, 1),
                                        borderRadius:
                                            BorderRadius.circular(32.r),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                245, 249, 255, 1),
                                            width: 4.w)),
                                    child: SvgPicture.asset(
                                      'assets/images/film.svg',
                                    ),
                                  ),
                                  title: Text(file.name,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.baseBlack,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600)),
                                  subtitle: Text(
                                      "${_formatFileSize(file.size)}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.textColor400,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w600)),
                                  trailing: InkWell(
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      setState(() {
                                        docFiles.removeAt(index);
                                      });
                                    },
                                    child: SvgPicture.asset(
                                      'assets/images/close-x.svg',
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: docFiles.length,
                          ),
                        )
                      : SizedBox(),
                  SizedBox(height: 12.h),
                ]),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          color: Colors.white,
          alignment: Alignment.center,
          height: 76.h,
          child: Container(
            height: 52.h,
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                "Upload",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                // currentIndex == contents.length - 1 ? "Continue" : "Next"
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(docFiles.isNotEmpty
                      ? ref.watch(primaryColorProvider)
                      : Helper.blendmode),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  )),
              onPressed: () async {
                await Service()
                    .uploadFiles(
                  widget.projectId,
                  result!.paths.map((path) => path).toList(),
                )
                    .then((value) {
                  context.pop();
                  Utils.toastSuccessMessage("Site Gallery Added", context);
                  ref
                      .watch(siteGalleryControllerProvider.notifier)
                      .getSiteGallery(widget.projectId);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
