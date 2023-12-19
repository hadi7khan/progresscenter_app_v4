import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AddDroneContainer extends StatefulWidget {
  final String svgPath;
  final String title;
  final String subTitle;
  const AddDroneContainer(
      {super.key,
      required this.svgPath,
      required this.title,
      required this.subTitle});

  @override
  State<AddDroneContainer> createState() => _AddDroneContainerState();
}

class _AddDroneContainerState extends State<AddDroneContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      // height: 72,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Helper.textColor300),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(widget.svgPath, width: 24.w, height: 24.h),
            SizedBox(height: 10.h),
            Text(widget.title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Helper.baseBlack,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600)),
            Text(widget.subTitle,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Helper.textColor400,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500)),
          ]),
    );
  }
}
