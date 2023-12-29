import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_widget.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  final String label;
  final String detailsPath;
  const ProjectsScreen(
      {super.key, required this.label, required this.detailsPath});

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends BaseConsumerState<ProjectsScreen> {
  @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //       // statusBarColor: Colors.transparent,
  //       statusBarIconBrightness: Brightness.dark,
  //       statusBarBrightness: Brightness.dark
  //       ));

  // }
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async {
              return await ref
                  .refresh(projectControllerProvider.notifier)
                  .getProjects();
            },
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/images/home.svg'),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/search.svg'),
                            SizedBox(width: 12.w),
                            SvgPicture.asset('assets/images/archive.svg'),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Projects",
                          style: TextStyle(
                              letterSpacing: -1,
                              color: Helper.textColor700,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600),
                          //  TextStyle(
                          //     color: Helper.textColor700,
                          //     fontSize: 36.sp,
                          //     fontWeight: FontWeight.w600),
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       padding: EdgeInsets.all(8.w),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20.r),
                        //           color: Colors.white),
                        //       child: Icon(Icons.search, color: Helper.textColor500),
                        //     ),
                        //     SizedBox(width: 8.w),
                        //     Container(
                        //       padding: EdgeInsets.all(8.w),
                        //       decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(20.r),
                        //           color: Colors.white),
                        //       child: Icon(Icons.notifications,
                        //           color: Helper.textColor500),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    ProjectWidget(widget.detailsPath),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
