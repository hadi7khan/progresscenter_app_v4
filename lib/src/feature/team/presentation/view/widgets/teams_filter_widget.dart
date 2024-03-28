import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class TeamsFilterWidget extends StatefulWidget {
  final List<String> teamList;
  final Function onChange;
  const TeamsFilterWidget(
      {super.key, required this.teamList, required this.onChange});

  @override
  State<TeamsFilterWidget> createState() => _TeamsFilterWidgetState();
}

class _TeamsFilterWidgetState extends State<TeamsFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              highlightColor: Colors.transparent,
              onTap: () {
                widget.onChange(widget.teamList[index]);
              },
              child: ListTile(
                horizontalTitleGap: 8.w,
                dense: true,
                visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                contentPadding: EdgeInsets.zero,
                title: Text(
                  widget.teamList[index],
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            );
          },
          separatorBuilder: ((context, index) {
            return SizedBox(
              height: 10.h,
            );
          }),
          itemCount: widget.teamList.length),
    );
  }
}
