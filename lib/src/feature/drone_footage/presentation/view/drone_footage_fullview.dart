import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class DroneFootageFullviewScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  final String videoUrl;
  const DroneFootageFullviewScreen(
      {super.key,
      required this.projectId,
      required this.projectName,
      required this.videoUrl});

  @override
  State<DroneFootageFullviewScreen> createState() =>
      _DroneFootageFullviewScreenState();
}

class _DroneFootageFullviewScreenState
    extends State<DroneFootageFullviewScreen> {
  VlcPlayerController? _videoPlayerController;
  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      widget.videoUrl,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    // _youtubeController = YoutubePlayerController(
    //   initialVideoId: YoutubePlayer.convertUrlToId(widget.data.url) ?? '',
    //   flags: YoutubePlayerFlags(
    //     hideControls: true,
    //     autoPlay: false,
    //     mute: false,
    //     disableDragSeek: true,
    //   ),
    // );
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
              titleSpacing: 12.0.w,
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset('assets/images/chevron-right.svg',
                    color: Helper.iconColor, fit: BoxFit.cover),
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
            child: VlcPlayer(
          controller: _videoPlayerController!,
          aspectRatio: 16 / 9,
          placeholder: Center(child: CircularProgressIndicator()),
        )),
      ),
    );
  }
}
