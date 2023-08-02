import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingAppBar extends StatefulWidget {
  const LoadingAppBar({super.key});

  @override
  State<LoadingAppBar> createState() => _LoadingAppBarState();
}

class _LoadingAppBarState extends State<LoadingAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Skeleton(
            variant: "text",
            height: 13.h,
            width: 161.w,
            borderRadius: 20.r,
          ),
          SizedBox(height: 3.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Skeleton(
                variant: "text",
                height: 10.h,
                width: 92.w,
                borderRadius: 20.r,
              ),
              
            ],
          )
        ]);
  }
}
