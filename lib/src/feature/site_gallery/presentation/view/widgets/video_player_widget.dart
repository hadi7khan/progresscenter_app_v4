import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final data;
  const VideoPlayerWidget({super.key, this.data});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  VideoPlayerController? controller;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    if (widget.data.type == "VIDEO") {
      _initPlayer();
    }
  }

  Future _initPlayer() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.data.url!));
    await controller!.initialize().then((value) {
      chewieController = ChewieController(
        aspectRatio: 1 / 1,
        videoPlayerController: controller!,
        autoPlay: false,
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

  @override
  void dispose() {
    if (!mounted) {
      chewieController!.dispose();
      controller!.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AspectRatio(
            aspectRatio: 1 / 1,
            child: chewieController != null &&
                    chewieController!.videoPlayerController.value.isInitialized
                ? Chewie(
                    controller: chewieController!,
                  )
                : SizedBox()),
        Align(
            alignment: Alignment.center,
            child: Container(
              padding: EdgeInsets.only(
                  left: 7.w, top: 5.45.h, bottom: 5.45.h, right: 5.w),
              height: 24.h,
              width: 24.w,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(24.r)),
              child: SvgPicture.asset(
                'assets/images/icon_after.svg',
              ),
            ))
      ],
    );
  }
}
