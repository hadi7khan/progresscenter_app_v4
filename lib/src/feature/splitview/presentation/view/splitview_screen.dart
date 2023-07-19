import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SplitviewScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const SplitviewScreen({super.key, required this.projectId, required this.projectName});

  @override
  State<SplitviewScreen> createState() => _SplitviewScreenState();
}

class _SplitviewScreenState extends State<SplitviewScreen> {
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
            // titleSpacing: 12.0.w,
            leading: SvgPicture.asset(
              'assets/images/arrow-left.svg',
            ),
            leadingWidth: 24,
            title:
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Split View",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "17 Jul 2019 - 18 Aug 2019 ",
                        style: TextStyle(
                            color: Helper.baseBlack.withOpacity(0.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      SvgPicture.asset('assets/images/chevron-down.svg'),
                    ],
                  )
                ]),
             
            actions: [
              SvgPicture.asset('assets/images/dots-vertical.svg'),

            ],
            
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
    );
  }
}