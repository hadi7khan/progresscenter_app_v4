import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class IconBottomBar extends StatefulWidget {
  final String text;
  final String icon;
  final bool selected;
  const IconBottomBar({
    super.key,
    required this.text,
    required this.icon,
    required this.selected,
  });

  @override
  State<IconBottomBar> createState() => _IconBottomBarState();
}

class _IconBottomBarState extends State<IconBottomBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(widget.icon, color: Helper.textColor700),
          Text(
            widget.text,
            style: TextStyle(
              color: Helper.textColor700,
              fontSize: 11.sp,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}
