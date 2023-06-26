import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ProjectWidget extends StatefulWidget {
  const ProjectWidget({super.key});

  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index){
        return SizedBox(height: 20.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 7,
      itemBuilder: ((context, index) {
        return Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.only(top: 8.h, right: 8.w, left: 8.w, bottom: 20.h),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 185.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.r),
                  color: Color.fromRGBO(235, 235, 235, 1),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Kempegowda International Airport T6",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Helper.textColor700,
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                "Bengaluru, India",
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Helper.textColor400,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
