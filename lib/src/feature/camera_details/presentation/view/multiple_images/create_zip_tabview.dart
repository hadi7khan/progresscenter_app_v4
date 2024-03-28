import 'dart:ui';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/create_zip_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'dart:developer';

enum ImageQuality { fourK, Optimized }

class CreateZipTabview extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraName;
  final String cameraId;
  final String startDate;
  final String endDate;
  const CreateZipTabview({
    super.key,
    required this.projectId,
    required this.cameraName,
    required this.cameraId,
    required this.startDate,
    required this.endDate,
  });

  @override
  ConsumerState<CreateZipTabview> createState() => _CreateZipTabviewState();
}

class _CreateZipTabviewState extends BaseConsumerState<CreateZipTabview> {
  PersistentBottomSheetController? _controller;
  IO.Socket? socket;
  String startTime = "070000";
  String endTime = "190000";
  String startParsedTime = "";
  String endParsedTime = "";
  bool _isLoading = false;
  String _selectedStartDate = '';
  String _selectedEndDate = '';
  bool _timeStamp = false;
  ImageQuality? _character = ImageQuality.fourK;
  double _progressBar = 0.0;
  String _imageQuality = "HD";
  String showEndText = "";
  String showStartText = "";
  String passStartDate = "";
  bool has30daysDifference = true;

  @override
  void initState() {
    super.initState();
    showEndDate(widget.endDate);
    showStartDate(widget.endDate, true);
  }

  initSocket(String id) {
    socket = IO.io(Endpoints.baseUrl, <String, dynamic>{
      'autoConnect': true,
      'transports': ['websocket'],
    });
    socket!.onConnect((_) {
      socket!.emit('joinRoom', "multiImageDownload:$id");

      socket!.on('multiImageDownload:progress', (data) {
        _controller!.setState!(() {
          _progressBar = double.parse(data["progress"].toString());
        });
      });

      socket!.on('multiImageDownload:completed', (data) {
        socket!.dispose();
      });
      socket!.on('multiImageDownload:errored', (data) {
        socket!.dispose();
      });
    });
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print(err));
    socket!.onError((err) => print(err));
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  displayStartTime(time) {
    DateTime parsedDateTime = DateTime.parse("19700101T$time");

    startParsedTime = DateFormat('h:mm a').format(parsedDateTime);
    return startParsedTime;
  }

  displayEndTime(String time) {
    DateTime parsedDateTime = DateTime.parse("19700101T$time");

    endParsedTime = DateFormat('h:mm a').format(parsedDateTime);
    return endParsedTime;
  }

  showEndDate(String date) {
    log("called" + date.toString());
    DateTime parsedDate = DateTime.parse(date);

    String formattedDate = DateFormat('dd MMM, yyyy').format(parsedDate);

    log("called" + formattedDate.toString());
    setState(() {
      showEndText = formattedDate;
    });
    return formattedDate;
  }

