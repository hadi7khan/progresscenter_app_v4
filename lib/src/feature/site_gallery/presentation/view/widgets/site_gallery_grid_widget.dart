import 'package:chewie/chewie.dart';
import 'package:extended_image/extended_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/video_player_widget.dart';
import 'package:video_player/video_player.dart';

class SiteGalleryGridViewWidget extends StatefulWidget {
  final data;
  final projectName;
  final String projectId;
  const SiteGalleryGridViewWidget(
      {super.key, this.data, this.projectName, required this.projectId});

  @override
  State<SiteGalleryGridViewWidget> createState() =>
      _SiteGalleryGridViewWidgetState();
}

class _SiteGalleryGridViewWidgetState extends State<SiteGalleryGridViewWidget> {
  VideoPlayerController? controller;
  ChewieController? chewieController;
  Image? image1;

  Future _initPlayer() async {
    controller = VideoPlayerController.networkUrl(Uri.parse(widget.data.url!));
    await controller!.initialize().then((value) {
      chewieController = ChewieController(
        aspectRatio: 1 / 1,
        videoPlayerController: controller!,
        autoPlay: true,
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
        context.push('/fullViewSitegallery', extra: {
          "projectId": widget.projectId,
          "name": widget.data.name,
          "url": widget.data.url,
          "type": widget.data.type,
          "siteGalleryId": widget.data.id,
          "projectName": widget.projectName,
          "createdAt": widget.data.createdAt,
          "uploadedBy": widget.data.user.name
        });
      },
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(1.r),
        ),
        child: Stack(fit: StackFit.loose, children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(1.r),
              topRight: Radius.circular(1.r),
              bottomLeft: Radius.circular(1.r),
              bottomRight: Radius.circular(1.r),
            ),
            child: Stack(alignment: Alignment.center, children: [
              AspectRatio(
                  aspectRatio: 1 / 1,
                  child: widget.data.type == "IMAGE"
                      ? ExtendedImage.network(
                          widget.data.url!,
                          fit: BoxFit.cover,
                          cacheWidth: 200,
                          cacheHeight: 200,
                          cache: true,
                          clearMemoryCacheWhenDispose: true,
                          cacheKey: widget.data.id,
                          retries: 3,
                          loadStateChanged: (ExtendedImageState state) {
                            switch (state.extendedImageLoadState) {
                              case LoadState.loading:
                                return SizedBox();
                              case LoadState.failed:
                                SchedulerBinding.instance
                                    .addPostFrameCallback((Duration timeStamp) {
                                  state.reLoadImage();
                                });
                              case LoadState.completed:
                                return ExtendedRawImage(
                                  image: state.extendedImageInfo?.image,
                                );
                            }
                          },
                        )
                      : VideoPlayerWidget(data: widget.data))
            ]),
          ),
        ]),
      ),
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
