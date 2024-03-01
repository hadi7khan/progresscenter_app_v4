import 'package:flutter/material.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingSlider extends StatefulWidget {
  const LoadingSlider({super.key});

  @override
  State<LoadingSlider> createState() => _LoadingSliderState();
}

class _LoadingSliderState extends State<LoadingSlider> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 16 / 9, child: Skeleton(variant: "rectangular"));
  }
}
