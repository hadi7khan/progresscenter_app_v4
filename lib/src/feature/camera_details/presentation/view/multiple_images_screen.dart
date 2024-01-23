import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/multi_images_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/multiple_images/create_zip_tabview.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/multiple_images/previous_requests_tabview.dart';

class MultipleImagesScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraName;
  final String cameraId;
  final String startDate;
  final String endDate;
  const MultipleImagesScreen(
      {super.key,
      required this.projectId,
      required this.cameraName,
      required this.cameraId,
      required this.startDate,
      required this.endDate});

  @override
  ConsumerState<MultipleImagesScreen> createState() =>
      _MultipleImagesScreenState();
}

class _MultipleImagesScreenState
    extends BaseConsumerState<MultipleImagesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(multiImageControllerProvider.notifier)
          .getMultiImages(widget.projectId, widget.cameraId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Helper.screenBackground,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w),
              child: AppBar(
                centerTitle: false,
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
                  "Multiple Images",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
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
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.r),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Helper.baseBlack.withOpacity(0.12),
                          blurRadius: 15,
                          offset: Offset(0, 8), // changes position of shadow
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
                              "Create Zip",
                              style: TextStyle(
                                  letterSpacing: -0.3,
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
                              "Previous Requests",
                              style: TextStyle(
                                  letterSpacing: -0.3,
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
                    CreateZipTabview(
                      projectId: widget.projectId,
                      cameraName: widget.cameraName,
                      cameraId: widget.cameraId,
                      startDate: widget.startDate,
                      endDate: widget.endDate,
                    ),
                    PreviousRequestsTabview(
                        projectId: widget.projectId,
                        cameraName: widget.cameraName,
                        cameraId: widget.cameraId)
                  ]),
                )
              ],
            ),
          ))),
    );
  }
}
