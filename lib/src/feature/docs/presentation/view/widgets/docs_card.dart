import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class DocsCard extends StatefulWidget {
  final docsData;
  final index;
  const DocsCard({super.key, required this.docsData, this.index});

  @override
  State<DocsCard> createState() => _DocsCardState();
}

class _DocsCardState extends State<DocsCard> {
  @override
  Widget build(BuildContext context) {
    print("data passed to docs card" + widget.docsData.toString());
    return widget.docsData != null
        ? Container(
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
                  widget.docsData[widget.index].path
                      .split('.')
                      .last
                      .toUpperCase(),
                  style: TextStyle(
                      color: Helper.textColor600,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
              title: Text(
                widget.docsData[widget.index].name,
                style: TextStyle(
                    color: Helper.textColor700,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                "uploaded by " + widget.docsData[widget.index].uploadedBy.name,
                style: TextStyle(
                    color: Helper.textColor600,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
              trailing: SvgPicture.asset('assets/images/dots-vertical.svg'),
            ),
          )
        : Text("No docs present");
  }
}
