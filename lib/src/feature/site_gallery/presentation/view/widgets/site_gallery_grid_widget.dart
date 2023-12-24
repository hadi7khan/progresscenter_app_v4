import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SiteGalleryGridViewWidget extends StatefulWidget {
  final data;
  const SiteGalleryGridViewWidget({super.key, this.data});

  @override
  State<SiteGalleryGridViewWidget> createState() =>
      _SiteGalleryGridViewWidgetState();
}

class _SiteGalleryGridViewWidgetState extends State<SiteGalleryGridViewWidget> with AutomaticKeepAliveClientMixin{
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
  bool get wantKeepAlive => true;

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
        // height: 264.h,
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
                    ? CachedNetworkImage(
                        imageUrl: widget.data.url!,
                        fit: BoxFit.cover,
                        // placeholder: (context, url) =>
                        //     CircularProgressIndicator(),
                        errorWidget: (context, url, error) => ClipRRect(
                          child: Image.asset(
                            'assets/images/error_image.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    // Image.network(
                    //     widget.data.url!,
                    //     // height: MediaQuery.of(context).size.height,
                    //     // width: MediaQuery.of(context).size.width,
                    //     fit: BoxFit.cover,
                    //     errorBuilder: (BuildContext context, Object exception,
                    //         StackTrace? stackTrace) {
                    //       return ClipRRect(
                    //         child: Image.asset(
                    //           'assets/images/error_image.jpeg',
                    //           fit: BoxFit.cover,
                    //         ),
                    //       );
                    //     },
                    //   )
                    : Stack(
                        alignment: Alignment.center,
                        children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: VlcPlayer(
                              controller: _videoPlayerController!,
                              aspectRatio: 16 / 9,
                              placeholder:
                                  Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          Positioned(
                              top: 83,
                              child: Icon(Icons.play_circle_outline_outlined,
                                  color: Colors.white, size: 44))
                        ],
                      ),
              )
            ]),
          ),
          // Positioned.fill(
          //   // bottom: 20,
          //   // left: 20,
          //   child: Align(
          //     alignment: Alignment.bottomCenter,
          //     child: Container(
          //         // height: 88.h,
          //         width: double.infinity,
          //         margin: EdgeInsets.zero,
          //         padding: EdgeInsets.all(12.w),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(15.r),
          //             color: Color.fromRGBO(246, 246, 246, 1)),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Text(
          //               widget.data.name!,
          //               overflow: TextOverflow.ellipsis,
          //               style: TextStyle(
          //                 letterSpacing: -0.3,
          //                 fontSize: 14.sp,
          //                 fontWeight: FontWeight.w500,
          //                 color: Helper.baseBlack,
          //               ),
          //             ),
          //             // SizedBox(
          //             //   height: 6.h,
          //             // ),
          //             Text(
          //               showDate(widget.data.createdAt!.toIso8601String(),
          //                   'dd MMM yyyy'),
          //               style: TextStyle(
          //                 letterSpacing: -0.3,
          //                 fontSize: 12.sp,
          //                 fontWeight: FontWeight.w400,
          //                 color: Helper.baseBlack.withOpacity(0.5),
          //               ),
          //             ),
          //           ],
          //         )),
          //   ),
          // ),
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
