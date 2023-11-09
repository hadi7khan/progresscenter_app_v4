import 'dart:developer';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:video_player/video_player.dart';

class CCTVWidget extends StatefulWidget {
  final url;
  const CCTVWidget({
    super.key,
    this.url,
  });

  @override
  State<CCTVWidget> createState() => _CCTVWidgetState();
}

class _CCTVWidgetState extends State<CCTVWidget>
    with AutomaticKeepAliveClientMixin<CCTVWidget> {
  // late VideoPlayerController? controller;
  // ChewieController? chewieController;
  
  VlcPlayerController? _videoPlayerController;
  @override
  void initState() {
    super.initState();
    print("url before" + widget.url.toString());
    // final videoPlayerController =
    //     VideoPlayerController.networkUrl(Uri.parse(widget.url),
    //         videoPlayerOptions: VideoPlayerOptions(
    //           mixWithOthers: true,
    //           allowBackgroundPlayback: true,
    //         ))
    //       ..initialize();
    _videoPlayerController = VlcPlayerController.network(
      widget.url,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );

    // chewieController = ChewieController(
    //     videoPlayerController: videoPlayerController,
    //     aspectRatio: 16 / 9,
    //     autoPlay: true,
    //     looping: false,
    //     fullScreenByDefault: true,
    //     draggableProgressBar: false,
    //     showControlsOnInitialize: false,
    //     isLive: true,
    //     autoInitialize: true,
    //   );

    // controller = VideoPlayerController.networkUrl(Uri.parse(widget.url),
    //     videoPlayerOptions: VideoPlayerOptions(
    //       mixWithOthers: true,
    //       allowBackgroundPlayback: true,
    //     ))
    //   ..initialize().then((_) {
    //     print("url " + widget.url.toString());
    //     // VideoPlayer(controller!);
    //     // controller!.play();
    //     controller!.addListener(() {
    //       if (controller!.value.hasError) {
    //         print("video player error" + controller!.value.errorDescription!);
    //       }
    //       if (controller!.value.isPlaying) {
    //         print("video player playing" + controller!.value.errorDescription!);
    //       }
    //       if (controller!.value.isInitialized) {
    //         print("video player initialized" + controller!.value.errorDescription!);
    //       }
    //     });

    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.

    //     Future.delayed(Duration(milliseconds: 100), () {
    //       setState(() {
    //         VideoPlayer(controller!);
    //         controller!.play();
    //       });
    //     });

    //     log(widget.url + "is playing----------------------------");
    //   }).then((value) {
    //     print("video player error" + controller!.value.errorDescription!);
    //   });
  }

  @override
  void dispose() {
    // controller!.dispose();
    // chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // height: 298.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child:VlcPlayer(
                controller: _videoPlayerController!,
                aspectRatio: 16 / 9,
                placeholder: Center(child: CircularProgressIndicator()),
              ),
        // Chewie(
        //   controller: chewieController!,
        // )
        //  controller!.value.isInitialized

        //     ? VideoPlayer(controller!)
        //     : Center(child: Text("Loading....")),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
