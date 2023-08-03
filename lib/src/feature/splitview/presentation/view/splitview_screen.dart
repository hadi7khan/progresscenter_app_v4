import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view1_controller.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view1_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_controller.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_provider.dart';

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

  showDate(String date) {
    // Parse the endDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
    return formattedDate;
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
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            // titleSpacing: 12.0.w,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                'assets/images/arrow-left.svg',
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
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: splitViewData2.when(
            data: (data2) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 150.h),
                child: splitViewData1.when(
                  data: (data1) {
                    return Column(
                      children: [
                        Stack(children: [
                          ImageCompareSlider(
                            dividerColor: Helper.primary,
                            handleColor: Colors.white,
                            handlePosition: 0.96,
                            fillHandle: true,
                            itemOne: Image.network(
                              selectedSplitViewData1 == null
                                  ? data1.images![0].urlPreview!
                                  : selectedSplitViewData1.urlPreview!,
                              width: double.infinity,
                              // height: 210.h,
                              fit: BoxFit.fill,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Helper.primary,
                                    value: (loadingProgress != null)
                                        ? (loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!)
                                        : 0,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
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
                              width: double.infinity,
                              // height: 210.h,
                              fit: BoxFit.fill,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;

                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Helper.primary,
                                    value: (loadingProgress != null)
                                        ? (loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!)
                                        : 0,
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return ClipRRect(
                                  child: Image.asset(
                                    'assets/images/error_image.jpeg',
                                    fit: BoxFit.fill,
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            top: 16,
                            left: 16,
                            child: InkWell(
                              onTap: () {
                                _showSplitView1BottomSheet(
                                  context,
                                  data1.startDate!,
                                  data1.endDate!,
                                  _selectedDate1,
                                  widget.cameraId,
                                  widget.projectId,
                                  ref,
                                );
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
                                      Text(showDate(data1.endDate!),
                                          style: TextStyle(
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
                                _showSplitView2BottomSheet(
                                  context,
                                  data1.startDate!,
                                  data1.endDate!,
                                  _selectedDate1,
                                  widget.cameraId,
                                  widget.projectId,
                                  ref,
                                );
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
                                      Text(showDate(data2.endDate!),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp)),
                                    ],
                                  )),
                            ),
                          ),
                        ]),
                        SizedBox(height: 6.h),
                        SizedBox(
                          height: 73.h,
                          child: ListView.separated(
                              separatorBuilder: (context, builder) {
                                return SizedBox(
                                  width: 2.w,
                                );
                              },
                              itemCount: data1.images!.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                String formattedTime = DateFormat("hh:mm a")
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(
                                            data1.images![index].datetime!)))
                                    .toString();
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex1 = index;
                                    });
                                    final imageData = ImageData(
                                      name: data1.images![index].name,
                                      dateTime: data1.images![index].datetime,
                                      camera: data1.images![index].camera,
                                      id: data1.images![index].id,
                                      urlPreview:
                                          data1.images![index].urlPreview,
                                    );

                                    ref
                                        .read(splitView1DataProvider.notifier)
                                        .setImageData(imageData);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 2.h),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.zero,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              border: _selectedImageIndex1 ==
                                                      index
                                                  ? Border.all(
                                                      color: Helper.primary,
                                                      width: 2.w,
                                                    )
                                                  : Border.all(
                                                      width: 2.w,
                                                      color:
                                                          Colors.transparent),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              child: Image.network(
                                                data1.images![index].urlThumb!,
                                                width: 44.w,
                                                height: 44.h,
                                                fit: BoxFit.fill,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return ClipRRect(
                                                    child: Image.asset(
                                                      'assets/images/error_image.jpeg',
                                                      fit: BoxFit.cover,
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
                                                color: Helper.textColor700,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ]),
                                  ),
                                );
                              })),
                        ),
                        SizedBox(height: 20.h),
                        // --------------------------------------------------------------------
                        SizedBox(
                          height: 73.h,
                          child: ListView.separated(
                              separatorBuilder: (context, builder) {
                                return SizedBox(
                                  width: 2.w,
                                );
                              },
                              itemCount: data2.images!.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                String formattedTime = DateFormat("hh:mm a")
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(
                                            data2.images![index].datetime!)))
                                    .toString();
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex2 = index;
                                    });
                                    final imageData = ImageData(
                                      name: data2.images![index].name,
                                      dateTime: data2.images![index].datetime,
                                      camera: data2.images![index].camera,
                                      id: data2.images![index].id,
                                      urlPreview:
                                          data2.images![index].urlPreview,
                                    );

                                    ref
                                        .read(splitView2DataProvider.notifier)
                                        .setImageData(imageData);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 4.w, vertical: 2.h),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.zero,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                              border: _selectedImageIndex2 ==
                                                      index
                                                  ? Border.all(
                                                      color: Helper.primary,
                                                      width: 2.w,
                                                    )
                                                  : Border.all(
                                                      width: 2.w,
                                                      color:
                                                          Colors.transparent),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              child: Image.network(
                                                data2.images![index].urlThumb!,
                                                width: 44.w,
                                                height: 44.h,
                                                fit: BoxFit.fill,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return ClipRRect(
                                                    child: Image.asset(
                                                      'assets/images/error_image.jpeg',
                                                      fit: BoxFit.cover,
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
                    );
                  },
                  error: (err, _) {
                    return const Text("Failed to fetch images",
                        style: TextStyle(color: Helper.errorColor));
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              );
            },
            error: (err, _) {
              return const Text("Failed to fetch images",
                  style: TextStyle(color: Helper.errorColor));
            },
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
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
                    'Split 1 Image Date',
                    style: TextStyle(
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
                  selectedDayHighlightColor: Helper.primary,
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
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    // currentIndex == contents.length - 1 ? "Continue" : "Next"
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Helper.primary),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      )),
                  onPressed: () {
                    print(selectedDate);
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ref
                          .read(splitView1ControllerProvider.notifier)
                          .getImagesByCamId(projectId, cameraId,
                              searchDate: selectedDate);
                    });
                    showDate(endDate);
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
                  selectedDayHighlightColor: Helper.primary,
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
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                    // currentIndex == contents.length - 1 ? "Continue" : "Next"
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Helper.primary),
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
                    showDate(endDate);
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
