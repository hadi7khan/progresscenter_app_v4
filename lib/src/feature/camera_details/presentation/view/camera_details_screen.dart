import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class CameraDetailsSreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const CameraDetailsSreen(
      {super.key, required this.projectId, required this.projectName});

  @override
  State<CameraDetailsSreen> createState() => _CameraDetailsSreenState();
}

class _CameraDetailsSreenState extends State<CameraDetailsSreen> {
  int _selectedIndex = -1;
  List<DateTime> daysInMonth = [];

  @override
  void initState() {
    super.initState();
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
                        getDaysInMonth();
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
                EasyDateTimeLine(
                  timeLineProps: EasyTimeLineProps(),
                  initialDate: DateTime.now(),
                  dayProps: EasyDayProps(
                    width: 42.w,
                    height: 54.h,
                    dayStructure: DayStructure.dayNumDayStr,
                    activeBorderRadius: 6.r,
                    activeDayStrStyle: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                    activeDayNumStyle: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                    inactiveDayStrStyle: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w400),
                    inactiveDayNumStyle: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                    inactiveDayDecoration: BoxDecoration(
                      border: Border.all(style: BorderStyle.none),
                    ),
                    activeDayDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      border: Border.all(
                        width: 1,
                        color: Helper.baseBlack.withOpacity(0.06),
                      ),
                    ),
                  ),
                  headerProps: EasyHeaderProps(
                      showHeader: false,
                      showSelectedDate: false,
                      monthPickerType: MonthPickerType.dropDown,
                      selectedDateFormat:
                          SelectedDateFormat.fullDateMonthAsStrDY),
                  onDateChange: (selectedDate) {
                    //[selectedDate] the new date selected.
                  },
                  // itemBuilder: (context, dayNumber, dayName, monthName, fullDate, isSelected) => ,
                ),
                SizedBox(
                  height: 45.h,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: daysInMonth.length,
                    itemBuilder: (context, index) {
                      final day = daysInMonth[index];
                      final formattedDay =
                          DateFormat.EEEE().format(day);
                          final formattedDate =
                          DateFormat.d().format(day);

                      return  Container(
                        
                        child: Column(
                          children: [
                          Text(formattedDate),
                          Text(formattedDay)
                        ],),
                      );
                    
                    },
                  ),
                )
              ]),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: (_selectedIndex != -1) ? _selectedIndex : 0,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        // selectedItemColor: (_selectedIndex != -1) ? Helper.textColor700 : Helper.primary,
        items: [
          BottomNavigationBarItem(
              label: 'LiveLapse',
              activeIcon: SvgPicture.asset(
                'assets/images/video-recorder.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/video-recorder.svg')),
          BottomNavigationBarItem(
              label: 'Slider',
              activeIcon: SvgPicture.asset(
                'assets/images/sliders.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/sliders.svg')),
          BottomNavigationBarItem(
              label: 'Compare',
              activeIcon: SvgPicture.asset(
                'assets/images/rows.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset(
                'assets/images/rows.svg',
                color: Helper.textColor700,
              )),
          BottomNavigationBarItem(
              label: 'Split View',
              activeIcon: SvgPicture.asset(
                'assets/images/layout-left.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/layout-left.svg')),
          BottomNavigationBarItem(
              label: 'Report',
              activeIcon: SvgPicture.asset(
                'assets/images/file-download.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/file-download.svg')),
        ],
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
