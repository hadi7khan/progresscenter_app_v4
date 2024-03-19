import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DroneGridViewWidget extends StatefulWidget {
  final data;
  final String projectId;
  const DroneGridViewWidget({super.key, this.data, required this.projectId});

  @override
  State<DroneGridViewWidget> createState() => _DroneGridViewWidgetState();
}

class _DroneGridViewWidgetState extends State<DroneGridViewWidget> {
  YoutubePlayerController? _youtubeController;

  VideoPlayerController? controller;
  ChewieController? chewieController;
  @override
  void initState() {
    super.initState();

    _initPlayer();

    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.data.url) ?? '',
      flags: YoutubePlayerFlags(
        hideControls: true,
        autoPlay: false,
        mute: true,
        disableDragSeek: true,
      ),
    );
  }

  Future _initPlayer() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.data.url!));
    await controller!.initialize().then((value) {
      chewieController = ChewieController(
        // aspectRatio: 16 / 9,
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
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/fullViewDrone', extra: {
          "projectId": widget.projectId,
          "projectName": widget.data.name!,
          "videoUrl": widget.data.details.provider == "VIMEO"
              ? widget.data.shareUrl
              : widget.data.url,
          "provider": widget.data.details.provider
        });
      },
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(fit: StackFit.loose, children: [
          widget.data.url != null
              ? ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  child: Stack(alignment: Alignment.center, children: [
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: widget.data.details.provider == "PROGRESSCENTER"
                          ? chewieController != null &&
                                  chewieController!
                                      .videoPlayerController.value.isInitialized
                              ? Chewie(
                                  controller: chewieController!,
                                )
                              : SizedBox()
                          : widget.data.details.provider == "YOUTUBE"
                              ? YoutubePlayer(
                                  controller: _youtubeController!,
                                )
                              : Container(
                                  color: Helper.baseBlack,
                                  child: Center(
                                    child: SvgPicture.asset(
                                        'assets/images/vimeo.svg',
                                        height: 24,
                                        color: Colors.white),
                                  ),
                                ),
                    ),
                    widget.data.details.provider == "VIMEO"
                        ? SizedBox()
                        : widget.data.details.provider == "YOUTUBE"
                            ? SvgPicture.asset(
                                'assets/images/youtube.svg',
                              )
                            : Icon(Icons.play_circle_outline_outlined,
                                color: Colors.white, size: 44),
                  ]))
              : ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  child: Image.asset(
                    'assets/images/error_image.jpeg',
                    fit: BoxFit.fill,
                    height: 264.h,
                  ),
                ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromRGBO(246, 246, 246, 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.data.name!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: -0.3,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Helper.baseBlack,
                        ),
                      ),
                      Text(
                        showDate(widget.data.createdAt.toIso8601String(),
                            'dd MMM yyyy'),
                        style: TextStyle(
                          letterSpacing: -0.3,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Helper.baseBlack.withOpacity(0.5),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

showDate(date, dateFormat) {
  DateTime parsedDate = DateTime.parse(date);
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
