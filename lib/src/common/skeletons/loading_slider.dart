import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingSlider extends StatefulWidget {
  const LoadingSlider({super.key});

  @override
  State<LoadingSlider> createState() => _LoadingSliderState();
}

class _LoadingSliderState extends State<LoadingSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
            aspectRatio: 16 / 9, child: Skeleton(variant: "rectangular")),
        SizedBox(height: 20.h),
        Skeleton(
            variant: "text",
            height: 4.h,
            borderRadius: 100.r,
            width: MediaQuery.of(context).size.width * 0.9),
      ],
    );
  }
}
