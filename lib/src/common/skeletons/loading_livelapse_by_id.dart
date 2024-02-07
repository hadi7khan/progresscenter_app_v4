import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingLivelapseById extends StatefulWidget {
  const LoadingLivelapseById({super.key});

  @override
  State<LoadingLivelapseById> createState() => _LoadingUserProfileState();
}

class _LoadingUserProfileState extends State<LoadingLivelapseById> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 12.0.w,
              leadingWidth: 24,
              title: Skeleton(
                variant: "text",
                height: 20.h,
                width: 90.w,
                borderRadius: 5.r,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: AspectRatio(
              aspectRatio: 16 / 9, child: Skeleton(variant: "rectangular")),
        ),
      ),
    );
  }
}
