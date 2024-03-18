import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_site_gallery.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/provider/site_gallery_controller.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/site_gallery_grid_widget.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/site_gallery_list_widget.dart';
import 'dart:developer';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';

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
  double _progress = 0.0;
  PersistentBottomSheetController? _bottomSheetController;
  double _progressBar = 0.0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(siteGalleryControllerProvider.notifier)
          .getSiteGallery(widget.projectId);
    });
  }

  double calculateProgress(double sentBytes) {
    setState(() {
      _progress = sentBytes;
    });
    log("ppppp" + _progress.toString());
    return sentBytes;
  }

  Future<void> _pickVideo(ImageSource source, context) async {
    final ImagePicker picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: source);

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      if (await file.length() > 10000000) {
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
    var pickedFile;
    await CameraPicker.pickFromCamera(context,
        pickerConfig: CameraPickerConfig(
          enableRecording: true,
          enableTapRecording: true,
          resolutionPreset: ResolutionPreset.medium,
          imageFormatGroup: Platform.isIOS
              ? ImageFormatGroup.bgra8888
              : ImageFormatGroup.yuv420,
          textDelegate: EnglishCameraPickerTextDelegate(),
          onEntitySaving: (context, viewType, file) {
            pickedFile = file;
          },
          onXFileCaptured: (p0, p1) {
            pickedFile = p0;
            Navigator.of(context).pop();
            return true;
          },
        ));

    if (pickedFile != null) {
      try {
        final XFile? file = await pickedFile;

        if (file != null) {
          String filePath = file.path;
          log('File path: $filePath');
          setState(() {
            _image = XFile(filePath);
          });
        } else {}
      } catch (e) {}
    }
  }

  @override
  void dispose() {
    ref.invalidate(siteGalleryControllerProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final siteGalleryData = ref.watch(
        siteGalleryControllerProvider.select((value) => value.siteGallery));
    return Scaffold(
        key: _scaffoldKey,
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
                  SizedBox(width: 5.w),
                  InkWell(
                    child: SvgPicture.asset('assets/images/plus.svg'),
                    onTap: () {
                      _showBottomSheet(context, widget.projectId);
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
            color: ref.watch(primaryColorProvider),
            onRefresh: () async {
              HapticFeedback.mediumImpact();
              return await ref
                  .refresh(siteGalleryControllerProvider.notifier)
                  .getSiteGallery(widget.projectId);
            },
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0.h),
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
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent:
                                      MediaQuery.of(context).size.width / 3,
                                  mainAxisSpacing: 1.5.h,
                                  crossAxisSpacing: 1.5.w,
                                  childAspectRatio: 1 / 1,
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
                loading: () => LoadingSiteGallery(),
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
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: Row(children: [
                Icon(
                  CupertinoIcons.camera,
                  color: Helper.primary,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Camera',
                  style: TextStyle(color: Helper.primary),
                ),
              ]),
              onPressed: () {
                _pickImage(ImageSource.camera, context).then((value) async {
                  await Service()
                      .uploadImageForSitegallery(
                          widget.projectId, _image!.path, calculateProgress)
                      .then((value) {
                    context.pop();
                    Utils.toastSuccessMessage("Media Uploaded", context);
                  });
                  ref
                      .watch(siteGalleryControllerProvider.notifier)
                      .getSiteGallery(widget.projectId);
                });
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.photo,
                    color: Helper.primary,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Choose Photo',
                    style: TextStyle(color: Helper.primary),
                  ),
                ],
              ),
              onPressed: () async {
                result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.media,
                  // allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
                );
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
                    'Browse from files',
                    style: TextStyle(color: Helper.primary),
                  ),
                ],
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
                  Utils.toastSuccessMessage("Site Gallery Added", context);
                  ref
                      .watch(siteGalleryControllerProvider.notifier)
                      .getSiteGallery(widget.projectId);
                });
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
          height: 280.h,
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
                      _pickImage(ImageSource.camera, context)
                          .then((value) async {
                        await Service()
                            .uploadImageForSitegallery(widget.projectId,
                                _image!.path, calculateProgress)
                            .then((value) {
                          setState(() {});
                          context.pop();

                          ref
                              .refresh(siteGalleryControllerProvider.notifier)
                              .getSiteGallery(widget.projectId);
                          Utils.toastSuccessMessage("Image Uploaded", context);
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
                        'Camera',
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
                        type: FileType.media,
                        // allowedExtensions: ['jpg', 'jpeg', 'png', 'mp4'],
                      );
                      await Service()
                          .uploadFiles(
                        widget.projectId,
                        result!.paths.map((path) => path).toList(),
                      )
                          .then((value) {
                        context.pop();
                        Utils.toastSuccessMessage(
                            "Site Gallery Added", context);
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
                      context.pop();
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showProgressBottomSheet(context) async {
    _bottomSheetController =
        _scaffoldKey.currentState!.showBottomSheet((BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 270.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Generating LiveLapse',
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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    isThreeLine: true,
                    leading: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 240, 255, 1),
                          borderRadius: BorderRadius.circular(32.r),
                          border: Border.all(
                              color: Color.fromRGBO(245, 249, 255, 1),
                              width: 4.w)),
                      child: SvgPicture.asset(
                        'assets/images/film.svg',
                      ),
                    ),
                    title: Text(
                      "Camera 2 - The Bridges.mp4",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Fetching images",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: LinearPercentIndicator(
                                      width: 210.w,
                                      fillColor: Helper.textColor300,
                                      backgroundColor: Helper.textColor300,
                                      progressColor:
                                          ref.watch(primaryColorProvider),
                                      padding: EdgeInsets.zero,
                                      curve: Curves.easeInOut,
                                      barRadius: Radius.circular(4.r),
                                      lineHeight: 8.h,
                                      percent: _progressBar / 100),
                                ),
                                Text(
                                  "${(_progressBar).toInt()}%",
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: Helper.textColor700,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ])
                        ]),
                    trailing: _progressBar == 100.0
                        ? SvgPicture.asset(
                            'assets/images/checkbox_base.svg',
                          )
                        : SizedBox(),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 52.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Close",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        // currentIndex == contents.length - 1 ? "Continue" : "Next"
                      ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Helper.baseBlack),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          )),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
