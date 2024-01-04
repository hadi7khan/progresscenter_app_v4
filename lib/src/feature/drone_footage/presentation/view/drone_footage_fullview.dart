import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DroneFootageFullviewScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  final String videoUrl;
  final String provider;
  const DroneFootageFullviewScreen(
      {super.key,
      required this.projectId,
      required this.projectName,
      required this.videoUrl,
      required this.provider});

  @override
  State<DroneFootageFullviewScreen> createState() =>
      _DroneFootageFullviewScreenState();
}

class _DroneFootageFullviewScreenState
    extends State<DroneFootageFullviewScreen> {
  VlcPlayerController? _videoPlayerController;
  YoutubePlayerController? _youtubeController;
  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      widget.videoUrl,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        hideControls: false,
        autoPlay: true,
        mute: false,
        disableDragSeek: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              centerTitle: true,
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
          child: widget.provider == "PROGRESSCENTER"
              ? VlcPlayer(
                  controller: _videoPlayerController!,
                  aspectRatio: 16 / 9,
                  placeholder: Center(child: CircularProgressIndicator()),
                )
              : widget.provider == "YOUTUBE"
                  ? YoutubePlayer(
                      controller: _youtubeController!,
                    )
                  : VimeoVideoPlayer(url: widget.videoUrl, autoPlay: true),
        ),
      ),
    );
  }
}
