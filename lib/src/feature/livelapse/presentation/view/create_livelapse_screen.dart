import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/view/create_livelapse/advanced_tabview.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/view/create_livelapse/basic_tabview.dart';

class CreateLivelapseScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  const CreateLivelapseScreen(
      {super.key,
      required this.projectId,
      required this.projectName,
      required this.cameraId});

  @override
  State<CreateLivelapseScreen> createState() => _CreateLivelapseScreenState();
}

class _CreateLivelapseScreenState extends State<CreateLivelapseScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Helper.screenBackground,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Create Livelapse",
              style: TextStyle(
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
          ),
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Helper.tabBarBackground,
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: Colors.white,
                        boxShadow: [
                            BoxShadow(
                              color: Helper.baseBlack
                                  .withOpacity(0.12),
                              blurRadius: 15,
                              offset:
                                  Offset(0, 8), // changes position of shadow
                            ),
                          ],
                        ),
                    tabs: [
                      Tab(
                        height: 30.h,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Basic",
                              style: TextStyle(
                                  color: Helper.baseBlack,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        height: 30.h,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Advanced",
                              style: TextStyle(
                                  color: Helper.baseBlack,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(children: [
                    BasicTabView(projectId: widget.projectId, cameraId: widget.cameraId),
                    AdvancedTabview(projectId: widget.projectId, cameraId: widget.cameraId)
                  ]),
                )
              ],
            ),
          ))),
    );
  }
}
