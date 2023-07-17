import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/camera/presentation/provider/camera_controller.dart';

import 'widgets/grid_view_widget.dart';
import 'widgets/list_view_widget.dart';

class CameraScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const CameraScreen(
      {super.key, required this.projectId, required this.projectName});

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends BaseConsumerState<CameraScreen> {
  bool list = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cameraControllerProvider.notifier).getCameras(widget.projectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cameraData =
        ref.watch(cameraControllerProvider.select((value) => value.cameras));
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: cameraData.when(
              data: (data) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
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
                          // ListTile(
                          //   dense: true,
                          //   leading: Container(
                          //       height: 24.h,
                          //       child: IconButton(
                          //         padding: EdgeInsets.zero,
                          //         alignment: Alignment.centerLeft,
                          //         icon:
                          //             SvgPicture.asset('assets/images/sort.svg'),
                          //         onPressed: () => context.pop(),
                          //       ),
                          //     ),
                          //     title:Container(
                          //       height: 24.h,
                          //       child: IconButton(
                          //         padding: EdgeInsets.zero,
                          //         alignment: Alignment.centerLeft,
                          //         icon:
                          //             SvgPicture.asset('assets/images/sort.svg'),
                          //         onPressed: () => context.pop(),
                          //       ),
                          //     ),
                          // ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                margin: EdgeInsets.zero,
                                height: 24.h,
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  alignment: Alignment.centerLeft,
                                  icon: SvgPicture.asset(
                                      'assets/images/sort.svg'),
                                  onPressed: () => context.pop(),
                                ),
                              ),
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
                              physics: BouncingScrollPhysics(),
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              itemCount: data.length,
                              itemBuilder: ((context, index) {
                                return ListViewWidget(data: data[index]);
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
                                return GridViewWidget(
                                  data: data[index],
                                );
                              }),
                            ),
                    ]);
              },
              error: (err, _) {
                return const Text("Failed to load Timelapse",
                    style: TextStyle(color: Helper.errorColor));
              },
              loading: () => Column(
                children: [
                  SizedBox(height: 44,),
                  LoadingCardListScreen(),
                ],
              ),
            )),
      ),
    ));
  }
}

showDateTimeString(date, dateFormat) {
  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(date);
  return formattedDate;
}

showDate(date, dateFormat) {
  // Parse the installationDate string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
