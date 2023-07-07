import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  late VideoPlayerController? controller;
  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.url),
        videoPlayerOptions: VideoPlayerOptions(
          mixWithOthers: true,
          allowBackgroundPlayback: true,
        ))
      ..initialize().then((_) {
        // controller!.addListener(() {
        //   if (controller!.value.hasError) {
        //     print("video player error" + controller!.value.errorDescription!);
        //   }
        // });

        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        Future.delayed(Duration(milliseconds: 100), () {
          setState(() {
            VideoPlayer(controller!);
            controller!.play();
          });
        });

        setState(() {});

        log(widget.url + "is playing----------------------------");
      }).then((value) {
        print("video player error" + controller!.value.errorDescription!);
      });
  }
  @override
void dispose() {
  controller!.dispose();
  // chewieController.dispose();
  super.dispose();
}

  // @override
  // void dispose() {
  //   // Dispose all the controllers when the widget is disposed
  //   controller!.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 284.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: controller!.value.isInitialized
            ? VideoPlayer(controller!)
            : Center(child: Text("Loading....")),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}