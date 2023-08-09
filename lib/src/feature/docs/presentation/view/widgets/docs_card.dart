import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class DocsCard extends StatefulWidget {
  final docsData;
  const DocsCard({super.key, required this.docsData});

  @override
  State<DocsCard> createState() => _DocsCardState();
}

class _DocsCardState extends State<DocsCard> {
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
          decoration: BoxDecoration(
              color: Color.fromRGBO(217, 217, 217, 1),
              borderRadius: BorderRadius.circular(4.r)),
          child: Text(
            widget.docsData.files[0].path.split('.').last.toUpperCase(),
            style: TextStyle(
                color: Helper.textColor600,
                fontSize: 12.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        title: Text(
          widget.docsData.name,
          style: TextStyle(
              color: Helper.textColor700,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          widget.docsData.files != null
              ? "uploaded by " + widget.docsData.files[0].uploadedBy.name
              : "N/A",
          style: TextStyle(
              color: Helper.textColor600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
        trailing: SvgPicture.asset('assets/images/dots-vertical.svg'),
      ),
    );
  }
}
