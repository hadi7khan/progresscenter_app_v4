import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'dart:developer';

class CameraBottomSheet extends ConsumerStatefulWidget {
  final String cameraName;
  final String projectId;
  final String cameraId;
  final String startDate;
  final String endDate;

  const CameraBottomSheet(
      {super.key,
      required this.cameraName,
      required this.projectId,
      required this.cameraId,
      required this.startDate,
      required this.endDate});

  @override
  ConsumerState<CameraBottomSheet> createState() => _CameraBottomSheetState();
}

class _CameraBottomSheetState extends BaseConsumerState<CameraBottomSheet> {
  bool showDownloadOptions = false;
  String? downloadTaskId;
  ReceivePort _port = ReceivePort();

  /// [downloadTaskStatus] is used to store the task status.
  int downloadTaskStatus = 0;

  /// [downloadTaskProgress] store the progress of the download task. ranging between 1 to 100.
  int downloadTaskProgress = 0;

  /// [isDownloading] is set to true if the file is being downloaded.
  bool isDownloading = false;

  @override
  void initState() {
    super.initState();
    // initDownloadController();
  }

  @override
  void dispose() {
    disposeDownloadController();
    super.dispose();
  }

  /// [initDownloadController] method will initialize the downloader controller and perform certain operations like registering the port, initializing the register callback etc.
  initDownloadController() {
    log('DownloadsController - initDownloadController called');
    _bindBackgroundIsolate();
  }

  /// [disposeDownloadController] is used to unbind the isolates and dispose the controller
  disposeDownloadController() {
    _unbindBackgroundIsolate();
  }

  /// [_bindBackgroundIsolate] is used to register the [SendPort] with the name [downloader_send_port].
  /// If the registration is successful then it will return true else it will return false.
  _bindBackgroundIsolate() async {
    log('DownloadsController - _bindBackgroundIsolate called');
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );

    log('_bindBackgroundIsolate - isSuccess = $isSuccess');

