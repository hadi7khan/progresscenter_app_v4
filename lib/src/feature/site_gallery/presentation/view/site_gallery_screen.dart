import 'dart:io';
import 'dart:ui';

import 'package:camera_gallery_image_picker/camera_gallery_image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/provider/site_gallery_controller.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/site_gallery_grid_widget.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/site_gallery_list_widget.dart';
// import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import 'dart:developer';

class SiteGalleryScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const SiteGalleryScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<SiteGalleryScreen> createState() => _DroneFootageScreenState();
}

class _DroneFootageScreenState extends BaseConsumerState<SiteGalleryScreen> {
  bool list = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  FilePickerResult? result;
  List<PlatformFile> docFiles = [];
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(siteGalleryControllerProvider.notifier)
          .getSiteGallery(widget.projectId);
    });
  }

  Future<void> _pickVideo(ImageSource source, context) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: source);
    // final pickedFile = await CameraPicker.pickFromCamera(context,
    //     pickerConfig: CameraPickerConfig());
    // final pickedFile = await _picker.pickImage(
    //   source: source,
    //   maxWidth: 1024,
    //   maxHeight: 1024,
    //   imageQuality: 80,
    // );

    // if (pickedFile != null) {
    //   try {
    //     final File? file = await pickedFile.file;

    //     if (file != null) {
    //       String filePath = file.path;
    //       log('File path: $filePath');
    //     } else {
    //       print('Error: Unable to load file.');
    //     }
    //   } catch (e) {
    //     print('Error: $e');
    //   }
    // }

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      if (await file.length() > 10000000) {
        // The file is too large, show an error message
        return;
      }
      setState(() {
        _image = file;
      });
      log("image path" + _image!.path.toString());
    } else {
      return null;
    }
  }

  Future<void> _pickImage(ImageSource source, context) async {
    final pickedFile = await CameraGalleryImagePicker.pickImage(
      context: context,
      source: ImagePickerSource.camera,
      maxWidth: 1024,
      maxHeight: 1024,
    );
    // final pickedFile = await CameraPicker.pickFromCamera(context,
    //     pickerConfig: CameraPickerConfig());
    // final pickedFile = await _picker.pickImage(
    //   source: source,
    //   maxWidth: 1024,
    //   maxHeight: 1024,
    //   imageQuality: 80,
    // );

    // if (pickedFile != null) {
    //   try {
    //     final File? file = await pickedFile.file;

    //     if (file != null) {
    //       String filePath = file.path;
    //       log('File path: $filePath');
    //     } else {
    //       print('Error: Unable to load file.');
    //     }
    //   } catch (e) {
    //     print('Error: $e');
    //   }
    // }

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      if (await file.length() > 1000000) {
        // The file is too large, show an error message
        return;
      }
      setState(() {
        _image = file;
      });
      log("image path" + _image!.path.toString());
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final siteGalleryData = ref.watch(
        siteGalleryControllerProvider.select((value) => value.siteGallery));
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w),
              child: AppBar(
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                automaticallyImplyLeading: false,
                centerTitle: false,
                titleSpacing: 12.0.w,
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Transform.rotate(
                    angle: 180 * (3.1415926535 / 180),
                    child: SvgPicture.asset('assets/images/chevron-right.svg',
                        color: Helper.iconColor, fit: BoxFit.contain),
                  ),
                ),
                leadingWidth: 24,
                title: Text(
                  widget.projectName,
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                actions: [
                  // InkWell(
                  //   onTap: () {
                  //     setState(() {
                  //       if (list == true) {
                  //         list = false;
                  //       } else {
                  //         list = true;
                  //       }
                  //     });
                  //   },
                  //   child: list
                  //       ? SvgPicture.asset('assets/images/grid_view.svg')
                  //       : SvgPicture.asset('assets/images/list_view.svg'),
                  // ),
                  SizedBox(width: 5.w),
                  InkWell(
                    child: SvgPicture.asset('assets/images/plus.svg'),
                    onTap: () {
                      _showBottomSheet(context, widget.projectId);
                      // context.push('/addSiteGallery', extra: {
                      //   "projectId": widget.projectId,
                      //   "projectName": widget.projectName
                      // });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            displacement: 10.0,
            color: Helper.primary,
            onRefresh: () async {
              HapticFeedback.mediumImpact();
              return await ref
                  .refresh(siteGalleryControllerProvider.notifier)
                  .getSiteGallery(widget.projectId);
            },
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.h),
              child: siteGalleryData.when(
                data: (data) {
                  if (data.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.88.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/illustration.svg'),
                          SizedBox(height: 16.h),
                          Text(
                            "No Site gallery",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  }
                  ;
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   mainAxisSize: MainAxisSize.max,
                        //   children: [
                        //     Row(children: [
                        //       Container(
                        //         height: 24.h,
                        //         child: IconButton(
                        //           padding: EdgeInsets.zero,
                        //           alignment: Alignment.centerLeft,
                        //           icon: Icon(
                        //             Icons.arrow_back,
                        //           ),
                        //           onPressed: () => context.pop(),
                        //         ),
                        //       ),
                        //       SizedBox(width: 8.w),
                        //       Text(
                        //         widget.projectName,
                        //         style: TextStyle(
                        //             color: Helper.baseBlack,
                        //             fontSize: 18.sp,
                        //             fontWeight: FontWeight.w500),
                        //       )
                        //     ]),
                        //     Row(
                        //       mainAxisSize: MainAxisSize.min,
                        //       mainAxisAlignment: MainAxisAlignment.end,
                        //       children: [
                        //         Container(
                        //           margin: EdgeInsets.zero,
                        //           height: 24.h,
                        //           child: IconButton(
                        //             padding: EdgeInsets.zero,
                        //             alignment: Alignment.centerLeft,
                        //             icon: list
                        //                 ? SvgPicture.asset(
                        //                     'assets/images/grid_view.svg')
                        //                 : SvgPicture.asset(
                        //                     'assets/images/list_view.svg'),
                        //             onPressed: () {
                        //               setState(() {
                        //                 if (list == true) {
                        //                   list = false;
                        //                 } else {
                        //                   list = true;
                        //                 }
                        //               });
                        //             },
                        //           ),
                        //         ),
                        //         Container(
                        //           margin: EdgeInsets.zero,
                        //           height: 24.h,
                        //           child: IconButton(
                        //             padding: EdgeInsets.zero,
                        //             alignment: Alignment.centerLeft,
                        //             icon: SvgPicture.asset('assets/images/plus.svg'),
                        //             onPressed: () => context.pop(),
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 24.h,
                        // ),
                        list
                            ? ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 16.h);
                                },
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: ((context, index) {
                                  final reversedIndex = data.length - 1 - index;
                                  return SiteGalleryListViewWidget(
                                    data: data[reversedIndex],
                                  );
                                }),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                // cacheExtent: 99999999,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      MediaQuery.of(context).size.width / 3,
                                  mainAxisSpacing: 1.5.h,
                                  crossAxisSpacing: 1.5.w,
                                  childAspectRatio: 1 / 1,
                                  // mainAxisExtent: 100.h
                                ),
                                itemCount: data.length,
                                itemBuilder: ((context, index) {
                                  final reversedIndex = data.length - 1 - index;
                                  return SiteGalleryGridViewWidget(
                                    data: data[reversedIndex],
                                    projectName: widget.projectName,
                                  );
                                }),
                              )
                      ]);
                },
                error: (err, _) {
                  return const Text("Failed to load Site Gallery",
                      style: TextStyle(
                          letterSpacing: -0.3, color: Helper.errorColor));
                },
                loading: () => Column(
                  children: [
                    SizedBox(
                      height: 44,
                    ),
                    LoadingCardListScreen(),
                  ],
                ),
              ),
            )),
          ),
        ));
  }

  _showBottomSheet(context, id) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text("Add Site Gallery"),
          // message: const Text('Message'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: const Text('Take Photo'),
              onPressed: () {
                _pickImage(ImageSource.camera, context).then((value) async {
                  await Service()
                      .uploadImageForSitegallery(
                    widget.projectId,
                    _image!.path,
                  )
                      .then((value) {
                    setState(() {
                      // _progress = progress;
                      // print("progress" + _progress.toString());
                    });
                    // print("progress" + _progress.toString());
                    context.pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Image Uploaded")));
                  });
                  ref
                      .watch(siteGalleryControllerProvider.notifier)
                      .getSiteGallery(widget.projectId);
                });
              },
            ),
            CupertinoActionSheetAction(
              child: const Text('Take Video'),
              onPressed: () {
                _pickVideo(ImageSource.camera, context).then((value) async {
                  await Service()
                      .uploadImageForSitegallery(
                    widget.projectId,
                    _image!.path,
                  )
                      .then((value) {
                    setState(() {
                      // _progress = progress;
                      // print("progress" + _progress.toString());
                    });
                    // print("progress" + _progress.toString());

                    context.pop();
                    ref
                        .refresh(siteGalleryControllerProvider.notifier)
                        .getSiteGallery(widget.projectId);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        backgroundColor: Colors.green,
                        content: Text("Video Uploaded")));
                  });
                });
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                'Choose Photo',
              ),
              onPressed: () async {
                result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
                );
                await Service()
                    .uploadFiles(
                  widget.projectId,
                  result!.paths.map((path) => path).toList(),
                )
                    .then((value) {
                  context.pop();
                  Utils.toastSuccessMessage(
                    "Site Gallery Added",
                  );
                  ref
                      .watch(siteGalleryControllerProvider.notifier)
                      .getSiteGallery(widget.projectId);
                });
              },
            ),
            CupertinoActionSheetAction(
              child: const Text(
                'Browse from files',
              ),
              onPressed: () async {
                result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.custom,
                  allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
                );
                await Service()
                    .uploadFiles(
                  widget.projectId,
                  result!.paths.map((path) => path).toList(),
                )
                    .then((value) {
                  context.pop();
                  Utils.toastSuccessMessage(
                    "Site Gallery Added",
                  );
                  ref
                      .watch(siteGalleryControllerProvider.notifier)
                      .getSiteGallery(widget.projectId);
                });
              },
            ),
          ],
        ),
      );
    }
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 340.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Add Site Gallery",
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
                      // calculateProgress(0);
                      _pickImage(ImageSource.camera, context)
                          .then((value) async {
                        await Service()
                            .uploadImageForSitegallery(
                          widget.projectId,
                          _image!.path,
                        )
                            .then((value) {
                          setState(() {
                            // _progress = progress;
                            // print("progress" + _progress.toString());
                          });
                          // print("progress" + _progress.toString());

                          context.pop();
                          ref
                              .refresh(siteGalleryControllerProvider.notifier)
                              .getSiteGallery(widget.projectId);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Image Uploaded")));
                        });
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white),
                      child: Text(
                        'Take Photo',
                        style: TextStyle(
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // calculateProgress(0);
                      _pickVideo(ImageSource.camera, context)
                          .then((value) async {
                        await Service()
                            .uploadImageForSitegallery(
                          widget.projectId,
                          _image!.path,
                        )
                            .then((value) {
                          setState(() {
                            // _progress = progress;
                            // print("progress" + _progress.toString());
                          });
                          // print("progress" + _progress.toString());

                          context.pop();
                          ref
                              .refresh(siteGalleryControllerProvider.notifier)
                              .getSiteGallery(widget.projectId);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  backgroundColor: Colors.green,
                                  content: Text("Video Uploaded")));
                        });
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white),
                      child: Text(
                        'Take Video',
                        style: TextStyle(
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      result = await FilePicker.platform.pickFiles(
                        allowMultiple: true,
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
                      );
                      await Service()
                          .uploadFiles(
                        widget.projectId,
                        result!.paths.map((path) => path).toList(),
                      )
                          .then((value) {
                        context.pop();
                        Utils.toastSuccessMessage(
                          "Site Gallery Added",
                        );
                        ref
                            .watch(siteGalleryControllerProvider.notifier)
                            .getSiteGallery(widget.projectId);
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white),
                      child: Text(
                        'Choose Photo',
                        style: TextStyle(
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      result = await FilePicker.platform.pickFiles(
                        allowMultiple: true,
                        type: FileType.custom,
                        allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
                      );
                      await Service()
                          .uploadFiles(
                        widget.projectId,
                        result!.paths.map((path) => path).toList(),
                      )
                          .then((value) {
                        context.pop();
                        Utils.toastSuccessMessage(
                          "Site Gallery Added",
                        );
                        ref
                            .watch(siteGalleryControllerProvider.notifier)
                            .getSiteGallery(widget.projectId);
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 16.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white),
                      child: Text(
                        'Browse from files',
                        style: TextStyle(
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  // SizedBox(height: 20.h),
                  // Container(
                  //   height: 52.h,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     child: Text(
                  //       "Cancel",
                  //       style: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 16,
                  //           fontWeight: FontWeight.w500),
                  //       // currentIndex == contents.length - 1 ? "Continue" : "Next"
                  //     ),
                  //     style: ButtonStyle(
                  //         backgroundColor: MaterialStatePropertyAll(
                  //             _changeState ? Helper.primary : Helper.baseBlack),
                  //         shape: MaterialStateProperty.all(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(8.r),
                  //           ),
                  //         )),
                  //     onPressed: () {
                  //       context.pop();
                  //     },
                  //   ),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
