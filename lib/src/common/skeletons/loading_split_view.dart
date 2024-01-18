import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingSplitView extends StatelessWidget {
  const LoadingSplitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 150.h),
      child: Column(children: [
        Stack(children: [
          Container(
            color: Helper.textColor300,
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Skeleton(
                variant: "rectangular",
                // height: 250.h,
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
        ]),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              height: 44.h,
              decoration: BoxDecoration(
                  color: Helper.widgetBackground,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Skeleton(
                variant: 'text',
                width: 80.w,
                height: 10.h,
                borderRadius: 8.r,
              ),
            ),
            Container(
              height: 44.h,
              decoration: BoxDecoration(
                  color: Helper.widgetBackground,
                  borderRadius: BorderRadius.circular(8.r)),
              child: Skeleton(
                variant: 'text',
                width: 80.w,
                height: 10.h,
                borderRadius: 8.r,
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
