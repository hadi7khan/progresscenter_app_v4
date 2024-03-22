import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/widgets/drone_actions_widget.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DroneListViewWidget extends StatefulWidget {
  final data;
  final String projectId;
  const DroneListViewWidget({super.key, this.data, required this.projectId});

  @override
  State<DroneListViewWidget> createState() => _DroneListViewWidgetState();
}

class _DroneListViewWidgetState extends State<DroneListViewWidget> {
  VlcPlayerController? _videoPlayerController;
  YoutubePlayerController? _youtubeController;
  String videoId = "";
  VideoPlayerController? controller;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();

    _initPlayer();

    // videoId = YoutubePlayer.convertUrlToId(url);
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

  @override
  void dispose() {
    super.dispose();
  }

  String extractVimeoVideoId(String videoUrl) {
    Uri uri = Uri.parse(videoUrl);
    String videoId = uri.queryParameters['video_id'] ?? '';
    if (videoId.isNotEmpty) {
      return videoId;
    }

    RegExp regExp = RegExp(r'player\.vimeo\.com\/video\/(\d+)');
    Match? match = regExp.firstMatch(videoUrl);

    if (match != null) {
      return match.group(1) ?? '';
    } else {
      return '';
    }
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
    if (widget.data.details.provider == "VIMEO") {
      String videoId = extractVimeoVideoId(widget.data.url);
    }
    return InkWell(
      highlightColor: Colors.transparent,
      onLongPress: () {
        showModalBottomSheet(
            useRootNavigator: true,
            isScrollControlled: true,
            context: context,
            backgroundColor: Colors.transparent,
            builder: (context) => DroneActionsWidget(
                  name: widget.data.name!,
                  projectId: widget.projectId,
                  droneFootageId: widget.data.id,
                  location: widget.data.location.name,
                ));
      },
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
        height: 264.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topCenter,
            children: [
              widget.data.url != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r)),
                      child: Stack(alignment: Alignment.center, children: [
                        AspectRatio(
                          aspectRatio: 16 / 9,
                          child:
                              widget.data.details.provider == "PROGRESSCENTER"
                                  ? chewieController != null &&
                                          chewieController!
                                              .videoPlayerController
                                              .value
                                              .isInitialized
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
                          // PodVideoPlayer(
                          //     controller: controller!,
                          // videoThumbnail: const DecorationImage(
                          //   /// load from asset: AssetImage('asset_path')
                          //   image: NetworkImage(
                          //     'https://images.unsplash.com/photo-1569317002804-ab77bcf1bce4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dW5zcGxhc2h8ZW58MHx8MHx8&w=1000&q=80',
                          //   ),
                          //   fit: BoxFit.cover,
                          // ),
                          // ),
                          // VimeoVideoPlayer(
                          //     url: widget.data.shareUrl,
                          //     autoPlay: false),
                          // VimeoPlayer(videoId: extractVimeoVideoId(widget.data.url)),
                        ),
                        widget.data.details.provider == "VIMEO"
                            ? SizedBox()
                            : widget.data.details.provider == "YOUTUBE"
                                ? SvgPicture.asset(
                                    'assets/images/youtube.svg',
                                  )
                                : Positioned(
                                    top: 83,
                                    child: Icon(
                                        Icons.play_circle_outline_outlined,
                                        color: Colors.white,
                                        size: 44),
                                  ),
                      ]))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
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
                      height: 88.h,
                      width: double.infinity,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Color.fromRGBO(246, 246, 246, 1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                // width: MediaQuery.of(context).size.width * 0.5,
                                child: Text(
                                  widget.data.name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    letterSpacing: -0.3,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Helper.baseBlack,
                                  ),
                                ),
                              ),
                              Text(
                                showDate(
                                    widget.data.createdAt.toIso8601String(),
                                    'dd MMM yyyy'),
                                style: TextStyle(
                                  letterSpacing: -0.3,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Helper.baseBlack.withOpacity(0.5),
                                ),
                              ),
                            ],
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
