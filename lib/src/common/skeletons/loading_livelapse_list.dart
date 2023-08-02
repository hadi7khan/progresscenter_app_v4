import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingLivelapseList extends StatefulWidget {
  const LoadingLivelapseList({super.key});

  @override
  State<LoadingLivelapseList> createState() => _LoadingLivelapseListState();
}

class _LoadingLivelapseListState extends State<LoadingLivelapseList> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: 10,
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
                        child: Stack(alignment: Alignment.center, children: [
                          AspectRatio(
                            aspectRatio: 16 / 9,
                            child: Skeleton(
                              variant: "rectangular",
                              borderRadius: 8.r,
                            ),
                          ),
                          Positioned(
                              top: 26,
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 7.w,
                                    top: 5.45.h,
                                    bottom: 5.45.h,
                                    right: 5.w),
                                height: 24.h,
                                width: 24.w,
                                decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.3),
                                    borderRadius:
                                        BorderRadius.circular(24.r)),
                                child: Skeleton(
                                  // height: 13,
                                  // width: 13,
                                  variant: 'rectangular',
                                ),
                              ))
                        ])),
                  ),
                  Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Skeleton(
                              variant: "text",
                              height: 10.h,
                              width: 128.w,
                              borderRadius: 15.r,
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Skeleton(
                              variant: "text",
                              height: 8.h,
                              width: 144.w,
                              borderRadius: 15.r,
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Skeleton(
                              variant: "text",
                              height: 6.h,
                              width: 39.w,
                              borderRadius: 15.r,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            );
          })
    ]);
  }
}
