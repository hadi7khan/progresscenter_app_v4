import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SiteGalleryListViewWidget extends StatefulWidget {
  final data;
  const SiteGalleryListViewWidget({super.key, this.data});

  @override
  State<SiteGalleryListViewWidget> createState() =>
      _SiteGalleryListViewWidgetState();
}

class _SiteGalleryListViewWidgetState extends State<SiteGalleryListViewWidget> {
  VlcPlayerController? _videoPlayerController;
  @override
  void initState() {
    super.initState();
    if (widget.data.type == "VIDEO") {
      _videoPlayerController = VlcPlayerController.network(
        widget.data.url,
        autoPlay: false,
        options: VlcPlayerOptions(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/fullViewSitegallery', extra: {
          "projectId": widget.data.project,
          "name": widget.data.name,
          "url": widget.data.url,
          "type": widget.data.type
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
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  child: Stack(alignment: Alignment.center, children: [
                    widget.data.type == "IMAGE"
                        ? Image.network(
                            widget.data.url!,
                            fit: BoxFit.fill,
                            gaplessPlayback: true,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return ClipRRect(
                                child: Image.asset(
                                  'assets/images/error_image.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              );
                            },
                          )
                        : Stack(
                            alignment: Alignment.center,
                            children: [
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: VlcPlayer(
                                  controller: _videoPlayerController!,
                                  aspectRatio: 16 / 9,
                                  placeholder: Center(
                                      child: CircularProgressIndicator()),
                                ),
                              ),
                              Positioned(
                                  top: 83,
                                  child: Icon(
                                      Icons.play_circle_outline_outlined,
                                      color: Colors.white,
                                      size: 44))
                            ],
                          ),
                  ])),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 88.h,
                      width: double.infinity,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
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
                                child: Text(
                                  widget.data.name!,
                                  softWrap: true,
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
                                    widget.data.createdAt!.toIso8601String(),
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
  // Parse the installationDate string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
