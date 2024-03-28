import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_split_view.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view1_controller.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view1_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_controller.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/view/widgets/date1_widget.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/view/widgets/date2_widget.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/view/widgets/images1_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart'
    as model;

import 'widgets/image2_widget.dart';

class SplitviewScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  const SplitviewScreen({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.cameraId,
  });

  @override
  ConsumerState<SplitviewScreen> createState() => _SplitviewScreenState();
}

class _SplitviewScreenState extends BaseConsumerState<SplitviewScreen> {
  String _searchDate1 = '';
  String _selectedDate1 = '';
  String _selectedDate2 = '';
  int _selectedImageIndex1 = 0;
  String formattedDate1 = '';
  String formattedDate2 = '';
  String formattedTime1 = "";
  String formattedTime2 = "";
  late model.Image imageData;

  changeTime1(String time) {
    String dateWithT = time.substring(0, 8) + 'T' + time.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    formattedTime1 = DateFormat('h:mm a').format(dateTime);
    return formattedTime1;
  }

  changeTime2(String time) {
    String dateWithT = time.substring(0, 8) + 'T' + time.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    formattedTime2 = DateFormat('h:mm a').format(dateTime);
    return formattedTime2;
  }

  showDate1(String date) {
    DateTime parsedDate = DateTime.parse(date);
    formattedDate1 = DateFormat('dd MMM yyyy').format(parsedDate);
    setState(() {});
    return formattedDate1;
  }

