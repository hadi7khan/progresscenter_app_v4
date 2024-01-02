import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
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
  Image? image1;

  @override
  void initState() {
    super.initState();
    if (widget.data.type == "VIDEO") {
      // _videoPlayerController = VlcPlayerController.network(
      //   widget.data.url,
      //   autoPlay: false,
      //   options: VlcPlayerOptions(),
      // );
      controller = VideoPlayerController.networkUrl(Uri.parse(widget.data.url),
          videoPlayerOptions: VideoPlayerOptions(
            mixWithOthers: true,
            allowBackgroundPlayback: true,
          ))
        ..initialize().then((_) {
          print("url " + widget.data.url.toString());
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

          Future.delayed(Duration(milliseconds: 100), () {
            setState(() {
              VideoPlayer(controller!);
              controller!.play();
            });
          });

          log(widget.data.url + "is playing----------------------------");
        }).then((value) {
          print("video player error" + controller!.value.errorDescription!);
        });
    }
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
                    CachedNetworkImage(
                        imageUrl: widget.data.url!,
                        // memCacheHeight: height.toInt(), memCacheWidth: width.toInt()
                        fit: BoxFit.cover,
                        // placeholder: (context, url) =>
                        //     CircularProgressIndicator(),
                        errorWidget: (context, url, error) => ClipRRect(
                          child: Image.asset(
                            'assets/images/error_image.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
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
                    : Stack(
                        // alignment: Alignment.center,
                        children: [
                          AspectRatio(
                              aspectRatio: 1 / 1,
                              child: controller!.value.isInitialized
                                  ? VideoPlayer(controller!)
                                  : SizedBox()
                              // VlcPlayer(
                              //   controller: _videoPlayerController!,
                              //   aspectRatio: 16 / 9,
                              //   placeholder:
                              //       Center(child: CircularProgressIndicator()),
                              // ),
                              ),
                          Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.play_circle_outline_outlined,
                                color: Colors.white, size: 44),
                          )
                        ],
                      ),
              )
            ]),
          ),
          // Positioned.fill(
          //   // bottom: 20,
          //   // left: 20,
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //         // height: 88.h,
          //         width: double.infinity,
          //         margin: EdgeInsets.zero,
          //         padding: EdgeInsets.all(12.w),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(15.r),
          //             color: Color.fromRGBO(246, 246, 246, 1)),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text(
          //               widget.data.name!,
          //               overflow: TextOverflow.ellipsis,
          //               style: TextStyle(
          //                 letterSpacing: -0.3,
          //                 fontSize: 14.sp,
          //                 fontWeight: FontWeight.w500,
          //                 color: Helper.baseBlack,
          //               ),
          //             ),
          //             // SizedBox(
          //             //   height: 6.h,
          //             // ),
          //             Text(
          //               showDate(widget.data.createdAt!.toIso8601String(),
          //                   'dd MMM yyyy'),
          //               style: TextStyle(
          //                 letterSpacing: -0.3,
          //                 fontSize: 12.sp,
          //                 fontWeight: FontWeight.w400,
          //                 color: Helper.baseBlack.withOpacity(0.5),
          //               ),
          //             ),
          //           ],
          //         )),
          //   ),
          // ),
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
