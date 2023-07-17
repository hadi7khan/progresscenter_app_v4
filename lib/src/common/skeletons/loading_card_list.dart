import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingCardListScreen extends StatefulWidget {
  const LoadingCardListScreen({super.key});

  @override
  State<LoadingCardListScreen> createState() => _LoadingCardListScreenState();
}

class _LoadingCardListScreenState extends State<LoadingCardListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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
          height: 264.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
              fit: StackFit.loose,
              alignment: Alignment.topCenter,
              children: [
                Positioned.fill(
                  // top: 0,
                  // left: 0,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: CarouselSlider.builder(
                      itemCount: 1,
                      options: CarouselOptions(
                        // height: 198.h,
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                        initialPage: 0,
                        autoPlay: false,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ),
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Container(
                              width: double.infinity,
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Color.fromRGBO(235, 235, 235, 1),
                              ),
                              child: Skeleton(
                                variant: "rectangular",
                                borderRadius: 16.r,
                              )),
                    ),
                  ),
                ),
                Positioned.fill(
                  bottom: 7,
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
                                Skeleton(
                                    variant: 'text',
                                    width: 80.w,
                                    height: 15.h,
                                    borderRadius: 8.r),
                                SizedBox(
                                  height: 6.h,
                                ),
                                Skeleton(
                                  variant: 'text',
                                  width: 60.w,
                                  height: 10.h,
                                  borderRadius: 8.r,
                                ),
                              ],
                            ),
                            Skeleton(
                              variant: 'rectangular',
                              borderRadius: 8.r,
                              width: 50.w,
                              height: 30.h,
                            ),
                          ],
                        )),
                  ),
                ),
              ]),
        );
      }),
    );
  }
}
