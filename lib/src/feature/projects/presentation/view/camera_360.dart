import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class Camera360Screen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const Camera360Screen({super.key, required this.projectId, required this.projectName});

  @override
  State<Camera360Screen> createState() => _Camera360ScreenState();
}

class _Camera360ScreenState extends State<Camera360Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SingleChildScrollView(child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(children: [
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
                    "360° Cameras · 5",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  )
                ]),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // Container(
                    //   margin: EdgeInsets.zero,
                    //   height: 24.h,
                    //   child: IconButton(
                    //     padding: EdgeInsets.zero,
                    //     alignment: Alignment.centerLeft,
                    //     icon: SvgPicture.asset('assets/images/sort.svg'),
                    //     onPressed: () => context.pop(),
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.zero,
                      height: 24.h,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        icon: SvgPicture.asset('assets/images/grid_view.svg'),
                        onPressed: () => context.pop(),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Container(
                      //   height: 185.h,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(14.r),
                      //     color: Color.fromRGBO(235, 235, 235, 1),
                      //   ),
                      // ),
                      Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.center,
                          children: [
                            CarouselSlider.builder(
                              itemCount: 1,
                              options: CarouselOptions(
                                  height: 284.h,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  autoPlay: false,
                                  enlargeCenterPage: false,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    // setState(() {
                                    //   _currentIndex = index;
                                    // });
                                  }),
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(bottom: 15.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        color: Color.fromRGBO(235, 235, 235, 1),
                                      ),
                                      child:
                                          // data[index].images!.isNotEmpty
                                          //     ?
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.network(
                                                "https://placekitten.com/640/360",
                                                fit: BoxFit.cover,
                                              ))
                                      // : SizedBox(),
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
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                        color:
                                            Color.fromRGBO(246, 246, 246, 1)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "360 Hotel Room",
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
                                              "Installed · 12 Nov 2023",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Helper.baseBlack
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              // context.push('/details', extra: {"projectId": "projectId", "projectName": data[index].name!});
                                            },
                                            style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white)),
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
                    ],
                  ),
                );
              }),
            )
          ]),
    ))),);
  }
}