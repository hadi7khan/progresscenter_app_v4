import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

class ProjectDetailsScreen extends StatefulWidget {
  final String label;
  final String projectId;
  final String projectName;
  const ProjectDetailsScreen({
    super.key,
    required this.label,
    required this.projectId,
    required this.projectName,
  });

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  int? _currentIndex;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Container(
                height: 24.h,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () => context.pop(),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                widget.projectName,
                style: TextStyle(
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
          SizedBox(height: 30.h),
          Stack(fit: StackFit.loose, alignment: Alignment.center, children: [
            CarouselSlider.builder(
              itemCount: 4,
              options: CarouselOptions(
                  height: 284.h,
                  viewportFraction: 1,
                  initialPage: 0,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index;
                    });
                  }),
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(bottom: 15.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.r),
                            color: Color.fromRGBO(235, 235, 235, 1),
                          ),
                          child:
                              // data[index].images!.isNotEmpty
                              //     ?
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(16.r),
                                  child: Image.network(
                                    "https://www.kasandbox.org/programming-images/avatars/piceratops-ultimate.png",
                                    fit: BoxFit.cover,
                                  ))
                          // : SizedBox(),
                          ),
            ),
            Positioned(
              top: 20,
              left: 20,
              child: BlurryContainer(
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                  blur: 3,
                      borderRadius: BorderRadius.circular(30.r),
                      color: Colors.white.withOpacity(0.1),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/ai.svg'),
                      SizedBox(width: 4.w),
                      Text("AI enhanced",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                    ],
                  )),
            ),
            // data[index].images!.isNotEmpty
            //     ?
            Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: DotsIndicator(
                  dotsCount: 4,
                  position: _currentIndex != null ? _currentIndex! : 0,
                  decorator: DotsDecorator(
                      color: Colors.white.withOpacity(0.6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.r)),
                      activeColor: Colors.white,
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r)),
                      size: Size(6, 6),
                      activeSize: Size(8, 8),
                      spacing: EdgeInsets.only(right: 6.w)),
                )),
            // : SizedBox(),
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
                            Text(
                              widget.projectName,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Helper.baseBlack,
                              ),
                            ),
                            // SizedBox(
                            //   height: 6.h,
                            // ),
                            Text(
                              widget.projectName,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Helper.baseBlack.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              // context.push(widget.detailsPath, extra: {"projectId": "projectId", "projectName": data[index].name!});
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                )),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: Text(
                              "Edit",
                              style: TextStyle(
                                  color: Helper.baseBlack,
                                  fontSize: 14.sp,
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    )),
              ),
            ),
          ]),
          SizedBox(height: 12.h),
          SizedBox(
            height: 58.h,
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          246,
                          246,
                          246,
                          1,
                        ),
                        borderRadius: BorderRadius.circular(12.r)),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.w),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.r)),
                          child: SvgPicture.asset('assets/images/updated.svg'),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Updated",
                              style: TextStyle(
                                  color: Helper.baseBlack.withOpacity(0.5),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text("9:00 AM · 12 Nov 2023",
                                style: TextStyle(
                                    color: Helper.baseBlack,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500))
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 12.w);
                },
                itemCount: 3),
          ),
          SizedBox(
            height: 24.h,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, ),
            decoration: BoxDecoration(
                color: Color.fromRGBO(
                  246,
                  246,
                  246,
                  1,
                ),
                borderRadius: BorderRadius.circular(12.r)),
            child: Column(children: [
              ListTile(
                dense: true,
                minVerticalPadding: 0,
                // visualDensity: VisualDensity(vertical: ,),
                contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: SvgPicture.asset('assets/images/timelapse.svg'),
                  ),
                  title: Text(
                    "Timelapse",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("2 Cameras active",
                      style: TextStyle(
                          color: Helper.baseBlack.withOpacity(0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400)),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Helper.textColor400)),
              Divider(thickness: 1,color: Helper.baseBlack.withOpacity(0.04),),
              ListTile(
                dense: true,
                minVerticalPadding: 0,
                // visualDensity: VisualDensity(vertical: -2,),
                contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: SvgPicture.asset('assets/images/drone_footage.svg'),
                  ),
                  title: Text(
                    "Drone Footage",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("2 Footages",
                      style: TextStyle(
                          color: Helper.baseBlack.withOpacity(0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400)),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Helper.textColor400)),
              Divider(thickness: 1,color: Helper.baseBlack.withOpacity(0.04),),
              ListTile(
                dense: true,
                minVerticalPadding: 0,
                // visualDensity: VisualDensity(vertical: -2,),
                contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: SvgPicture.asset('assets/images/cctv.svg'),
                  ),
                  title: Text(
                    "CCTV View",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("2 Cameras active",
                      style: TextStyle(
                          color: Helper.baseBlack.withOpacity(0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400)),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Helper.textColor400)),
              Divider(thickness: 1,color: Helper.baseBlack.withOpacity(0.04),),
              ListTile(
                dense: true,
                minVerticalPadding: 0,
                // visualDensity: VisualDensity(vertical: -2,),
                contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12.r)),
                    child: SvgPicture.asset('assets/images/camera_360.svg'),
                  ),
                  title: Text(
                    "360° Cameras",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Text("5 photos · 2 videos",
                      style: TextStyle(
                          color: Helper.baseBlack.withOpacity(0.5),
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400)),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Helper.textColor400)),
              
              // Row(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.all(10.w),
              //       decoration: BoxDecoration(
              //           color: Colors.white,
              //           borderRadius: BorderRadius.circular(12.r)),
              //       child: SvgPicture.asset('assets/images/timelapse.svg'),
              //     ),
              //     SizedBox(
              //       width: 8.w,
              //     ),
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text(
              //           "Timelapse",
              //           style: TextStyle(
              //               color: Helper.baseBlack,
              //               fontSize: 16.sp,
              //               fontWeight: FontWeight.w500),
              //         ),
              //         Text("2 Cameras active",
              //             style: TextStyle(
              //                 color: Helper.baseBlack.withOpacity(0.5),
              //                 fontSize: 14.sp,
              //                 fontWeight: FontWeight.w400))
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         Icon(Icons.arrow_forward_ios, color: Helper.textColor400)
              //       ],
              //     )
              //   ],
              // )
            ]),
          )
        ]),
      ))),
    );
  }
}
