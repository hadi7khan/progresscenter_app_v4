import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:video_player/video_player.dart';

class FullviewLivelapse extends StatefulWidget {
  final projectId;
  final projectName;
  final cameraId;
  final url;
  final name;
  const FullviewLivelapse(
      {super.key,
      this.url,
      this.projectName,
      this.projectId,
      this.cameraId,
      this.name});

  @override
  State<FullviewLivelapse> createState() => _FullviewLivelapseState();
}

class _FullviewLivelapseState extends State<FullviewLivelapse> {
  VideoPlayerController? controller;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  Future _initPlayer() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.url!));
    await controller!.initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: controller!,
        autoPlay: true,
        looping: true,
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
    controller!.dispose();
    chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
                widget.name,
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              // actions: [

              //   SizedBox(width: 5.w),
              //   InkWell(
              //     child: SvgPicture.asset('assets/images/plus.svg'),
              //     onTap: () {
              //       _showDroneFootageBottomSheet(context);
              //     },
              //   ),
              // ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
              aspectRatio: 16 / 9,
              child: chewieController == null
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Helper.primary,
                    ))
                  : Chewie(
                      controller: chewieController!,
                    )),
        ),
      ),
    );
  }
}
