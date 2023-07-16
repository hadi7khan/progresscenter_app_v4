import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/presentation/provider/cctv_camera_controller.dart';

import 'widgets/cctv_gridview_widget.dart';
import 'widgets/cctv_listview_widget.dart';

class CCTVScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const CCTVScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<CCTVScreen> createState() => _CCTVScreenState();
}

class _CCTVScreenState extends BaseConsumerState<CCTVScreen> {
  bool list = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(cctvCameraControllerProvider.notifier)
          .getCctvCameras(widget.projectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cctvCameraData = ref.watch(
        cctvCameraControllerProvider.select((value) => value.cctvCameras));
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                  child: cctvCameraData.when(
                    data: (data) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(children: [
                                  Container(
                                    height: 24.h,
                                    child: IconButton(
                                      padding: EdgeInsets.zero,
                                      alignment: Alignment.centerLeft,
                                      icon: Icon(
                                        Icons.arrow_back,
                                      ),
                                      onPressed: () => context.pop(),
                                    ),
                                  ),
                                  SizedBox(width: 8.w),
                                  Text(
                                    widget.projectName,
                                    style: TextStyle(
                                        color: Helper.baseBlack,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    // Container(
                                    //   margin: EdgeInsets.zero,
                                    //   height: 24.h,
                                    //   child: IconButton(
                                    //     padding: EdgeInsets.zero,
                                    //     alignment: Alignment.centerLeft,
                                    //     icon: SvgPicture.asset('assets/images/sort.svg'),
                                    //     onPressed: () => context.pop(),
                                    //   ),
                                    // ),
                                    Container(
                                      margin: EdgeInsets.zero,
                                      height: 24.h,
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        alignment: Alignment.centerLeft,
                                        icon: list
                                            ? SvgPicture.asset(
                                                'assets/images/grid_view.svg')
                                            : SvgPicture.asset(
                                                'assets/images/list_view.svg'),
                                        onPressed: () {
                                          setState(() {
                                            if (list == true) {
                                              list = false;
                                            } else {
                                              list = true;
                                            }
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 24.h,
                            ),
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
                                      print("cctv" + index.toString());
                                      return CctvListViewWidget(
                                          data: data[index]);
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
                                      return CctvGridViewWidget(
                                        data: data[index],
                                      );
                                    }),
                                  ),
                          ]);
                    },
                    error: (err, _) {
                      return const Text("Failed to load CCTV Cameras",
                          style: TextStyle(color: Helper.errorColor));
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                  )))),
    );
  }
}
