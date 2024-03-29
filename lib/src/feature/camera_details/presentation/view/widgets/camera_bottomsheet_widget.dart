import 'dart:convert';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:background_downloader/background_downloader.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gal/gal.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:progresscenter_app_v4/main.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/load_camera_bottomsheet.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/load_comments_widget.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_app_bar.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

import 'dart:developer' as dev;

import 'package:share_plus/share_plus.dart';

class CameraBottomSheet extends ConsumerStatefulWidget {
  final String cameraName;
  final String projectId;
  final String cameraId;
  final String startDate;
  final String endDate;
  final String imageName;
  final String imageUrl;
  final int imageHeight;
  final int imageWidth;

  const CameraBottomSheet({
    super.key,
    required this.cameraName,
    required this.projectId,
    required this.cameraId,
    required this.startDate,
    required this.endDate,
    required this.imageName,
    required this.imageUrl,
    required this.imageHeight,
    required this.imageWidth,
  });

  @override
  ConsumerState<CameraBottomSheet> createState() => _CameraBottomSheetState();
}

class _CameraBottomSheetState extends BaseConsumerState<CameraBottomSheet> {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  bool showDownloadOptions = false;
  bool showShareOptions = false;
  bool isDownloading = false;
  String? downloadTaskId;
  DownloadTask? task;
  double _progressBar = 0.0;
  var filePath;
  bool granted = false;
  Directory? directory;
  bool showProgressIndicator = false;
  bool showShareIndicator = false;

  PersistentBottomSheetController? _controller;
  Future<Directory?> getLocalDirectory() async {
    return Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationSupportDirectory();
  }

  @override
  void initState() {
    super.initState();
    galAccess();
    // _saveImage();

    // Service()
    //     .shareSocials(widget.projectId, widget.cameraId, data)
    //     .then((value) {
    //   dev.log("returned data" + value.toString());
    // });
  }

  galAccess() async {
    granted = await Gal.requestAccess();
    directory = await getApplicationDocumentsDirectory();
  }

