import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingCardListScreen extends StatelessWidget {
  const LoadingCardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: ((context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.width - 2 * 20.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Stack(
                  fit: StackFit.loose,
                  alignment: Alignment.topCenter,
                  children: [
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: CarouselSlider.builder(
                          itemCount: 1,
                          options: CarouselOptions(
                            // height: 198.h,
                            viewportFraction: 1,
                            aspectRatio: 1 / 1,
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
                  ]),
            ),
            SizedBox(
              height: 10.h,
            ),
            Skeleton(
              variant: "text",
              height: 20.h,
              width: 90.w,
              borderRadius: 5.r,
            ),
            SizedBox(
              height: 5.h,
            ),
            Skeleton(
              variant: "text",
              height: 15.h,
              width: 150.w,
              borderRadius: 5.r,
            ),
          ],
        );
      }),
    );
  }
}
