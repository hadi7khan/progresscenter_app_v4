import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_cam_details.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/compare/presentation/provider/compare1_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';
import 'package:progresscenter_app_v4/src/feature/compare/presentation/provider/compare1_controller.dart';
import 'package:progresscenter_app_v4/src/feature/compare/presentation/provider/compare2_controller.dart';
import 'package:progresscenter_app_v4/src/feature/compare/presentation/provider/compare2provider.dart';

class CompareScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;

  const CompareScreen(
      {super.key,
      required this.cameraId,
      required this.projectId,
      required this.projectName});

  @override
  ConsumerState<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends BaseConsumerState<CompareScreen> {
  String _searchDate1 = '';
  String _searchDate2 = '';
  String _selectedDate1 = '';
  String _selectedDate2 = '';
  int _selectedImageIndex1 = 0;
  int _selectedImageIndex2 = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(compare1ControllerProvider.notifier).getImagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate1);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(compare2ControllerProvider.notifier).getImagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate1);
    });
  }

  showDate(String date) {
    // Parse the endDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final compareCameraData1 = ref.watch(
        compare1ControllerProvider.select((value) => value.imagesByCamId));
    final selectedCompareData1 = ref.watch(compare1DataProvider);
    final compareCameraData2 = ref.watch(
        compare2ControllerProvider.select((value) => value.imagesByCamId));
    final selectedCompareData2 = ref.watch(compare2DataProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
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
              "Compare",
              style: TextStyle(
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            // actions: [
            //   SvgPicture.asset('assets/images/download.svg'),
            // ],
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              children: [
                compareCameraData1.when(
                  
                  data: (cameraData1) {
                    if (cameraData1.images!.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height *0.88.h,
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
                                    color: Helper.textColor900,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        );
                      }
                      ;
                    return Consumer(builder: (context, ref, child) {
                      return Column(children: [
                        Stack(children: [
                          Container(
                            color: Helper.textColor300,
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                selectedCompareData1 == null
                                    ? cameraData1.images![0].urlPreview!
                                    : selectedCompareData1.urlPreview!,
                                width: double.infinity,
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
                                              loadingProgress
                                                  .expectedTotalBytes!)
                                          : 0,
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
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
                          Positioned(
                            top: 16,
                            left: 16,
                            child: InkWell(
                              onTap: () {
                                _showCompare1BottomSheet(
                                  context,
                                  cameraData1.startDate!,
                                  cameraData1.endDate!,
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
                                      Text(showDate(cameraData1.endDate!),
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
                        SizedBox(height: 6.h),
                        SizedBox(
                          height: 73.h,
                          child: ListView.separated(
                              separatorBuilder: (context, builder) {
                                return SizedBox(
                                  width: 2.w,
                                );
                              },
                              itemCount: cameraData1.images!.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                String dateWithT = cameraData1
                                        .images![index].datetime!
                                        .substring(0, 8) +
                                    'T' +
                                    cameraData1.images![index].datetime!
                                        .substring(8);
                                DateTime dateTime = DateTime.parse(dateWithT);
                                final String formattedTime =
                                    DateFormat('h:mm a').format(dateTime);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex1 = index;
                                    });
                                    final imageData = ImageData(
                                      name: cameraData1.images![index].name,
                                      dateTime:
                                          cameraData1.images![index].datetime,
                                      camera: cameraData1.images![index].camera,
                                      id: cameraData1.images![index].id,
                                      urlPreview:
                                          cameraData1.images![index].urlPreview,
                                    );

                                    ref
                                        .read(compare1DataProvider.notifier)
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
                                                cameraData1
                                                    .images![index].urlThumb!,
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
                      ]);
                    });
                  },
                  error: (err, _) {
                    return const Text("Failed to fetch cameras",
                        style: TextStyle(
                    letterSpacing: -0.3,color: Helper.errorColor));
                  },
                  loading: () => LoadingCamDetails(
                    showCalendarList: false,
                    topPadding: 0,
                  ),
                ),
                SizedBox(height: 24.h),

// ----------------------------compare division----------------------

                compareCameraData2.when(
                  data: (cameraData2) {
                    if (cameraData2.images!.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height *0.88.h,
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
                    return Consumer(builder: (context, ref, child) {
                      return Column(children: [
                        Stack(children: [
                          Container(
                            color: Helper.textColor300,
                            child: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: Image.network(
                                selectedCompareData2 == null
                                    ? cameraData2.images![0].urlPreview!
                                    : selectedCompareData2.urlPreview!,
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
                                              loadingProgress
                                                  .expectedTotalBytes!)
                                          : 0,
                                    ),
                                  );
                                },
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
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
                          Positioned(
                            top: 16,
                            left: 16,
                            child: InkWell(
                              onTap: () {
                                _showCompare2BottomSheet(
                                  context,
                                  cameraData2.startDate!,
                                  cameraData2.endDate!,
                                  _selectedDate2,
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
                                      Text(showDate(cameraData2.endDate!),
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
                        SizedBox(height: 6.h),
                        SizedBox(
                          height: 73.h,
                          child: ListView.separated(
                              separatorBuilder: (context, builder) {
                                return SizedBox(
                                  width: 2.w,
                                );
                              },
                              itemCount: cameraData2.images!.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                String dateWithT = cameraData2
                                        .images![index].datetime!
                                        .substring(0, 8) +
                                    'T' +
                                    cameraData2.images![index].datetime!
                                        .substring(8);
                                DateTime dateTime = DateTime.parse(dateWithT);
                                final String formattedTime =
                                    DateFormat('h:mm a').format(dateTime);
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex2 = index;
                                    });
                                    final imageData = ImageData(
                                      name: cameraData2.images![index].name,
                                      dateTime:
                                          cameraData2.images![index].datetime,
                                      camera: cameraData2.images![index].camera,
                                      id: cameraData2.images![index].id,
                                      urlPreview:
                                          cameraData2.images![index].urlPreview,
                                    );

                                    ref
                                        .read(compare2DataProvider.notifier)
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
                                                cameraData2
                                                    .images![index].urlThumb!,
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
                      ]);
                    });
                  },
                  error: (err, _) {
                    return const Text("Failed to fetch cameras",
                        style: TextStyle(
                    letterSpacing: -0.3,color: Helper.errorColor));
                  },
                  loading: () =>
                      LoadingCamDetails(showCalendarList: false, topPadding: 0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  _showCompare1BottomSheet(
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
                    'Image 1 Date',
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
                    letterSpacing: -0.3,
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
                    //         ref
                    // .read(imagesByCamIdControllerProvider.notifier)
                    // .getIagesByCamId(projectId, cameraId, searchDate: selectedDate );
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ref
                          .read(compare1ControllerProvider.notifier)
                          .getImagesByCamId(projectId, cameraId,
                              searchDate: selectedDate);
                    });
                    // getCompare1Month(currentMonth);
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

  _showCompare2BottomSheet(
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
                    'Image 1 Date',
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
                    letterSpacing: -0.3,
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
                    //         ref
                    // .read(imagesByCamIdControllerProvider.notifier)
                    // .getIagesByCamId(projectId, cameraId, searchDate: selectedDate );
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      ref
                          .read(compare2ControllerProvider.notifier)
                          .getImagesByCamId(projectId, cameraId,
                              searchDate: selectedDate);
                    });
                    // getCompare2Month(currentMonth);
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