    if (!isSuccess) {
      _unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    } else {
      _port.listen((message) {
        setState(
          () {
            downloadTaskId = message[0];
            downloadTaskStatus = message[1];
            downloadTaskProgress = message[2];
          },
        );

        if (message[1] == 2) {
          isDownloading = true;
        } else {
          isDownloading = false;
        }
      });
      await FlutterDownloader.registerCallback(registerCallback);
    }
  }

  /// [_unbindBackgroundIsolate] is used to remove the registered [SendPort] [downloader_send_port]'s mapping.
  void _unbindBackgroundIsolate() {
    log('DownloadsController - _unbindBackgroundIsolate called');
    IsolateNameServer.removePortNameMapping('downloader_send_port');
  }

  /// [registerCallback] is used to update the download progress
  @pragma('vm:entry-point')
  static registerCallback(String id, int status, int progress) {
    log("DownloadsController - registerCallback - task id = $id, status = $status, progress = $progress");

    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  Future<void> _downloadImage() async {
    String downloadDirPath;
    if (Platform.isIOS) {
      downloadDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    } else {
      downloadDirPath = (await getApplicationDocumentsDirectory()).path;
    }
    downloadTaskId = await FlutterDownloader.enqueue(
      url:
          "https://miro.medium.com/v2/resize:fit:1200/1*5JFH1YSl7NHZ4kPghfXfEg.jpeg",
      headers: {},
      savedDir: downloadDirPath,
      saveInPublicStorage: true,
      showNotification: true,
      openFileFromNotification: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      height: 320.h,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              showDownloadOptions
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          showDownloadOptions = false;
                        });
                      },
                      child: Transform.rotate(
                        angle: 180 * (3.1415926535 / 180),
                        child: SvgPicture.asset(
                            'assets/images/chevron-right.svg',
                            color: Helper.iconColor,
                            fit: BoxFit.contain),
                      ),
                    )
                  : SizedBox(),
              Expanded(
                  child: Column(children: [
                Text(
                  showDownloadOptions ? "Download Image" : widget.cameraName,
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                // Text(
                //   '25℃ Sunny, Hyderabad, India',
                //   style: TextStyle(
                //       letterSpacing: -0.3,
                //       color: Color.fromRGBO(127, 127, 127, 0.5),
                //       fontSize: 13.sp,
                //       fontWeight: FontWeight.w400),
                // ),
                // Text(
                //   '10-07-2023, 12:30 PM',
                //   style: TextStyle(
                //       letterSpacing: -0.3,
                //       color: Color.fromRGBO(127, 127, 127, 0.5),
                //       fontSize: 13.sp,
                //       fontWeight: FontWeight.w400),
                // ),
              ])),
            ],
          ),
          SizedBox(height: 24.h),
          !showDownloadOptions
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        setState(() {
                          showDownloadOptions = true;
                        });
                      },
                      child: Container(
                        height: 44.h,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset(
                                  'assets/images/download.svg',
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      ref.watch(primaryColorProvider),
                                      BlendMode.srcIn))),
                          title: Text(
                            'Download',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () async {
                        context.pop();
                      },
                      child: Container(
                        height: 44.h,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset('assets/images/share.svg',
                                  // width: 44.w,
                                  // height: 44.h,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      ref.watch(primaryColorProvider),
                                      BlendMode.srcIn))),
                          title: Text(
                            'Share',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    // SizedBox(height: 24.h),
                    // InkWell(
                    //   onTap: () async {
                    //     // setState(() {
                    //     //   _images = "1";
                    //     //   _showImages = "1 Image";
                    //     // });
                    //     context.pop();
                    //   },
                    //   child: Container(
                    //     height: 44.h,
                    //     child: ListTile(
                    //       contentPadding: EdgeInsets.zero,
                    //       leading: Container(
                    //           decoration: BoxDecoration(
                    //             color: Helper.bottomIconBack,
                    //             borderRadius: BorderRadius.circular(8.r),
                    //           ),
                    //           padding: EdgeInsets.all(8.w),
                    //           child: SvgPicture.asset('assets/images/message.svg',
                    //               // width: 44.w,
                    //               // height: 44.h,
                    //               fit: BoxFit.cover,
                    //               colorFilter: ColorFilter.mode(
                    //                   ref.watch(primaryColorProvider),
                    //                   BlendMode.srcIn))),
                    //       title: Text(
                    //         'Comment',
                    //         style: TextStyle(
                    //             letterSpacing: -0.3,
                    //             color: Helper.baseBlack,
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 24.h),
                    // InkWell(
                    //   onTap: () async {
                    //     // setState(() {
                    //     //   _images = "1";
                    //     //   _showImages = "1 Image";
                    //     // });
                    //     context.pop();
                    //   },
                    //   child: Container(
                    //     height: 44.h,
                    //     child: ListTile(
                    //       contentPadding: EdgeInsets.zero,
                    //       leading: Container(
                    //           decoration: BoxDecoration(
                    //             color: Helper.bottomIconBack,
                    //             borderRadius: BorderRadius.circular(8.r),
                    //           ),
                    //           padding: EdgeInsets.all(8.w),
                    //           child: SvgPicture.asset('assets/images/ai.svg',
                    //               width: 24.w,
                    //               height: 24.h,
                    //               fit: BoxFit.cover,
                    //               colorFilter: ColorFilter.mode(
                    //                   ref.watch(primaryColorProvider),
                    //                   BlendMode.srcIn))),
                    //       title: Text(
                    //         'AI Insights',
                    //         style: TextStyle(
                    //             letterSpacing: -0.3,
                    //             color: Helper.baseBlack,
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 24.h),
                    // InkWell(
                    //   onTap: () async {
                    //     // setState(() {
                    //     //   _images = "1";
                    //     //   _showImages = "1 Image";
                    //     // });
                    //     context.pop();
                    //   },
                    //   child: Container(
                    //     height: 44.h,
                    //     child: ListTile(
                    //       contentPadding: EdgeInsets.zero,
                    //       leading: Container(
                    //           decoration: BoxDecoration(
                    //             color: Helper.bottomIconBack,
                    //             borderRadius: BorderRadius.circular(8.r),
                    //           ),
                    //           padding: EdgeInsets.all(8.w),
                    //           child: SvgPicture.asset('assets/images/camera.svg',
                    //               // width: 44.w,
                    //               // height: 44.h,
                    //               fit: BoxFit.cover,
                    //               colorFilter: ColorFilter.mode(
                    //                   ref.watch(primaryColorProvider),
                    //                   BlendMode.srcIn))),
                    //       title: Text(
                    //         'Image quality',
                    //         style: TextStyle(
                    //             letterSpacing: -0.3,
                    //             color: Helper.baseBlack,
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 24.h),
                    // InkWell(
                    //   onTap: () async {
                    //     // setState(() {
                    //     //   _images = "1";
                    //     //   _showImages = "1 Image";
                    //     // });
                    //     context.pop();
                    //   },
                    //   child: Container(
                    //     height: 44.h,
                    //     child: ListTile(
                    //       contentPadding: EdgeInsets.zero,
                    //       leading: Container(
                    //           decoration: BoxDecoration(
                    //             color: Helper.bottomIconBack,
                    //             borderRadius: BorderRadius.circular(8.r),
                    //           ),
                    //           padding: EdgeInsets.all(8.w),
                    //           child: SvgPicture.asset(
                    //               'assets/images/camera-flash.svg',
                    //               // width: 44.w,
                    //               // height: 44.h,
                    //               fit: BoxFit.cover,
                    //               colorFilter: ColorFilter.mode(
                    //                   ref.watch(primaryColorProvider),
                    //                   BlendMode.srcIn))),
                    //       title: Text(
                    //         'Default view',
                    //         style: TextStyle(
                    //             letterSpacing: -0.3,
                    //             color: Helper.baseBlack,
                    //             fontSize: 16.sp,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(height: 24.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Cancel",
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
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        // _downloadImage();
                        // context.pop();
                      },
                      child: Container(
                        height: 44.h,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset(
                                  'assets/images/camera.svg',
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      ref.watch(primaryColorProvider),
                                      BlendMode.srcIn))),
                          title: Text(
                            'Single',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    InkWell(
                      onTap: () async {
                        context.push('/multipleImages', extra: {
                          "projectId": widget.projectId,
                          "cameraName": widget.cameraName,
                          "cameraId": widget.cameraId,
                          "startDate": widget.startDate,
                          "endDate": widget.endDate
                        });
                      },
                      child: Container(
                        height: 44.h,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset(
                                  'assets/images/add_image.svg',
                                  // width: 44.w,
                                  // height: 44.h,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      ref.watch(primaryColorProvider),
                                      BlendMode.srcIn))),
                          title: Text(
                            'Multiple',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Cancel",
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
    );
  }
}
