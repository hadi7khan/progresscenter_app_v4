import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class FullViewSitegalleryScreen extends StatefulWidget {
  final String projectId;
  final String name;
  final String url;
  final String type;
  const FullViewSitegalleryScreen({
    super.key,
    required this.projectId,
    required this.name,
    required this.url,
    required this.type,
  });

  @override
  State<FullViewSitegalleryScreen> createState() =>
      _FullViewSitegalleryScreenState();
}

class _FullViewSitegalleryScreenState extends State<FullViewSitegalleryScreen> {
  VlcPlayerController? _videoPlayerController;
  @override
  void initState() {
    super.initState();
    if (widget.type == "VIDEO") {
      _videoPlayerController = VlcPlayerController.network(
        widget.url,
        autoPlay: true,
        options: VlcPlayerOptions(),
      );
    }
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
          child: Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.6,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Stack(alignment: Alignment.center, children: [
                  widget.type == "IMAGE"
                      ? Image.network(
                          widget.url,
                          fit: BoxFit.fill,
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
                      : AspectRatio(
                        aspectRatio: 16 / 9,
                        child: VlcPlayer(
                          controller: _videoPlayerController!,
                          aspectRatio: 16 / 9,
                          placeholder:
                              Center(child: CircularProgressIndicator()),
                        ),
                      ),
                ])),
          ),
        ),
      ),
    );
  }
}
