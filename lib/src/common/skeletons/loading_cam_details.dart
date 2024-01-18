import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingCamDetails extends StatelessWidget {
  const LoadingCamDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Stack(children: [
            Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height -
                  (Scaffold.of(context).appBarMaxHeight!.toDouble() +
                      kBottomNavigationBarHeight +
                      184.h),
              padding: EdgeInsets.zero,
              child: Center(
                child: Skeleton(
                  variant: "rectangular",
                  height: 250.h,
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: BlurryContainer(
                  blur: 3,
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                  borderRadius: BorderRadius.circular(30.r),
                  color: Helper.widgetBackground,
                  child: Row(
                    children: [
                      Skeleton(
                        variant: "rectangular",
                        borderRadius: 16.r,
                        width: 12,
                        height: 12,
                      ),
                      SizedBox(width: 4.w),
                      Skeleton(
                        variant: 'text',
                        width: 60.w,
                        height: 10.h,
                        borderRadius: 8.r,
                      ),
                    ],
                  )),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: BlurryContainer(
                blur: 3,
                padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 6.w),
                borderRadius: BorderRadius.circular(30.r),
                color: Helper.widgetBackground,
                child: Skeleton(
                  variant: "rectangular",
                  borderRadius: 16.r,
                  width: 18,
                  height: 18,
                ),
              ),
            ),
          ]),
          SizedBox(
            height: 76.h,
            child: ListView.separated(
                separatorBuilder: (context, builder) {
                  return SizedBox(
                    width: 2.w,
                  );
                },
                itemCount: 10,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.zero,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        height: 45.h,
                        width: 45.w,
                        child: Container(
                          padding: EdgeInsets.zero,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: Helper.widgetBackground,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: Skeleton(
                              variant: "rectangular",
                              borderRadius: 16.r,
                              height: 30.h,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Skeleton(
                        variant: 'text',
                        width: 20.w,
                        height: 10.h,
                        borderRadius: 8.r,
                      ),
                    ]),
                  );
                })),
          ),
          SizedBox(
            height: 74.h,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Helper.widgetBackground,
                      borderRadius: BorderRadius.circular(8.r)),
                  height: 40,
                  width: 40,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 14.h),
                  child: Skeleton(
                    variant: 'text',
                    width: 40.w,
                    height: 10.h,
                    borderRadius: 8.r,
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                    child: ListView.separated(
                  separatorBuilder: (context, builder) {
                    return SizedBox(
                      width: 2.w,
                    );
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.zero,
                      height: 40,
                      width: 30,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Helper.widgetBackground,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 12.h),
                          child: Column(
                            children: [
                              Skeleton(
                                variant: 'text',
                                width: 30.w,
                                height: 20.h,
                                borderRadius: 8.r,
                              ),
                              SizedBox(height: 10),
                              Skeleton(
                                variant: 'text',
                                width: 60.w,
                                height: 10.h,
                                borderRadius: 8.r,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )),
              ],
            ),
          )
        ]);
  }
}
