import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AdvancedTabview extends StatefulWidget {
  final String projectId;
  final String cameraId;
  const AdvancedTabview(
      {super.key, required this.projectId, required this.cameraId});

  @override
  State<AdvancedTabview> createState() => _AdvancedTabviewState();
}

class _AdvancedTabviewState extends State<AdvancedTabview> {
  bool _timeStamp = true;
  bool _stability = true;
  bool _dustyImages = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Images per day",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () {
                        _showImageBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('assets/images/image.svg',
                              color: Helper.textColor500),
                          title: Text(
                            "1 image",
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/images/chevron-down.svg',
                            color: Helper.textColor500,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Select Date",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () {
                        _showStartDateBottomSheet(context, "23", "22", "233");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset(
                              'assets/images/calendar.svg',
                              color: Helper.textColor500),
                          title: Text(
                            "31 Mar, 2023 - 21 Apr, 2023",
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/images/chevron-down.svg',
                            color: Helper.textColor500,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Select Quality",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () {
                        _showQualityBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('assets/images/quality.svg',
                              color: Helper.textColor500),
                          title: Text(
                            "Select Quality",
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/images/chevron-down.svg',
                            color: Helper.textColor500,
                            width: 24,
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Add timestamp",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "Time and Date will be visible",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch.adaptive(
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          inactiveTrackColor:
                              Color.fromRGBO(120, 120, 128, 0.16),
                          activeTrackColor: Helper.switchActiveColor,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          value: _timeStamp,
                          onChanged: (value) {
                            setState(() {
                              _timeStamp = value;
                            });
                          }),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Blend and stability",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "AI Powered technology",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch.adaptive(
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          inactiveTrackColor:
                              Color.fromRGBO(120, 120, 128, 0.16),
                          activeTrackColor: Helper.switchActiveColor,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          value: _stability,
                          onChanged: (value) {
                            setState(() {
                              _stability = value;
                            });
                          }),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Exlude dusty images",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "AI Powered technology",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Switch.adaptive(
                          trackOutlineColor:
                              MaterialStateProperty.all(Colors.transparent),
                          inactiveTrackColor:
                              Color.fromRGBO(120, 120, 128, 0.16),
                          activeTrackColor: Helper.switchActiveColor,
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          value: _dustyImages,
                          onChanged: (value) {
                            setState(() {
                              _dustyImages = value;
                            });
                          }),
                    ),
                  ]),
            ),
            SizedBox(height: 24.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Add Logo",
                          style: TextStyle(
                              color: Helper.textColor700,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "SVG, PNG, JPG (max 40x40px)",
                          style: TextStyle(
                              color: Helper.textColor500,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Container(
                          padding: EdgeInsets.all(13.w),
                          decoration: BoxDecoration(
                              color: Helper.svgBackground,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: SvgPicture.asset(
                            'assets/images/add_image.svg',
                            // width: 24,
                          ),
                        )),
                    ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(
                          "Add music",
                          style: TextStyle(
                              color: Helper.textColor700,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(
                          "MP3, 3GP (max 40x40px)",
                          style: TextStyle(
                              color: Helper.textColor500,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Container(
                          padding: EdgeInsets.all(13.w),
                          decoration: BoxDecoration(
                              color: Helper.svgBackground,
                              borderRadius: BorderRadius.circular(8.r)),
                          child: SvgPicture.asset(
                            'assets/images/music.svg',
                            // width: 24,
                          ),
                        )),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Add Start slide",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "MP4 or JPG (max 1080x1920)",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.all(13.w),
                        decoration: BoxDecoration(
                            color: Helper.svgBackground,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: SvgPicture.asset(
                          'assets/images/add_image.svg',
                          // width: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Add End slide",
                        style: TextStyle(
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "MP4 or JPG (max 1080x1920)",
                        style: TextStyle(
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      trailing: Container(
                        padding: EdgeInsets.all(13.w),
                        decoration: BoxDecoration(
                            color: Helper.svgBackground,
                            borderRadius: BorderRadius.circular(8.r)),
                        child: SvgPicture.asset(
                          'assets/images/add_image.svg',
                          // width: 24,
                        ),
                      ),
                    ),
                  ]),
            ),
            SizedBox(height: 59.h),
            Container(
              height: 52.h,
              width: double.infinity,
              child: ElevatedButton(
                child:
                    // isLoading
                    //     ? CircularProgressIndicator(
                    //         color: Colors.white,
                    //       )
                    //     :
                    Text(
                  "Create livelapse",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.sp,
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
                onPressed: () async {
                  // if (_fbKey.currentState!.saveAndValidate()) {
                  //   setState(() {
                  //     isLoading = true;
                  //   });
                  //   Map<String, dynamic> data = {
                  //     "email": _verifyemailcontroller.text.toLowerCase(),
                  //   };
                  //   await ref
                  //       .watch(forgotPasswordProvider.notifier)
                  //       .forgotPass(data)
                  //       .then((value) async {
                  //     value.fold((failure) {
                  //       print("errorrrrrr");
                  //     }, (data) {
                  //       final token = data['token'];
                  //       context.push('/verifyEmail',
                  //           extra: {"token": token});
                  //     });

                  //     setState(() {
                  //       isLoading = false;
                  //     });
                  //   });
                  //   // .onError((error, stackTrace) {
                  //   //   Utils.flushBarErrorMessage(
                  //   //       "Error", context);
                  //   //   setState(() {
                  //   //     isLoading = false;
                  //   //   });
                  //   // });
                  // }
                  // setState(() {
                  //   isLoading = false;
                  // });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showImageBottomSheet(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 510.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Duration',
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '1 Image',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '3 Image',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '5 Image',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '10 Image',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '15 Image',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      '20 Image',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.baseBlack),
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
          ],
        ),
      ),
    );
  }

  _showStartDateBottomSheet(
    context,
    String startDate,
    String endDate,
    String selectedDate,
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
                    'Select Start Date',
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                    // lastDate: DateTime.parse(endDate),
                    // firstDate: DateTime.parse(startDate),
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
                    context.pop();
                    _showEndDateBottomSheet(context, "23", "22", "233");
                  },
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  _showEndDateBottomSheet(
    context,
    String startDate,
    String endDate,
    String selectedDate,
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
                    'Select End Date',
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                    // lastDate: DateTime.parse(endDate),
                    // firstDate: DateTime.parse(startDate),
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

  _showQualityBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 288.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Quality',
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Standard definition - 1280x720',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                        horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'High Definition - 1920x1080',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.baseBlack),
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
          ],
        ),
      ),
    );
  }
}
