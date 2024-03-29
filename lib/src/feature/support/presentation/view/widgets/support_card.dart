import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SupportCard extends StatefulWidget {
  final supportData;
  const SupportCard({super.key, required this.supportData});

  @override
  State<SupportCard> createState() => _SupportCardState();
}

class _SupportCardState extends State<SupportCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Helper.widgetBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 7.h),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(4.r)),
          child: SvgPicture.asset('assets/images/ticket.svg'),
        ),
        title: Text(
          "ID #" + widget.supportData.id,
          style: TextStyle(
              letterSpacing: -0.3,
              color: Helper.textColor700,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "created by " + widget.supportData.user.name,
          style: TextStyle(
              letterSpacing: -0.3,
              color: Helper.textColor600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: widget.supportData.status == "OPEN"
                ? Helper.errorColor.withOpacity(0.1)
                : Helper.successColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Text(
            widget.supportData.status,
            maxLines: 1,
            style: TextStyle(
                letterSpacing: -0.3,
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: widget.supportData.status == "OPEN"
                    ? Helper.errorColor
                    : Helper.successColor),
          ),
        ),
      ),
    );
  }
}
