import 'dart:io';
import 'dart:ui';

import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/provider/site_gallery_controller.dart';
import 'package:video_player/video_player.dart';

class FullViewSitegalleryScreen extends ConsumerStatefulWidget {
  final String? projectId;
  final String? name;
  final String? url;
  final String? type;
  final String? siteGalleryId;
  final String? projectName;
  final createdAt;
  final String? uploadedBy;
  const FullViewSitegalleryScreen({
    super.key,
    this.projectId,
    this.name,
    this.url,
    this.type,
    this.siteGalleryId,
    this.projectName,
    this.createdAt,
    this.uploadedBy,
  });

  @override
  ConsumerState<FullViewSitegalleryScreen> createState() =>
      _FullViewSitegalleryScreenState();
}

class _FullViewSitegalleryScreenState
    extends BaseConsumerState<FullViewSitegalleryScreen> {
  VideoPlayerController? controller;
  ChewieController? chewieController;
  BetterPlayerController? betterController;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    if (widget.type == "VIDEO") {
      _initPlayer();
    }
  }

  Future _initPlayer() async {
    BetterPlayerDataSource betterPlayerDataSource =
        BetterPlayerDataSource(BetterPlayerDataSourceType.network, widget.url!);
    betterController = BetterPlayerController(
        BetterPlayerConfiguration(
          autoPlay: true,
          fullScreenByDefault: false,
          fit: BoxFit.fitHeight,
          looping: false,
        ),
        betterPlayerDataSource: betterPlayerDataSource);
    betterController!.addEventsListener((BetterPlayerEvent event) {
      if (event.betterPlayerEventType == BetterPlayerEventType.initialized) {
        betterController!.setOverriddenAspectRatio(
            betterController!.videoPlayerController!.value.aspectRatio);
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Container(
            color: Colors.black,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w),
              child: AppBar(
                systemOverlayStyle: SystemUiOverlayStyle.light,
                automaticallyImplyLeading: false,
                titleSpacing: 12.0.w,
                leading: InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    context.pop();
                  },
                  child: Transform.rotate(
                    angle: 180 * (3.1415926535 / 180),
                    child: SvgPicture.asset('assets/images/chevron-right.svg',
                        color: Colors.white, fit: BoxFit.contain),
                  ),
                ),
                leadingWidth: 24,
                title: Text(
                  widget.name!,
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Center(
            child: ClipRRect(
                child: Stack(alignment: Alignment.center, children: [
              widget.type == "IMAGE"
                  ? InteractiveViewer(
                      maxScale: 10,
                      child: Image.network(
                        gaplessPlayback: true,
                        widget.url!,
                        fit: BoxFit.fill,
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return ClipRRect(
                            child: Image.asset(
                              'assets/images/error_image.jpeg',
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    )
                  : AspectRatio(
                      aspectRatio: betterController!
                          .videoPlayerController!.value.aspectRatio,
                      child: BetterPlayer(
                        controller: betterController!,
                      ),
                    ),
            ])),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          color: Colors.black,
          alignment: Alignment.center,
          height: 76.h,
          child: Container(
            height: 52.h,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () async {
                      _showInfoBottomSheet(context);
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 11.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        backgroundColor: Colors.black,
                        fixedSize: Size.infinite),
                    child: Icon(Icons.info_outline, color: Colors.white),
                  ),
                  TextButton(
                    onPressed: () async {
                      _showDeleteBottomSheet(
                          context, widget.projectId, widget.siteGalleryId);
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 11.h),
                        backgroundColor: Colors.black,
                        fixedSize: Size.infinite),
                    child: Icon(Icons.delete, color: Helper.errorColor),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  _showInfoBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Wrap(
          children: [
            Container(
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 28.h, bottom: 20.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                color: Colors.white,
              ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Information',
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
                        title: "Project name: ",
                        formField: Text(
                          widget.projectName!,
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor900,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomInputWidget(
                        title: "Name: ",
                        formField: Text(
                          widget.name!,
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor900,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomInputWidget(
                        title: "Created At: ",
                        formField: Text(
                          // "",
                          showDate(widget.createdAt.toIso8601String(),
                              'dd MMM yyyy'),
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor900,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      CustomInputWidget(
                        title: "Uploaded by: ",
                        formField: Text(
                          widget.uploadedBy!,
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor900,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  showDate(date, dateFormat) {
    // Parse the installationDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat(dateFormat).format(parsedDate);
    return formattedDate;
  }

  _showDeleteBottomSheet(context, projectId, imageId) {
    if (!Platform.isIOS) {
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
            height: 200.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Delete',
                      style: TextStyle(
                          color: Helper.errorColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Are you sure you want to delete this item? ",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Helper.textColor500),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () async {
                              Service()
                                  .deleteSitegallery(projectId, imageId)
                                  .then((value) {
                                context.pop();
                                context.pop();
                                ref
                                    .read(
                                        siteGalleryControllerProvider.notifier)
                                    .getSiteGallery(widget.projectId);
                                Utils.flushBarErrorMessage(
                                    "Item Deleted", context);
                              });
                              setState(() {});
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 11),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                backgroundColor: Helper.errorColor,
                                fixedSize: Size.infinite),
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 11),
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Helper.textColor300),
                                fixedSize: Size.infinite),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Helper.textColor500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Do you want to delete this item?',
        ),
        content: Text(
          "You cannot undo this action ",
        ),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          CupertinoDialogAction(
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Helper.errorColor,
                ),
              ),
              onPressed: () {
                Service().deleteSitegallery(projectId, imageId).then((value) {
                  context.pop();
                  context.pop();
                  ref
                      .read(siteGalleryControllerProvider.notifier)
                      .getSiteGallery(widget.projectId);
                  Utils.flushBarErrorMessage("Item Deleted", context);
                });
                setState(() {});
              }),
        ],
      ),
    );
  }
}
