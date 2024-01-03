import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
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
                  // padding: EdgeInsets.zero,
                  // alignment: Alignment.centerLeft,
                  child: list
                      ? SvgPicture.asset(
                          'assets/images/grid_view.svg',
                        )
                      : SvgPicture.asset('assets/images/list_view.svg'),
                  onTap: () {
                    setState(() {
                      if (list == true) {
                        list = false;
                      } else {
                        list = true;
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: RefreshIndicator(
        displacement: 10.0,
        color: Helper.primary,
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          return await ref
              .refresh(cctvCameraControllerProvider.notifier)
              .getCctvCameras(widget.projectId);
        },
        child: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                child: cctvCameraData.when(
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
                              "No CCTV Cameras yet",
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
                                  cacheExtent: 6,
                                  addAutomaticKeepAlives: true,
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
                        style: TextStyle(
                            letterSpacing: -0.3, color: Helper.errorColor));
                  },
                  loading: () => Column(
                    children: [
                      SizedBox(
                        height: 44,
                      ),
                      LoadingCardListScreen(),
                    ],
                  ),
                ))),
      )),
    );
  }
}
