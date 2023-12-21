import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:vimeo_player_flutter/vimeo_player_flutter.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DroneListViewWidget extends StatefulWidget {
  final data;
  const DroneListViewWidget({super.key, this.data});

  @override
  State<DroneListViewWidget> createState() => _DroneListViewWidgetState();
}

class _DroneListViewWidgetState extends State<DroneListViewWidget> {
  VlcPlayerController? _videoPlayerController;
  YoutubePlayerController? _youtubeController;
  // WebViewController? _vimeoController;
  String videoId = "";

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VlcPlayerController.network(
      widget.data.url,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
    // videoId = YoutubePlayer.convertUrlToId(url);
    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.data.url) ?? '',
      flags: YoutubePlayerFlags(
        hideControls: true,
        autoPlay: false,
        mute: false,
        disableDragSeek: true,
      ),
    );

    
  }

  String extractVimeoVideoId(String videoUrl) {
    Uri uri = Uri.parse(videoUrl);
    print("videoUrl-----" + videoUrl.toString());
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

  @override
  Widget build(BuildContext context) {
    if (widget.data.details.provider == "VIMEO") {
      String videoId = extractVimeoVideoId(widget.data.url);
      print("videoId-----" + videoId.toString());
    }
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 264.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child:
          Stack(fit: StackFit.loose, alignment: Alignment.topCenter, children: [
        widget.data.url != null
            ? ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Stack(alignment: Alignment.center, children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: widget.data.details.provider == "PROGRESSCENTER"
                        ? VlcPlayer(
                            controller: _videoPlayerController!,
                            aspectRatio: 16 / 9,
                            placeholder:
                                Center(child: CircularProgressIndicator()),
                          )
                        : widget.data.details.provider == "YOUTUBE"
                            ? YoutubePlayer(
                                controller: _youtubeController!,
                              )
                            :
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
                            VimeoVideoPlayer(
                                url: widget.data.shareUrl,
                                autoPlay: true
                              ),
                    // VimeoPlayer(videoId: extractVimeoVideoId(widget.data.url)),
                  ),
                  Positioned(
                      top: 83,
                      child: Icon(Icons.play_circle_outline_outlined,
                          color: Colors.white, size: 44))
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
          // bottom: 20,
          // left: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 88.h,
                width: double.infinity,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(20.w),
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
                          width: MediaQuery.of(context).size.width * 0.5,
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
                        // SizedBox(
                        //   height: 6.h,
                        // ),
                        Text(
                          showDate(widget.data.createdAt.toIso8601String(),
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
                    TextButton(
                        onPressed: () {
                          context.push('/fullViewDrone', extra: {"projectId": widget.data.project.id, "projectName": widget.data.name!, "videoUrl": widget.data.url});
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: Text(
                          "View",
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 14.sp,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                )),
          ),
        ),
      ]),
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
