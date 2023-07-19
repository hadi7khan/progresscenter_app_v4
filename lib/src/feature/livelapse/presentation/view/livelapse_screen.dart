import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LivelapseScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const LivelapseScreen({super.key, required this.projectId, required this.projectName});

  @override
  State<LivelapseScreen> createState() => _LivelapseScreenState();
}

class _LivelapseScreenState extends State<LivelapseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            leading: SvgPicture.asset(
              'assets/images/arrow-left.svg',
            ),
            leadingWidth: 24,
            title: Text(
                    "Livelapse",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
            actions: [
              SvgPicture.asset('assets/images/plus.svg'),
            ],
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
    );
  }
}