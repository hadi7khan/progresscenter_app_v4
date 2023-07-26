import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/compare/presentation/provider/compare_controller.dart';

class CompareScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;

  const CompareScreen(
      {super.key,required this.cameraId,  required this.projectId, required this.projectName});

  @override
  ConsumerState<CompareScreen> createState() => _CompareScreenState();
}

class _CompareScreenState extends BaseConsumerState<CompareScreen> {
  String _searchDate = '';
  List<DateTime> daysInMonth = [];

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(compareControllerProvider.notifier).getIagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate);
    });
    DateTime _currentMonth = DateTime.now();
    getDaysInMonth(_currentMonth);
  }

  List<DateTime> getDaysInMonth(currentMonth) {
    print("datetime format" + currentMonth.toString());
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0);

    print(firstDayOfMonth.toString());
    print(lastDayOfMonth.toString());
    // final daysInMonth = <DateTime>[];
    for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
    }

    return daysInMonth;
  }

  @override
  Widget build(BuildContext context) {
    final compareCameraData = ref.watch(
        compareControllerProvider.select((value) => value.imagesByCamId));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: (){
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
            actions: [
              SvgPicture.asset('assets/images/download.svg'),
            ],
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
                Stack(children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      "https://dzcod3r4qkmhl.cloudfront.net/6699/previews/20191224145446.jpg",
                      width: double.infinity,
                      // height: 210.h,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
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
                  Positioned(
                    top: 16,
                    left: 16,
                    child: InkWell(
                      onTap: () {
                        _showDateBottomSheet(context);
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
                              Text("03 June, 2023",
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
                      itemCount: 15,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: Image.network(
                                    "https://dzcod3r4qkmhl.cloudfront.net/6699/thumbs/20191224145446.jpg",
                                    width: 44.w,
                                    height: 44.h,
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext context,
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
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  "1:30 PM",
                                  style: TextStyle(
                                      color: Helper.textColor700,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        );
                      })),
                ),
                SizedBox(height: 24.h),
                Stack(children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      "https://dzcod3r4qkmhl.cloudfront.net/6699/previews/20191224145446.jpg",
                      width: double.infinity,
                      // height: 210.h,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
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
                  Positioned(
                    top: 16,
                    left: 16,
                    child: InkWell(
                      onTap: () {
                        _showDateBottomSheet(context);
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
                              Text("03 June, 2023",
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
                      itemCount: 15,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 2.h),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: Image.network(
                                    "https://dzcod3r4qkmhl.cloudfront.net/6699/thumbs/20191224145446.jpg",
                                    width: 44.w,
                                    height: 44.h,
                                    fit: BoxFit.fill,
                                    errorBuilder: (BuildContext context,
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
                                SizedBox(
                                  height: 6.h,
                                ),
                                Text(
                                  "1:30 PM",
                                  style: TextStyle(
                                      color: Helper.textColor700,
                                      fontSize: 8.sp,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        );
                      })),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

_showDateBottomSheet(context) {
  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => Wrap(children: [
      Container(
        padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
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
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            CalendarDatePicker2(
              config: CalendarDatePicker2Config(),
              value: [],
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

