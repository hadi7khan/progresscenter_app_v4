import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingCompare extends StatelessWidget {
  const LoadingCompare({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
      ]),
      SizedBox(height: 6.h),
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
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
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
    ]);
  }
}
