import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class TimelapseScreen extends StatefulWidget {
  const TimelapseScreen({super.key});

  @override
  State<TimelapseScreen> createState() => _TimelapseScreenState();
}

class _TimelapseScreenState extends State<TimelapseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          Row(
            children: [
              Container(
                height: 24.h,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  icon: Icon(
                    Icons.arrow_back,
                  ),
                  onPressed: () => context.pop(),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Timelapse · 5",
                style: TextStyle(
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              )
            ],
          ),
        ]))),
    ));
  }
}
