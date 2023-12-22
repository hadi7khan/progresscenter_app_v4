import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/presentation/view/widgets/cctv_widget.dart';

class FullViewCCTVScreen extends StatefulWidget {
  final String projectId;
  final String name;
  final String streamingUrl;
  // final String type;
  const FullViewCCTVScreen({
    super.key,
    required this.projectId,
    required this.name,
    required this.streamingUrl,
  });

  @override
  State<FullViewCCTVScreen> createState() => _FullViewCCTVScreenState();
}

class _FullViewCCTVScreenState extends State<FullViewCCTVScreen> {
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
                  CCTVWidget(url: widget.streamingUrl,)
                ])),
          ),
        ),
      ),
    );
  }
}
