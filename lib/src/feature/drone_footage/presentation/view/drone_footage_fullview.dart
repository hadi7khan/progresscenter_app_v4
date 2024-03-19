import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  YoutubePlayerController? _youtubeController;
  BetterPlayerController? betterController;
  @override
  void initState() {
    super.initState();
    if (widget.provider == "PROGRESSCENTER") {
      _initPlayer();
    }

    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '',
      flags: YoutubePlayerFlags(
        hideControls: false,
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
      ),
    );
  }

  Future _initPlayer() async {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, widget.videoUrl);
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
              centerTitle: false,
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
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: widget.provider == "PROGRESSCENTER"
              ? BetterPlayer(
                  controller: betterController!,
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
