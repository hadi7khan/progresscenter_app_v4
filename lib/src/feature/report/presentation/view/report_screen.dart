import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ReportScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const ReportScreen({super.key, required this.projectId, required this.projectName});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: (){
                context.pop();
              },
              child: SvgPicture.asset(
                'assets/images/arrow-left.svg',
              ),
            ),
            leadingWidth: 24,
            title: Text(
                    "Report",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
            actions: [
              SvgPicture.asset('assets/images/sort.svg'),
              SizedBox(width: 12.w),
              SvgPicture.asset('assets/images/plus.svg'),

            ],
            
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
    );
  }
}