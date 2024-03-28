import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_camera_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/provider/drone_footage_controller.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/widgets/add_drone_footage_widget.dart';

import 'widgets/drone_gridview_widget.dart';
import 'widgets/drone_listview_widget.dart';

class DroneFootageScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const DroneFootageScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<DroneFootageScreen> createState() => _DroneFootageScreenState();
}

class _DroneFootageScreenState extends BaseConsumerState<DroneFootageScreen> {
  bool list = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(droneFootageControllerProvider.notifier)
          .getDroneFootage(widget.projectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final droneFootageData = ref.watch(
        droneFootageControllerProvider.select((value) => value.droneFootages));
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
                centerTitle: false,
                titleSpacing: 12.0.w,
                leading: InkWell(
                  highlightColor: Colors.transparent,
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
                    highlightColor: Colors.transparent,
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
                    highlightColor: Colors.transparent,
                    child: SvgPicture.asset('assets/images/plus.svg'),
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          useRootNavigator: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) => AddDroneFootageWidget(
                              projectId: widget.projectId,
                              projectName: widget.projectName));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: RefreshIndicator(
            displacement: 10.0,
            color: ref.watch(primaryColorProvider),
            onRefresh: () async {
              HapticFeedback.mediumImpact();
              HapticFeedback.mediumImpact();
              return await ref
                  .refresh(droneFootageControllerProvider.notifier)
                  .getDroneFootage(widget.projectId);
            },
            child: SingleChildScrollView(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: droneFootageData.when(
                data: (data) {
                  if (data.isEmpty) {
                    return Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.88.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/illustration.svg'),
                          SizedBox(height: 16.h),
                          Text(
                            "No Drone footage",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    );
                  }
                  ;
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        list
                            ? ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 16.h);
                                },
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: ((context, index) {
                                  final reversedIndex = data.length - 1 - index;
                                  return DroneListViewWidget(
                                      data: data[reversedIndex],
                                      projectId: widget.projectId);
                                }),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 160.w,
                                        mainAxisSpacing: 15.h,
                                        crossAxisSpacing: 15.w,
                                        childAspectRatio: 16 / 9,
                                        mainAxisExtent: 152.h),
                                itemCount: data.length,
                                itemBuilder: ((context, index) {
                                  final reversedIndex = data.length - 1 - index;
                                  return DroneGridViewWidget(
                                      data: data[reversedIndex],
                                      projectId: widget.projectId);
                                }),
                              )
                      ]);
                },
                error: (err, _) {
                  return const Text("Failed to load Drone Footages",
                      style: TextStyle(
                          letterSpacing: -0.3, color: Helper.errorColor));
                },
                loading: () => Column(
                  children: [
                    SizedBox(
                      height: 44,
                    ),
                    LoadingCameraList(),
                  ],
                ),
              ),
            )),
          ),
        ));
  }
}
