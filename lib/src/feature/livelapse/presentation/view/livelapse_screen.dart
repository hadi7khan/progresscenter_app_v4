import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LivelapseScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const LivelapseScreen(
      {super.key, required this.projectId, required this.projectName});

  @override
  State<LivelapseScreen> createState() => _LivelapseScreenState();
}

class _LivelapseScreenState extends State<LivelapseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 12.0.w,
              leading: SvgPicture.asset(
                'assets/images/arrow-left.svg',
              ),
              leadingWidth: 24,
              title: Text(
                "Livelapse",
                style: TextStyle(
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actions: [
                SvgPicture.asset('assets/images/sort.svg'),
                SizedBox(width: 12.w),
                SvgPicture.asset('assets/images/plus.svg'),
              ],
              actionsIconTheme: IconThemeData(color: Helper.iconColor),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: Column(children: [
                ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemCount: 5,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 20.h);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.r),
                                    child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          AspectRatio(
                                            aspectRatio: 16 / 9,
                                            child: Image.network(
                                              "https://dzcod3r4qkmhl.cloudfront.net/6699/previews/20191224145446.jpg",
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
                                                return ClipRRect(
                                                  child: Image.asset(
                                                    'assets/images/error_image.jpeg',
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Positioned(
                                              top: 25,
                                              child: Icon(
                                                  Icons
                                                      .play_circle_outline_outlined,
                                                  color: Colors.white
                                                      .withOpacity(0.3),
                                                  size: 24))
                                        ]))
                                // : ClipRRect(
                                //     borderRadius: BorderRadius.circular(16.r),
                                //     child: Image.asset(
                                //       'assets/images/error_image.jpeg',
                                //       fit: BoxFit.fill,
                                //       height: 264.h,
                                //     ),
                                //   ),
                                ),
                            Expanded(flex: 6, child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                Text("By Yafer Nazir", style: TextStyle(color: Helper.baseBlack, fontSize: 14.sp, fontWeight: FontWeight.w500)),
                                Text("2 days · 20-24 Mar, 2023", style: TextStyle(color: Helper.baseBlack.withOpacity(0.5), fontSize: 12.sp, fontWeight: FontWeight.w400)),
                                SizedBox(height: 12.h,),
                                Text("EXPIRED", style: TextStyle(color: Helper.textColor400, fontSize: 8.sp, fontWeight: FontWeight.w600))
                              ],),
                            ))
                          ],
                        ),
                      );
                    })
              ]),
            ),
          ),
        ));
  }
}
