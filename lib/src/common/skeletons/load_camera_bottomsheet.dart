import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadCameraBottomsheet extends StatelessWidget {
  const LoadCameraBottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              Expanded(
                  child: Column(children: [
                Skeleton(
                  variant: "text",
                  height: 10.h,
                  width: 60.w,
                  borderRadius: 15.r,
                ),
              ])),
            ],
          ),
          SizedBox(height: 24.h),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: ((context, index) {
                return Container(
                  height: 44.h,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      decoration: BoxDecoration(
                        // color: Helper.bottomIconBack,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: Skeleton(
                        variant: "text",
                        height: 30.h,
                        width: 30.w,
                        borderRadius: 15.r,
                      ),
                    ),
                    title: Skeleton(
                      variant: "text",
                      height: 10.h,
                      width: 30.w,
                      borderRadius: 15.r,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
