import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_widget.dart';

class ProjectsScreen extends StatefulWidget {
  final String label;
  final String detailsPath;
  const ProjectsScreen(
      {super.key, required this.label, required this.detailsPath});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Your Projects",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white),
                          child: Icon(Icons.search, color: Helper.textColor500),
                        ),
                         SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: Colors.white),
                          child: Icon(Icons.notifications, color: Helper.textColor500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                ProjectWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
