import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/common/widgets/add_drone_container.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/provider/drone_footage_controller.dart';

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
                titleSpacing: 12.0.w,
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: SvgPicture.asset(
                    'assets/images/arrow-left.svg',
                  ),
                ),
                leadingWidth: 24,
                title: Text(
                  widget.projectName,
                  style: TextStyle(
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
                    onTap: () {
                      _showDroneFootageBottomSheet(context);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
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
                                return DroneListViewWidget(data: data[index]);
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
                                return DroneGridViewWidget(
                                  data: data[index],
                                );
                              }),
                            )
                    ]);
              },
              error: (err, _) {
                return const Text("Failed to load Drone Footages",
                    style: TextStyle(color: Helper.errorColor));
              },
              loading: () => Column(
                children: [
                  SizedBox(
                    height: 44,
                  ),
                  LoadingCardListScreen(),
                ],
              ),
            ),
          )),
        ));
  }

  _showDroneFootageBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Add Drone Footage',
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: (){
                    context.push('/addFileVideo', extra: {
                      "projectId": widget.projectId,
                      "projectName": widget.projectName
                    });
                  },
                  child: AddDroneContainer(
                    svgPath: 'assets/images/file.svg',
                    title: "Upload Video",
                    subTitle: "Use this to upload an Mp4 file directly",
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                   onTap: (){
                    context.push('/addVimeoVideo', extra: {
                      "projectId": widget.projectId,
                      "projectName": widget.projectName
                    });
                  },
                  child: AddDroneContainer(
                    svgPath: 'assets/images/vimeo.svg',
                    title: "From Vimeo",
                    subTitle: "Use this to add a video from Vimeo",
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: (){
                    context.push('/addYoutubeVideo', extra: {
                      "projectId": widget.projectId,
                      "projectName": widget.projectName
                    });
                  },
                  child: AddDroneContainer(
                    svgPath: 'assets/images/youtube.svg',
                    title: "From YouTube",
                    subTitle: "Use this to add a video from YouTube",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
