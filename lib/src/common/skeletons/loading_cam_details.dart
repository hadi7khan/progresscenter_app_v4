import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingCamDetails extends StatefulWidget {
  final bool showCalendarList;
  final double topPadding;
  const LoadingCamDetails(
      {super.key, required this.showCalendarList, required this.topPadding});

  @override
  State<LoadingCamDetails> createState() => _LoadingCamDetailsState();
}

class _LoadingCamDetailsState extends State<LoadingCamDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: widget.topPadding,
          ),
          Stack(children: [
            Container(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Skeleton(
                  variant: "rectangular",
                  borderRadius: 16.r,
                ),
              ),
            ),
            Positioned(
                top: 16,
                left: 16,
                child: Skeleton(
                    variant: "rectangular",
                    borderRadius: 30.r,
                    width: 128.w,
                    height: 30.h)),
          ]),
          SizedBox(height: 6.h),
          SizedBox(
            height: 73.h,
            child: ListView.separated(
                separatorBuilder: (context, builder) {
                  return SizedBox(
                    width: 2.w,
                  );
                },
                itemCount: 10,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4.r),
                              child: Skeleton(
                                variant: "rectangular",
                                height: 44.h,
                                width: 44.w,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 6.h,
                          ),
                          Skeleton(
                            variant: "text",
                            height: 5.h,
                            width: 30.w,
                            borderRadius: 15.r,
                          )
                        ]),
                  );
                })),
          ),
          widget.showCalendarList
              ? SizedBox(
                  height: 74.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 14.h),
                          child: Skeleton(
                              variant: "rectangular", height: 54, width: 54)),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.zero,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                              ),
                              child: Stack(children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 12.h),
                                  child: Column(
                                    children: [
                                      Skeleton(
                                        variant: "rectangular",
                                        height: 19.h,
                                        width: 22.w,
                                        borderRadius: 15.r,
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      Skeleton(
                                        variant: "rectangular",
                                        height: 5.h,
                                        width: 34.w,
                                        borderRadius: 15.r,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox()
        ]);
  }
}
