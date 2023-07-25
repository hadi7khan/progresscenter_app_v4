import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatefulWidget {
  final String variant;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? fontSize;
  const Skeleton({super.key, required this.variant, this.width, this.height, this.borderRadius, this.fontSize});

  @override
  State<Skeleton> createState() => _SkeletonState();
}

class _SkeletonState extends State<Skeleton> {
  @override
  Widget build(BuildContext context) {
    if (widget.variant == 'text') {
      return Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            color: Colors.grey[200],
          ),
          child: Text(''),
        ),
      );
    } else if (widget.variant == 'circular') {
      return Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
      );
    } else if (widget.variant == 'rectangular') {
      return Shimmer.fromColors(
        baseColor: Colors.grey[100]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius ?? 0),
            color: Colors.grey[200],
          ),
        ),
      );
    } else {
      return Container(); // Render an empty container if variant is not recognized
    }
  }
  }
