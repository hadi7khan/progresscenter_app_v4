import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';
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
  String _searchDate2 = '';
  String _selectedDate1 = '';
  String _selectedDate2 = '';
  int _selectedImageIndex1 = 0;
  int _selectedImageIndex2 = 0;
  StateSetter? bottomSheetState;
  StateSetter? bottomDateState;
  String formattedDate1 = '';
  String formattedDate2 = '';
  String formattedTime1 = "";
  String formattedTime2 = "";
  late model.Image imageData;

  changeTime1(String time) {
    print("showtime1 called" + time);
    String dateWithT = time.substring(0, 8) + 'T' + time.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    formattedTime1 = DateFormat('h:mm a').format(dateTime);
    return formattedTime1;
  }

  changeTime2(String time) {
    print("showtime2 called" + time);
    String dateWithT = time.substring(0, 8) + 'T' + time.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    formattedTime2 = DateFormat('h:mm a').format(dateTime);
    return formattedTime2;
  }

  showDate1(String date) {
    print("showdate called" + date);
    // Parse the endDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    formattedDate1 = DateFormat('dd MMM yyyy').format(parsedDate);
    setState(() {});
    return formattedDate1;
  }

  showDate2(String date) {
    print("showdate called" + date);
    // Parse the endDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
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
            // titleSpacing: 12.0.w,
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
            title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Split View",
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "17 Jul 2019 - 18 Aug 2019 ",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack.withOpacity(0.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      SvgPicture.asset('assets/images/chevron-down.svg'),
                    ],
                  )
                ]),

            actions: [
              SvgPicture.asset('assets/images/dots-vertical.svg'),
            ],

            actionsIconTheme: IconThemeData(color: Helper.iconColor),
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
                          // height: MediaQuery.of(context).size.height *0.88.h,
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
                      print("aspectRatio$aspectRatio");
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
                                // handleFollowsPosition: true,
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
                                  // height: 210.h,
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
                                  // height: 210.h,
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
                                    // width: 120.w,
                                    child: ElevatedButton(
                                      child: Text(
                                        formattedTime1,
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.baseBlack,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                        // currentIndex == contents.length - 1 ? "Continue" : "Next"
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
                                                  ref: ref,
                                                  changeTime: changeTime1,
                                                ));
                                        // _selectImage1BottomSheet(
                                        //     data1, _selectedImageIndex1, ref);
                                      },
                                    ),
                                  ),
                                  Container(
                                    height: 44.h,
                                    // width: 120.w,
                                    child: ElevatedButton(
                                      child: Text(
                                        formattedTime2,
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.baseBlack,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400),
                                        // currentIndex == contents.length - 1 ? "Continue" : "Next"
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
                                                  ref: ref,
                                                  changeTime: changeTime1,
                                                ));
                                        // _selectImage2BottomSheet(context, data2,
                                        //     _selectedImageIndex2, ref);
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
                    loading: () => Center(child: CircularProgressIndicator()),
                  ),
                );
              },
              error: (err, _) {
                return const Text("Failed to fetch images",
                    style: TextStyle(
                        letterSpacing: -0.3, color: Helper.errorColor));
              },
              loading: () => Center(child: CircularProgressIndicator()),
            ),
          ),
        ),
      ),
    );
  }

  _selectImage1BottomSheet(
    context,
    data,
    selectedIndex,
    WidgetRef ref,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(builder: (context, StateSetter modalState) {
          bottomSheetState = modalState;
          return Container(
            padding: EdgeInsets.only(
                top: 28.h, left: 20.w, right: 20.w, bottom: 28.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            // height: MediaQuery.of(context).size.height * 1.6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Image 1',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 73.h,
                  child: ListView.separated(
                      separatorBuilder: (context, builder) {
                        return SizedBox(
                          width: 2.w,
                        );
                      },
                      itemCount: data.images!.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        String dateWithT =
                            data.images![index].datetime!.substring(0, 8) +
                                'T' +
                                data.images![index].datetime!.substring(8);
                        DateTime dateTime = DateTime.parse(dateWithT);
                        final String formattedTime =
                            DateFormat('h:mm a').format(dateTime);
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            final imageData = ImageData(
                              name: data.images![index].name,
                              dateTime: data.images![index].datetime,
                              camera: data.images![index].camera,
                              id: data.images![index].id,
                              urlPreview: data.images![index].urlPreview,
                            );

                            ref
                                .read(splitView1DataProvider.notifier)
                                .setImageData(imageData);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      border: _selectedImageIndex2 == index
                                          ? Border.all(
                                              color: ref
                                                  .watch(primaryColorProvider),
                                              width: 2.w,
                                            )
                                          : Border.all(
                                              width: 2.w,
                                              color: Colors.transparent),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.network(
                                        data.images![index].urlThumb!,
                                        gaplessPlayback: true,
                                        width: 44.w,
                                        height: 44.h,
                                        fit: BoxFit.fill,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            child: Image.asset(
                                              'assets/images/error_image.jpeg',
                                              width: 44.w,
                                              height: 44.h,
                                              fit: BoxFit.fill,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.textColor700,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          ),
                        );
                      })),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }

  _selectImage2BottomSheet(
    context,
    data,
    selectedIndex,
    WidgetRef ref,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(builder: (context, StateSetter modalState) {
          // bottomSheetState = modalState;
          return Container(
            padding: EdgeInsets.only(
                top: 28.h, left: 20.w, right: 20.w, bottom: 28.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            // height: MediaQuery.of(context).size.height * 1.6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Image 2',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: 73.h,
                  child: ListView.separated(
                      separatorBuilder: (context, builder) {
                        return SizedBox(
                          width: 2.w,
                        );
                      },
                      itemCount: data.images!.length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        String dateWithT =
                            data.images![index].datetime!.substring(0, 8) +
                                'T' +
                                data.images![index].datetime!.substring(8);
                        DateTime dateTime = DateTime.parse(dateWithT);
                        final String formattedTime =
                            DateFormat('h:mm a').format(dateTime);
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            final imageData = ImageData(
                              name: data.images![index].name,
                              dateTime: data.images![index].datetime,
                              camera: data.images![index].camera,
                              id: data.images![index].id,
                              urlPreview: data.images![index].urlPreview,
                            );

                            ref
                                .read(splitView2DataProvider.notifier)
                                .setImageData(imageData);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 4.w, vertical: 2.h),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.r),
                                      border: _selectedImageIndex2 == index
                                          ? Border.all(
                                              color: ref
                                                  .watch(primaryColorProvider),
                                              width: 2.w,
                                            )
                                          : Border.all(
                                              width: 2.w,
                                              color: Colors.transparent),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(4.r),
                                      child: Image.network(
                                        data.images![index].urlThumb!,
                                        gaplessPlayback: true,
                                        width: 44.w,
                                        height: 44.h,
                                        fit: BoxFit.fill,
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            child: Image.asset(
                                              'assets/images/error_image.jpeg',
                                              width: 44.w,
                                              height: 44.h,
                                              fit: BoxFit.fill,
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6.h,
                                  ),
                                  Text(
                                    formattedTime,
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        color: Helper.textColor700,
                                        fontSize: 8.sp,
                                        fontWeight: FontWeight.w500),
                                  )
                                ]),
                          ),
                        );
                      })),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }

  _showSplitView1BottomSheet(
      context,
      String startDate,
      String endDate,
      String selectedDate,
      String cameraId,
      String projectId,
      WidgetRef ref,
      ValueChanged showDate) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => Date1Widget(
              startDate: startDate,
              endDate: endDate,
              selectedDate: selectedDate,
              cameraId: cameraId,
              projectId: projectId,
              ref: ref,
              changeDate: showDate,
            ));
  }

  _showSplitView2BottomSheet(
    context,
    String startDate,
    String endDate,
    String selectedDate,
    String cameraId,
    String projectId,
    WidgetRef ref,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        Container(
          padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          // height: MediaQuery.of(context).size.height * 1.6,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Split 2 Image Date',
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  lastDate: DateTime.parse(endDate),
                  firstDate: DateTime.parse(startDate),
                  selectedDayHighlightColor: ref.watch(primaryColorProvider),
                ),
                value: [],
                onValueChanged: (value) {
                  print(value.toString());
                  DateTime date = DateTime.parse(value[0].toString());
                  selectedDate = DateFormat("yyyyMMdd").format(date);
                  print("selectedDate " + selectedDate);
                },
              ),
              // SizedBox(height: 20.h),
              Container(
                height: 52.h,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 10.h),
                child: ElevatedButton(
                  child: Text(
                    "Done",
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    // currentIndex == contents.length - 1 ? "Continue" : "Next"
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          ref.watch(primaryColorProvider)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      )),
                  onPressed: () {
                    print(selectedDate);
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ref
                          .read(splitView2ControllerProvider.notifier)
                          .getImagesByCamId(projectId, cameraId,
                              searchDate: selectedDate);
                    });
                    // showDate(selectedDate);
                    setState(() {});
                    context.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
