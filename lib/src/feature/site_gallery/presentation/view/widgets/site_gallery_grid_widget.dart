import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class SiteGalleryGridViewWidget extends StatefulWidget {
  final data;
  final projectName;
  const SiteGalleryGridViewWidget({super.key, this.data, this.projectName});

  @override
  State<SiteGalleryGridViewWidget> createState() =>
      _SiteGalleryGridViewWidgetState();
}

class _SiteGalleryGridViewWidgetState extends State<SiteGalleryGridViewWidget> {
  VlcPlayerController? _videoPlayerController;
  VideoPlayerController? controller;
  ChewieController? chewieController;
  Image? image1;

  // @override
  // void initState() {
  //   super.initState();
  //   if (widget.data.type == "VIDEO") {
  //     _initPlayer();
  // _videoPlayerController = VlcPlayerController.network(
  //   widget.data.url,
  //   autoPlay: false,
  //   options: VlcPlayerOptions(),
  // );
  // controller = VideoPlayerController.networkUrl(Uri.parse(widget.data.url),
  //     videoPlayerOptions: VideoPlayerOptions(
  //       mixWithOthers: true,
  //       allowBackgroundPlayback: true,
  //     ))
  //   ..initialize().then((_) {
  //     print("url " + widget.data.url.toString());
  // VideoPlayer(controller!);
  // controller!.play();
  // controller!.addListener(() {
  //   if (controller!.value.hasError) {
  //     print("video player error" + controller!.value.errorDescription!);
  //   }
  //   if (controller!.value.isPlaying) {
  //     print("video player playing" + controller!.value.errorDescription!);
  //   }
  //   if (controller!.value.isInitialized) {
  //     print("video player initialized" +
  //         controller!.value.isInitialized!);
  //   }
  // });

  // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

  //   Future.delayed(Duration(milliseconds: 100), () {
  //     setState(() {
  //       VideoPlayer(controller!);
  //       controller!.play();
  //     });
  //   });

  //   log(widget.data.url + "is playing----------------------------");
  // }).then((value) {
  //   print("video player error" + controller!.value.errorDescription!);
  // });
  // }
  // }

  Future _initPlayer() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.data.url!));
    await controller!.initialize().then((value) {
      chewieController = ChewieController(
        aspectRatio: 1 / 1,
        videoPlayerController: controller!,
        autoPlay: true,
        looping: false,
        showControls: false,
        additionalOptions: (context) {
          return <OptionItem>[
            OptionItem(
              onTap: () => debugPrint('Option 1 pressed!'),
              iconData: Icons.chat,
              title: 'Option 1',
            ),
            OptionItem(
              onTap: () => debugPrint('Option 2 pressed!'),
              iconData: Icons.share,
              title: 'Option 2',
            ),
          ];
        },
      );
      setState(() {});
    });
  }

  // @override
  // void didChangeDependencies() {
  //   if (widget.data.type == "IMAGE") {
  //     precacheImage(image1!.image ,context);
  //   }

  //   super.didChangeDependencies();
  // }
  //  @override
  // bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/fullViewSitegallery', extra: {
          "projectId": widget.data.project,
          "name": widget.data.name,
          "url": widget.data.url,
          "type": widget.data.type,
          "siteGalleryId": widget.data.id,
          "projectName": widget.projectName,
          "createdAt": widget.data.createdAt,
          "uploadedBy": widget.data.user.name
        });
      },
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        // height: 264.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.r),
        ),
        child: Stack(fit: StackFit.loose, children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1.r),
              topRight: Radius.circular(1.r),
              bottomLeft: Radius.circular(1.r),
              bottomRight: Radius.circular(1.r),
            ),
            child: Stack(alignment: Alignment.center, children: [
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: widget.data.type == "IMAGE"
                      ?
                      // ? Image(image: image1!.image)
                      ExtendedImage.network(
                          widget.data.url!,
                          fit: BoxFit.cover,
                          cacheWidth: 200,
                          cacheHeight: 200,
                          cache: true,
                          clearMemoryCacheWhenDispose: true,
                          cacheKey: widget.data.id,
                          retries: 3,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                return SizedBox();
                              case LoadState.failed:
                                SchedulerBinding.instance
                                    .addPostFrameCallback((Duration timeStamp) {
                                  state.reLoadImage();
                                });
                              case LoadState.completed:
                                return ExtendedRawImage(
                                  image: state.extendedImageInfo?.image,
                                );
                            }
                          },
                          //cancelToken: cancellationToken,
                        )
                      // CachedNetworkImage(
                      //     imageUrl: widget.data.url!,
                      //     memCacheWidth: 200,
                      //     memCacheHeight: 200,
                      //     fit: BoxFit.cover,
                      //     // placeholder: (context, url) =>
                      //     //     CircularProgressIndicator(),
                      //     errorWidget: (context, url, error) => ClipRRect(
                      //       child: Image.asset(
                      //         'assets/images/error_image.jpeg',
                      //         fit: BoxFit.cover,
                      //       ),
                      //     ),
                      //   )
                      // Image.network(
                      //     widget.data.url!,
                      //     // height: MediaQuery.of(context).size.height,
                      //     // width: MediaQuery.of(context).size.width,
                      //     fit: BoxFit.cover,
                      //     errorBuilder: (BuildContext context, Object exception,
                      //         StackTrace? stackTrace) {
                      //       return ClipRRect(
                      //         child: Image.asset(
                      //           'assets/images/error_image.jpeg',
                      //           fit: BoxFit.cover,
                      //         ),
                      //       );
                      //     },
                      //   )
                      : VideoPlayerWidget(data: widget.data)
                  // : Stack(
                  //     // alignment: Alignment.center,
                  //     children: [
                  //       AspectRatio(
                  //           aspectRatio: 1 / 1,
                  //           child: chewieController != null &&
                  //                   chewieController!.videoPlayerController
                  //                       .value.isInitialized
                  //               ? Chewie(
                  //                   controller: chewieController!,
                  //                 )
                  //               : SizedBox()
                  //           // VlcPlayer(
                  //           //   controller: _videoPlayerController!,
                  //           //   aspectRatio: 16 / 9,
                  //           //   placeholder:
                  //           //       Center(child: CircularProgressIndicator()),
                  //           // ),
                  //           ),
                  //       Align(
                  //           alignment: Alignment.center,
                  //           child: Container(
                  //             padding: EdgeInsets.only(
                  //                 left: 7.w,
                  //                 top: 5.45.h,
                  //                 bottom: 5.45.h,
                  //                 right: 5.w),
                  //             height: 24.h,
                  //             width: 24.w,
                  //             decoration: BoxDecoration(
                  //                 color: Colors.white.withOpacity(0.3),
                  //                 borderRadius: BorderRadius.circular(24.r)),
                  //             child: SvgPicture.asset(
                  //               // height: 13,
                  //               // width: 13,
                  //               'assets/images/icon_after.svg',
                  //             ),
                  //           ))
                  //     ],
                  //   ),
                  )
            ]),
          ),
        ]),
      ),
    );
  }
}

showDate(date, dateFormat) {
  // Parse the installationDate string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