  showStartDate(String date, bool showMonthBefore) {
    log("called" + date.toString());
    DateTime parsedDate = DateTime.parse(date);
    // Subtract one month (30 days) from the parsed date
    if (showMonthBefore) {
      DateTime newDate = parsedDate.subtract(Duration(days: 30));
      String formattedDate = DateFormat('dd MMM, yyyy').format(newDate);
      String formattedPassDate = DateFormat('yyyyMMdd').format(newDate);
      log("nov" + formattedPassDate.toString());
      setState(() {
        showStartText = formattedDate;
        passStartDate = formattedPassDate;
      });
      return formattedDate;
    }

    String formattedDate = DateFormat('dd MMM, yyyy').format(parsedDate);
    log("called" + formattedDate.toString());
    setState(() {
      showStartText = formattedDate;
    });
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    log(widget.endDate.toString());
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
                      "Start Date",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _showStartDateBottomSheet(context, "23", "22",
                            widget.startDate, widget.endDate, passStartDate);
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
                            showStartText,
                            style: TextStyle(
                                letterSpacing: -0.3,
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
                      "End Date",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _showEndDateBottomSheet(context, "23", "22",
                            widget.startDate, widget.endDate);
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
                            showEndText,
                            style: TextStyle(
                                letterSpacing: -0.3,
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
                    SizedBox(height: 5.h),
                    !has30daysDifference
                        ? Text(
                            "Date must be within the range of 30 days",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.errorColor,
                                fontWeight: FontWeight.w400),
                          )
                        : SizedBox()
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
                    Text(
                      "Image Quality",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    ListTile(
                      visualDensity:
                          VisualDensity(vertical: -4, horizontal: -4),
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        '4K',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      leading: Radio<ImageQuality>(
                        value: ImageQuality.fourK,
                        groupValue: _character,
                        visualDensity:
                            VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: ref.watch(primaryColorProvider),
                        onChanged: (ImageQuality? value) {
                          setState(() {
                            _character = value;
                            _imageQuality = "HD";
                          });
                        },
                      ),
                    ),
                    ListTile(
                      visualDensity:
                          VisualDensity(vertical: -4, horizontal: -4),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        'Optimized',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor500,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      leading: Radio<ImageQuality>(
                        value: ImageQuality.Optimized,
                        visualDensity:
                            VisualDensity(vertical: -4, horizontal: -4),
                        activeColor: ref.watch(primaryColorProvider),
                        groupValue: _character,
                        onChanged: (ImageQuality? value) {
                          setState(() {
                            _character = value;
                            _imageQuality = "SD";
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10.h),
                    ListTile(
                      visualDensity:
                          VisualDensity(vertical: -4, horizontal: -4),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      title: Text(
                        "Add timestamp on image",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 16.sp,
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
                  ]),
            ),
            SizedBox(height: 59.h),
            Container(
              height: 52.h,
              width: double.infinity,
              child: ElevatedButton(
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Create Zip",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Colors.white,
                            fontSize: 16.sp,
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
                onPressed: () async {
                  has30daysDifference =
                      calculateDateDifference(showStartText, showEndText);
                  if (has30daysDifference) {
                    Map<String, dynamic> data = {
                      "startDate": _selectedStartDate,
                      "endDate": _selectedEndDate,
                      "startTime": startTime,
                      "endTime": endTime,
                      "hasTimestamp": _timeStamp,
                      "imageQuality": _imageQuality
                    };

                    setState(() {
                      _isLoading = true;
                    });
                    await ref
                        .watch(createZipProvider.notifier)
                        .createZip(widget.projectId, widget.cameraId, data)
                        .then((value) async {
                      value.fold((failure) {}, (res) {
                        log("response data" + res["_id"].toString());
                        initSocket(res["_id"]);
                        _showProgressBottomSheet(context, ref);
                      });

                      Utils.toastSuccessMessage("Zip Created", context);

                      setState(() {
                        _isLoading = false;
                      });
                    });
                    // .onError((error, stackTrace) {
                    //   Utils.flushBarErrorMessage(
                    //       "Error", context);
                    //   setState(() {
                    //     isLoading = false;
                    //   });
                    // });

                    setState(() {
                      _isLoading = false;
                    });
                  } else {
                    setState(() {
                      has30daysDifference = false;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool calculateDateDifference(String startDate, String endDate) {
    // Parse the input date strings
    DateTime parsedStartDate = DateFormat('dd MMM, yyyy').parse(startDate);
    DateTime parsedEndDate = DateFormat('dd MMM, yyyy').parse(endDate);

    // Calculate the difference in days
    Duration difference = parsedEndDate.difference(parsedStartDate);
    if (difference.inDays <= 30) {
      setState(() {
        has30daysDifference = true;
      });
    }
    return difference.inDays <= 30;
  }

  _showProgressBottomSheet(context, WidgetRef ref) async {
    _controller =
        await Scaffold.of(context).showBottomSheet((BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: 270.h,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Generating Zip',
                    style: TextStyle(
                        letterSpacing: -0.3,
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
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    isThreeLine: true,
                    leading: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                      width: 32.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(229, 240, 255, 1),
                          borderRadius: BorderRadius.circular(32.r),
                          border: Border.all(
                              color: Color.fromRGBO(245, 249, 255, 1),
                              width: 4.w)),
                      child: SvgPicture.asset(
                        'assets/images/film.svg',
                      ),
                    ),
                    title: Text(
                      "Camera 2 - The Bridges.mp4",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Fetching images",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor600,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.r),
                                  child: LinearPercentIndicator(
                                      width: 210.w,
                                      fillColor: Helper.textColor300,
                                      backgroundColor: Helper.textColor300,
                                      progressColor:
                                          ref.watch(primaryColorProvider),
                                      padding: EdgeInsets.zero,
                                      curve: Curves.easeInOut,
                                      barRadius: Radius.circular(4.r),
                                      lineHeight: 8.h,
                                      percent: _progressBar / 100),
                                ),
                                Text(
                                  "${(_progressBar).toInt()}%",
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: Helper.textColor700,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                )
                              ])
                        ]),
                    trailing: _progressBar == 100.0
                        ? SvgPicture.asset(
                            'assets/images/checkbox_base.svg',
                          )
                        : SizedBox(),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 52.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Close",
                        style: TextStyle(
                            letterSpacing: -0.3,
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
    });
  }

  _showStartDateBottomSheet(context, String startDate, String endDate,
      String selectedStartDate, String selectedEndDate, String currentDate) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(builder: (context, setState) {
          return Container(
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
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    selectedDayHighlightColor: ref.watch(primaryColorProvider),
                    lastDate: DateTime.parse(selectedEndDate),
                    firstDate: DateTime.parse(selectedStartDate),
                    currentDate: DateTime.parse(currentDate),
                  ),
                  value: [],
                  onValueChanged: (value) {
                    DateTime date = DateTime.parse(value[0].toString());
                    _selectedStartDate = DateFormat("yyyyMMdd").format(date);

                    String formattedDate = DateFormat('yyyyMMdd').format(date);
                    log("formatted" + formattedDate.toString());
                    showStartDate(formattedDate, false);
                  },
                ),
                Divider(
                  thickness: 0.5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Start time",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.baseBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp)),
                      SizedBox(width: 20.w),
                      CupertinoButton(
                        color: Helper.fillsBackground,
                        onPressed: () => _showDialog(
                          CupertinoDatePicker(
                            initialDateTime:
                                DateTime.parse("19700101T$startTime"),
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: false,
                            // This is called when the user changes the time.
                            onDateTimeChanged: (DateTime newTime) {
                              final timeString =
                                  DateTime.parse(newTime.toString());
                              String formattedTime =
                                  DateFormat('HHmmss').format(timeString);
                              setState(() {
                                startTime = formattedTime;

                                displayStartTime(startTime);
                              });
                            },
                          ),
                        ),
                        child: Text(
                          displayStartTime(startTime),
                          style: TextStyle(
                              letterSpacing: -0.3,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: Helper.baseBlack),
                        ),
                      ),
                    ]),
                SizedBox(height: 20.h),
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
                      // _selectedStartDate = selectedStartDate;
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }

  _showEndDateBottomSheet(
    context,
    String startDate,
    String endDate,
    String selectedStartDate,
    String selectedEndDate,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(builder: (context, setState) {
          return Container(
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
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    selectedDayHighlightColor: ref.watch(primaryColorProvider),
                    firstDate: DateTime.parse(selectedStartDate),
                    lastDate: DateTime.parse(selectedEndDate),
                  ),
                  value: [],
                  onValueChanged: (value) {
                    log(value.toString());
                    DateTime date = DateTime.parse(value[0].toString());
                    _selectedEndDate = DateFormat("yyyyMMdd").format(date);

                    String formattedDate = DateFormat('yyyyMMdd').format(date);
                    log("formatted" + formattedDate.toString());
                    showEndDate(formattedDate);
                    // setState(() {});
                  },
                ),
                Divider(
                  thickness: 0.5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("End time",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.baseBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: 17.sp)),
                      SizedBox(width: 20.w),
                      CupertinoButton(
                        color: Helper.fillsBackground,
                        onPressed: () => _showDialog(
                          CupertinoDatePicker(
                            initialDateTime:
                                DateTime.parse("19700101T$endTime"),
                            mode: CupertinoDatePickerMode.time,
                            use24hFormat: false,
                            // This is called when the user changes the time.
                            onDateTimeChanged: (DateTime newTime) {
                              final timeString =
                                  DateTime.parse(newTime.toString());
                              String formattedTime =
                                  DateFormat('HHmmss').format(timeString);

                              setState(() {
                                endTime = formattedTime;
                                displayEndTime(endTime);
                              });
                            },
                          ),
                        ),
                        // In this example, the time value is formatted manually.
                        // You can use the intl package to format the value based on
                        // the user's locale settings.
                        child: Text(
                          displayEndTime(endTime),
                          style: TextStyle(
                              letterSpacing: -0.3,
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w400,
                              color: Helper.baseBlack),
                        ),
                      ),
                    ]),
                SizedBox(height: 20.h),
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
                      // _selectedEndDate = selectedEndDate;
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }
}
