import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/bottom_navigation/view/camera_view_bottom_nav.dart';

class CameraDetailsSreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const CameraDetailsSreen(
      {super.key, required this.projectId, required this.projectName});

  @override
  State<CameraDetailsSreen> createState() => _CameraDetailsSreenState();
}

class _CameraDetailsSreenState extends State<CameraDetailsSreen> {
  int _selectedIndex = 0;
  List<DateTime> daysInMonth = [];

  @override
  void initState() {
    super.initState();
    getDaysInMonth();
  }

  List<DateTime> getDaysInMonth() {
    final dateTime = DateTime.now();
    final firstDayOfMonth = DateTime(dateTime.year, dateTime.month, 1);
    final lastDayOfMonth = DateTime(dateTime.year, dateTime.month + 1, 0);

    print(firstDayOfMonth.toString());
    print(lastDayOfMonth.toString());
    // final daysInMonth = <DateTime>[];
    for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      print("month days" + daysInMonth.toString());
      daysInMonth.add(DateTime(dateTime.year, dateTime.month, i));
      print("month days" + daysInMonth.toString());
    }
    print("month days" + daysInMonth.toString());

    return daysInMonth;
  }

  // static int getDaysInMonth(int year, int month) {
  //   if (month == DateTime.february) {
  //     final bool isLeapYear =
  //         (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
  //     return isLeapYear ? 29 : 28;
  //   }
  //   const List<int> daysInMonth = <int>[
  //     31,
  //     -1,
  //     31,
  //     30,
  //     31,
  //     30,
  //     31,
  //     31,
  //     30,
  //     31,
  //     30,
  //     31
  //   ];
  //   return daysInMonth[month - 1];
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            leading: SvgPicture.asset(
              'assets/images/arrow-left.svg',
            ),
            leadingWidth: 24,
            title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Timelapse Camera",
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
                        "Camera name",
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
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 72.h,
                ),
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
                  Positioned(
                    top: 16,
                    right: 16,
                    child: BlurryContainer(
                      blur: 3,
                      padding:
                          EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                      borderRadius: BorderRadius.circular(30.r),
                      color: Colors.white.withOpacity(0.1),
                      child: SvgPicture.asset(
                        'assets/images/expand.svg',
                        height: 16.h,
                        width: 16.w,
                        color: Colors.white,
                      ),
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
                SizedBox(
                  height: 74.h,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 14.h),
                          child: Text(
                            "- NOV -",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w700,
                                color: Helper.baseBlack.withOpacity(0.3)),
                          )),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: daysInMonth.length,
                          itemBuilder: (context, index) {
                            final day = daysInMonth[index];
                            final formattedDay = DateFormat.EEEE().format(day);
                            final formattedDate = DateFormat.d().format(day);
                            final isSelected = index == _selectedIndex;

                            if (index == -1) {
                              return Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 24.h),
                                  child: Text(
                                    "- NOV -",
                                    style: TextStyle(
                                        fontSize: 6.sp,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Helper.baseBlack.withOpacity(0.3)),
                                  ));
                            }
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  _selectedIndex =
                                      index; // Update the selected index when an item is tapped
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: isSelected
                                        ? Helper.baseBlack.withOpacity(0.06)
                                        : Colors.transparent,
                                    width: 1, // Set the border width
                                  ),
                                  borderRadius: BorderRadius.circular(6.r),
                                ),
                                child: Stack(children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 12.h),
                                    child: Column(
                                      children: [
                                        Text(
                                          formattedDate,
                                          style: TextStyle(
                                              color: Helper.baseBlack,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          formattedDay
                                              .substring(0, 3)
                                              .toUpperCase(),
                                          style: TextStyle(
                                              color: Helper.baseBlack,
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  isSelected
                                      ? Positioned.fill(
                                          // top: -2,
                                          child: Align(
                                            alignment: Alignment.topCenter,
                                            child: Container(
                                              height: 4.h,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5.w),
                                              decoration: BoxDecoration(
                                                color: Helper.primary,
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(4.r),
                                                    bottomRight:
                                                        Radius.circular(4.r)),
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                ]),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ]),
        ),
      ),
      bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                context.push('/livelapse', extra: {
                  "projectId": widget.projectId,
                  "projectName": widget.projectName
                });
              },
              child: IconBottomBar(
                icon: 'assets/images/video-recorder.svg',
                selected: true,
                text: 'LiveLapse',
              ),
            ),
            InkWell(
              onTap: () {
                context.push('/slider', extra: {
                  "projectId": " widget.project.id",
                  "projectName": "widget.project.name"
                });
              },
              child: IconBottomBar(
                icon: 'assets/images/sliders.svg',
                selected: true,
                text: 'Slider',
              ),
            ),
            InkWell(
              onTap: () {
                context.push('/compare', extra: {
                  "projectId": " widget.project.id",
                  "projectName": "widget.project.name"
                });
              },
              child: IconBottomBar(
                icon: 'assets/images/rows.svg',
                selected: true,
                text: 'Compare',
              ),
            ),
            InkWell(
              onTap: () {
                context.push('/splitview', extra: {
                  "projectId": " widget.project.id",
                  "projectName": "widget.project.name"
                });
              },
              child: IconBottomBar(
                icon: 'assets/images/layout-left.svg',
                selected: true,
                text: 'Split View',
              ),
            ),
            InkWell(
              onTap: () {
                context.push('/report', extra: {
                  "projectId": " widget.project.id",
                  "projectName": "widget.project.name"
                });
              },
              child: IconBottomBar(
                icon: 'assets/images/file-download.svg',
                selected: true,
                text: 'Report',
              ),
            )
          ]),
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
                  'Select Date',
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