  showDate2(String date) {
    DateTime parsedDate = DateTime.parse(date);

    formattedDate2 = DateFormat('dd MMM yyyy').format(parsedDate);
    setState(() {});
    return formattedDate2;
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splitView1ControllerProvider.notifier).getImagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate1);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splitView2ControllerProvider.notifier).getImagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate1);
    });
  }

  @override
  void dispose() {
    ref.invalidate(splitView1DataProvider);
    ref.invalidate(splitView2DataProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final splitViewData1 = ref.watch(
        splitView1ControllerProvider.select((value) => value.imagesByCamId));
    final selectedSplitViewData1 = ref.watch(splitView1DataProvider);
    final splitViewData2 = ref.watch(
        splitView2ControllerProvider.select((value) => value.imagesByCamId));
    final selectedSplitViewData2 = ref.watch(splitView2DataProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: false,
            automaticallyImplyLeading: false,
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
              "Split View",
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
        child: RefreshIndicator(
          displacement: 10.0,
          color: ref.watch(primaryColorProvider),
          onRefresh: () async {
            HapticFeedback.mediumImpact();
            return await ref
                .refresh(splitView1ControllerProvider.notifier)
                .getImagesByCamId(widget.projectId, widget.cameraId);
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: splitViewData2.when(
              data: (data2) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 150.h),
                  child: splitViewData1.when(
                    data: (data1) {
                      if (data1.images!.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/illustration.svg'),
                              SizedBox(height: 16.h),
                              Text(
                                "No Images yet",
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
                      final aspectRatio = data1.images![0].resolution!.width! /
                          data1.images![0].resolution!.height!;

                      if (selectedSplitViewData1 == null) {
                        changeTime1(data1.images![0].datetime!);
                      } else {
                        changeTime1(selectedSplitViewData1.dateTime!);
                      }
                      if (selectedSplitViewData2 == null) {
                        changeTime2(data2.images![0].datetime!);
                      } else {
                        changeTime2(selectedSplitViewData2.dateTime!);
                      }
                      showDate1(data1.images![0].date!);
                      showDate2(data2.images![0].date!);

                      return Column(
                        children: [
                          Stack(children: [
                            Container(
                              height: MediaQuery.of(context).size.width /
                                  aspectRatio,
                              child: ImageCompareSlider(
                                dividerColor: ref.watch(primaryColorProvider),
                                handleColor: Colors.white,
                                handlePosition: 0.96,
                                fillHandle: true,
                                itemOne: Image.network(
                                  selectedSplitViewData1 == null
                                      ? data1.images![0].urlPreview!
                                      : selectedSplitViewData1.urlPreview!,
                                  gaplessPlayback: true,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: ref.watch(primaryColorProvider),
                                        value: (loadingProgress != null)
                                            ? (loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!)
                                            : 0,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return ClipRRect(
                                      child: Image.asset(
                                        'assets/images/error_image.jpeg',
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
                                itemTwo: Image.network(
                                  selectedSplitViewData2 == null
                                      ? data2.images![0].urlPreview!
                                      : selectedSplitViewData2.urlPreview!,
                                  gaplessPlayback: true,
                                  width: double.infinity,
                                  fit: BoxFit.fill,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;

                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: ref.watch(primaryColorProvider),
                                        value: (loadingProgress != null)
                                            ? (loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!)
                                            : 0,
                                      ),
                                    );
                                  },
                                  errorBuilder: (BuildContext context,
                                      Object exception,
                                      StackTrace? stackTrace) {
                                    return ClipRRect(
                                      child: Image.asset(
                                        'assets/images/error_image.jpeg',
                                        fit: BoxFit.fill,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              top: 16,
                              left: 16,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => Date1Widget(
                                            startDate: data1.startDate!,
                                            endDate: data1.endDate!,
                                            selectedDate: _selectedDate1,
                                            cameraId: widget.cameraId,
                                            projectId: widget.projectId,
                                            ref: ref,
                                            changeDate: showDate1,
                                          ));
                                },
                                child: BlurryContainer(
                                    blur: 3,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6.h, horizontal: 8.w),
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Colors.white.withOpacity(0.1),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/timeline.svg',
                                          height: 16.h,
                                          width: 16.w,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(formattedDate1,
                                            style: TextStyle(
                                                letterSpacing: -0.3,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp)),
                                      ],
                                    )),
                              ),
                            ),
                            Positioned(
                              top: 16,
                              right: 16,
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  showModalBottomSheet(
                                      isScrollControlled: true,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => Date2Widget(
                                            startDate: data2.startDate!,
                                            endDate: data2.endDate!,
                                            selectedDate: _selectedDate2,
                                            cameraId: widget.cameraId,
                                            projectId: widget.projectId,
                                            ref: ref,
                                            changeDate: showDate2,
                                          ));
                                },
                                child: BlurryContainer(
                                    blur: 3,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 6.h, horizontal: 8.w),
                                    borderRadius: BorderRadius.circular(30.r),
                                    color: Colors.white.withOpacity(0.1),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          'assets/images/timeline.svg',
                                          height: 16.h,
                                          width: 16.w,
                                          color: Colors.white,
                                        ),
                                        SizedBox(width: 4.w),
                                        Text(formattedDate2,
                                            style: TextStyle(
                                                letterSpacing: -0.3,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp)),
                                      ],
                                    )),
                              ),
                            ),
                          ]),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 44.h,
                                    child: ElevatedButton(
                                      child: Text(
                                        formattedTime1,
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.baseBlack,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Helper.fillsBackground,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                      ),
                                      onPressed: () async {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => Images1Widget(
                                                  selectedImageIndex:
                                                      _selectedImageIndex1,
                                                  data: data1,
                                                  cameraId: widget.cameraId,
                                                  ref: ref,
                                                  changeTime: changeTime1,
                                                ));
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 44.h,
                                    child: ElevatedButton(
                                      child: Text(
                                        formattedTime2,
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.baseBlack,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Helper.fillsBackground,
                                        shadowColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                      ),
                                      onPressed: () async {
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) => Images2Widget(
                                                  selectedImageIndex:
                                                      _selectedImageIndex1,
                                                  data: data2,
                                                  cameraId: widget.cameraId,
                                                  ref: ref,
                                                  changeTime: changeTime1,
                                                ));
                                      },
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      );
                    },
                    error: (err, _) {
                      return const Text("Failed to fetch images",
                          style: TextStyle(
                              letterSpacing: -0.3, color: Helper.errorColor));
                    },
                    loading: () => Center(child: LoadingSplitView()),
                  ),
                );
              },
              error: (err, _) {
                return const Text("Failed to fetch images",
                    style: TextStyle(
                        letterSpacing: -0.3, color: Helper.errorColor));
              },
              loading: () => Center(child: LoadingSplitView()),
            ),
          ),
        ),
      ),
    );
  }
}
