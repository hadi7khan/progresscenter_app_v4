import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class EquipmentTrackerScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const EquipmentTrackerScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  State<EquipmentTrackerScreen> createState() => _EquipmentTrackerScreenState();
}

class _EquipmentTrackerScreenState extends State<EquipmentTrackerScreen> {
  bool list = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              titleSpacing: 12.0.w,
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: Transform.rotate(
                  angle: 180 * (3.1415926535 / 180),
                  child: SvgPicture.asset('assets/images/chevron-right.svg',
                      color: Helper.iconColor, fit: BoxFit.contain),
                ),
              ),
              leadingWidth: 24,
              title: Text(
                widget.projectName,
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actions: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (list == true) {
                        list = false;
                      } else {
                        list = true;
                      }
                    });
                  },
                  child: list
                      ? SvgPicture.asset('assets/images/grid_view.svg')
                      : SvgPicture.asset('assets/images/list_view.svg'),
                ),
                SizedBox(width: 5.w),
                InkWell(
                  child: SvgPicture.asset('assets/images/plus.svg'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height * 0.88.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/images/illustration.svg'),
                SizedBox(height: 16.h),
                Text(
                  "No Equipment Trackers yet",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.textColor900,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