  Future<void> _saveImage() async {
    try {
      // Download image
      final response = await http.get(Uri.parse(widget.imageUrl));

      // Get temporary directory
      final dir = await getTemporaryDirectory();

      // Create an image name
      var filename = '${dir.path}/image.png';

      // Save to filesystem
      final file = File(filename);
      await file.writeAsBytes(response.bodyBytes);

      dev.log("preview" + file.path.toString());
      setState(() {
        filePath = file.path;
      });

      // // Ask the user to save it
      // final params = SaveFileDialogParams(sourceFilePath: file.path);
      // final finalPath = await FlutterFileDialog.saveFile(params: params);

      // if (finalPath != null) {
      // message = 'Image saved to disk';
      // }
    } catch (e) {
      dev.log(e.toString());
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> processLoadAndOpen() async {
    var post = jsonEncode({'imageName': widget.imageName});
    // Directory downloadDirPath;
    // downloadDirPath = (await getApplicationDocumentsDirectory());
    task = DownloadTask(
      url:
          'https://api-dev-v4.progresscenter.io/api/v4/projects/${widget.projectId}/cameras/${widget.cameraId}/images/download',
      // 'https://storage.googleapis.com/approachcharts/test/5MB-test.ZIP',
      // Endpoints.downloadSingleImageUrl(widget.projectId, widget.cameraId),
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer " + _prefsLocator.getUserToken(),
      },
      // priority: 1,
      post: post,
      // updates: Updates.statusAndProgress,
      // retries: 3,
      // directory: downloadDirPath.absolute.path,
      baseDirectory: BaseDirectory.applicationSupport,
      filename:
          // 'zipfile.zip',
          widget.imageName,
    );
    bool done = await FileDownloader().enqueue(
      task!,
      // onProgress: (progress) {
      //   dev.log('Progress: ${progress}%');
      //   setState(() {
      //     _progressBar = progress;
      //   });
      // },
      // onStatus: (status) => dev.log('Status: $status'),
    );
    if (Platform.isIOS && done) {
      await FileDownloader().openFile(task: task);
    }

    setState(() {
      _progressBar = 1.0;
    });

    // if (Platform.isIOS) {
    //   // add to photos library and print path
    //   // If you need the path, ask full permissions beforehand by calling
    //   var auth = await FileDownloader()
    //       .permissions
    //       .status(PermissionType.iosChangePhotoLibrary);
    //   if (auth != PermissionStatus.granted) {
    //     auth = await FileDownloader()
    //         .permissions
    //         .request(PermissionType.iosChangePhotoLibrary);
    //   }
    //   if (auth == PermissionStatus.granted) {
    //     final identifier = await FileDownloader()
    //         .moveToSharedStorage(task, SharedStorage.images);
    //     if (identifier != null) {
    //       final path = await FileDownloader()
    //           .pathInSharedStorage(identifier, SharedStorage.images);
    //       debugPrint(
    //           'iOS path to dog picture in Photos Library = ${path ?? "permission denied"}');
    //     } else {
    //       debugPrint(
    //           'Could not add file to Photos Library, likely because permission denied');
    //     }
    //   } else {
    //     debugPrint('iOS Photo Library permission not granted');
    //   }
    // }
    if (Platform.isAndroid) {
      await Future.delayed(const Duration(seconds: 3));
      var auth = await FileDownloader()
          .permissions
          .status(PermissionType.androidSharedStorage);
      if (auth != PermissionStatus.granted) {
        auth = await FileDownloader()
            .permissions
            .request(PermissionType.androidSharedStorage);
      }
      if (auth == PermissionStatus.granted) {
        final path = await FileDownloader()
            .moveToSharedStorage(task!, SharedStorage.images);
        debugPrint(
            'Android path to dog picture in .images = ${path ?? "permission denied"}');
      } else {
        debugPrint('androidSharedStorage permission not granted');
      }
    }
  }

  Future<void> _downloadImage(String image) async {
    var post = jsonEncode({'imageName': widget.imageName});
    String downloadDirPath;
    if (Platform.isIOS) {
      downloadDirPath =
          (await getApplicationDocumentsDirectory()).absolute.path;
    } else {
      downloadDirPath = (await getExternalStorageDirectory())!.absolute.path;
    }
    dev.log(downloadDirPath.toString());
    task = DownloadTask(
        url:
            "https://i2.wp.com/www.skiptomylou.org/wp-content/uploads/2019/06/dog-drawing.jpg",
        // Endpoints.downloadSingleImageUrl(widget.projectId, widget.cameraId),
        filename: 'dog.jpg',
        // headers: {'myHeader': 'value'},
        // directory: 'file',
        baseDirectory: BaseDirectory.applicationDocuments,
        updates:
            Updates.statusAndProgress, // request status and progress updates
        requiresWiFi: true,
        retries: 5,
        allowPause: true,
        metaData: 'data for me');
    final result = await FileDownloader().download(
      task!,
      onProgress: (progress) => dev.log('Progress: ${progress * 100}%'),
      onStatus: (status) => dev.log('Status: $status'),
    );

    // Act on the result
    switch (result) {
      case TaskStatus.complete:
        dev.log('Success!');

      case TaskStatus.canceled:
        dev.log('Download was canceled');

      case TaskStatus.paused:
        dev.log('Download was paused');

      default:
        dev.log('Download not successful');
    }
  }

  @override
  Widget build(BuildContext context) {
    dev.log("image name passed" + widget.imageName.toString());
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        // height: 400.h,
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          children: [
            Row(
              children: [
                showDownloadOptions || showShareOptions
                    ? InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          setState(() {
                            showDownloadOptions = false;
                            isDownloading = false;
                            showShareOptions = false;
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
                    showDownloadOptions
                        ? "Download Image"
                        : showShareOptions
                            ? "Share Image"
                            : widget.cameraName,
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ])),
              ],
            ),
            SizedBox(height: 24.h),
            !showDownloadOptions && !showShareOptions
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            showDownloadOptions = true;
                            showShareOptions = false;
                          });
                        },
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
                                  // fit: BoxFit.cover,
                                  width: 24,
                                  height: 24,
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
                      SizedBox(height: 4.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.push('/imageComments', extra: {
                            "projectId": widget.projectId,
                            "cameraId": widget.cameraId,
                            "imageName": widget.imageName,
                            "imageHeight": widget.imageHeight,
                            "imageWidth": widget.imageWidth,
                            "fromNotifications": false,
                            "cameraImageCommentId": "",
                            "cameraImageCommentReplyId": "",
                            "imageUrl": widget.imageUrl
                          });
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset(
                                  'assets/images/message.svg',
                                  width: 24,
                                  height: 24,
                                  colorFilter: ColorFilter.mode(
                                      ref.watch(primaryColorProvider),
                                      BlendMode.srcIn))),
                          title: Text(
                            'Comment',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          setState(() {
                            showShareOptions = true;
                            showDownloadOptions = false;
                          });
                          dev.log(showShareOptions.toString());
                        },
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset('assets/images/share.svg',
                                  width: 24,
                                  height: 24,
                                  // fit: BoxFit.cover,
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
                : !showShareOptions
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              setState(() {
                                showProgressIndicator = true;
                              });

                              if (granted) {
                                await Dio().download(widget.imageUrl,
                                    directory!.path + "/${widget.imageName}");
                                await Gal.putImage(
                                        directory!.path +
                                            "/${widget.imageName}",
                                        album: null)
                                    .then((value) {
                                  setState(() {
                                    showProgressIndicator = false;
                                  });
                                  context.pop();
                                  ScaffoldMessenger.of(
                                          rootNavigatorKey.currentContext!)
                                      .showSnackBar(SnackBar(
                                    content: const Text('Saved! ✅'),
                                    backgroundColor: Helper.successColor,
                                  ));
                                });
                              }
                            },
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
                                      width: 24,
                                      height: 24,
                                      // fit: BoxFit.cover,
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
                              trailing: showProgressIndicator
                                  ? Transform.scale(
                                      scale: 0.5,
                                      child: CircularProgressIndicator(
                                        color: ref.watch(primaryColorProvider),
                                      ),
                                    )
                                  : SizedBox(),
                            ),
                          ),
                          SizedBox(height: 4.h),
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.push('/multipleImages', extra: {
                                "projectId": widget.projectId,
                                "cameraName": widget.cameraName,
                                "cameraId": widget.cameraId,
                                "startDate": widget.startDate,
                                "endDate": widget.endDate
                              });
                            },
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
                                      width: 24,
                                      height: 24,
                                      // fit: BoxFit.cover,
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
                                  backgroundColor: MaterialStatePropertyAll(
                                      Helper.baseBlack),
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
                    : showShareOptions
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  context.push('/shareProgressline', extra: {
                                    "projectId": widget.projectId,
                                    "cameraId": widget.cameraId,
                                    "imageUrl": widget.imageUrl,
                                    "imageHeight": widget.imageHeight,
                                    "imageWidth": widget.imageWidth,
                                  });
                                },
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                      decoration: BoxDecoration(
                                        color: Helper.bottomIconBack,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      padding: EdgeInsets.all(8.w),
                                      child: SvgPicture.asset(
                                        'assets/images/progress_tick.svg',
                                        // fit: BoxFit.contain,
                                        width: 24,
                                        height: 24,
                                      )),
                                  title: Text(
                                    'ProgressLine',
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.baseBlack,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () async {
                                  setState(() {
                                    showShareIndicator = true;
                                  });
                                  _saveImage().then((value) {
                                    setState(() {
                                      showShareIndicator = false;
                                    });
                                    Share.shareXFiles([XFile(filePath)]);
                                  });
                                },
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                      decoration: BoxDecoration(
                                        color: Helper.bottomIconBack,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                      ),
                                      padding: EdgeInsets.all(8.w),
                                      child: SvgPicture.asset(
                                          'assets/images/share_socials.svg',
                                          width: 24,
                                          height: 24,
                                          colorFilter: ColorFilter.mode(
                                              ref.watch(primaryColorProvider),
                                              BlendMode.srcIn))),
                                  title: Text(
                                    'Social media',
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.baseBlack,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  trailing: showShareIndicator
                                      ? Transform.scale(
                                          scale: 0.5,
                                          child: CircularProgressIndicator(
                                            color:
                                                ref.watch(primaryColorProvider),
                                          ),
                                        )
                                      : SizedBox(),
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
                                      backgroundColor: MaterialStatePropertyAll(
                                          Helper.baseBlack),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                        ),
                                      )),
                                  onPressed: () {
                                    context.pop();
                                  },
                                ),
                              ),
                            ],
                          )
                        : SizedBox()
          ],
        ));
  }

  _showProgressBottomSheet(context, WidgetRef ref) async {
    _controller =
        await Scaffold.of(context).showBottomSheet((BuildContext context) {
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
                    'Generating Zip',
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
                            "Fetching image",
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
