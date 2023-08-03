import 'dart:convert';
import 'dart:ui';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/provider/advanced_livelapse_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class AdvancedTabview extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  const AdvancedTabview(
      {super.key, required this.projectId, required this.cameraId});

  @override
  ConsumerState<AdvancedTabview> createState() => _AdvancedTabviewState();
}

class _AdvancedTabviewState extends BaseConsumerState<AdvancedTabview> {
  PersistentBottomSheetController? _controller; // <------ Instance variable
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _timeStamp = false;
  bool _stability = false;
  bool _dustyImages = false;
  bool _isLoading = false;
  String _selectedStartDate = '';
  String _selectedEndDate = '';
  String _images = "1";
  String _showImages = "1 Image";
  String _showQuality = "Select Quality";
  String _quality = "SD";
  final ImagePicker _picker = ImagePicker();
  XFile? _logo;
  String? _logoBase64;
  XFile? _startSlide;
  String? _startSlideBase64;
  XFile? _endSlide;
  String? _endSlideBase64;
  double _progressBar = 0.0;
  IO.Socket? socket;
  String startTime = "070000";
  String endTime = "190000";
  String startParsedTime = "";
  String endParsedTime = "";

  Future<void> _pickLogo(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _logoBase64 = base64Encode(bytes);
      });
      if (await file.length() > 1000000) {
        // The file is too large, show an error message
        return;
      }
      setState(() {
        _logo = file;
      });
      print("image path" + _logo!.path.toString());
    }
  }

  Future<void> _pickStartSlide(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _startSlideBase64 = base64Encode(bytes);
      });
      if (await file.length() > 1000000) {
        // The file is too large, show an error message
        return;
      }
      setState(() {
        _startSlide = file;
      });
      print("image path" + _startSlide!.path.toString());
    }
  }

  Future<void> _pickEndSlide(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        _endSlideBase64 = base64Encode(bytes);
      });
      if (await file.length() > 1000000) {
        // The file is too large, show an error message
        return;
      }
      setState(() {
        _endSlide = file;
      });
      print("image path" + _endSlide!.path.toString());
    }
  }

  initSocket(String livelapseId) {
    socket = IO.io(Endpoints.baseUrl, <String, dynamic>{
      'autoConnect': true,
      'transports': ['websocket'],
    });
    // socket.connect();
    socket!.onConnect((_) {
      print('Connection established');
      socket!.emit('joinRoom', "livelapse:$livelapseId");

      socket!.on('livelapse:progress', (data) {
        print("progress" + data.toString());
        print("operation" + data["operation"].toString());
        _controller!.setState!(() {
          _progressBar = double.parse(data["progress"].toString());
        });
      });

      socket!.on('livelapse:completed', (data) {
        print("completed" + data.toString());
        socket!.dispose();
        // progressTabCtx.updateItem(itemData._id, { text: operation, progress: progress });
      });
      socket!.on('livelapse:errored', (data) {
        print("errored" + data.toString());
        socket!.dispose();
        // progressTabCtx.updateItem(itemData._id, { text: operation, progress: progress });
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
    print(parsedDateTime.toString());
    startParsedTime = DateFormat('h:mm a').format(parsedDateTime);
    return startParsedTime;
  }

  displayEndTime(String time) {
    DateTime parsedDateTime = DateTime.parse("19700101T$time");
    print(parsedDateTime.toString());
    endParsedTime = DateFormat('h:mm a').format(parsedDateTime);
    return endParsedTime;
  }

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
                            _showImages,
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
                        _showStartDateBottomSheet(context, "23", "22",
                            _selectedStartDate, _selectedEndDate);
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
                            _showQuality,
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
                        onTap: () {
                          _showBottomSheet(
                              context, "progress", true, false, false);
                        },
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
                        trailing: _logo != null
                            ? Container(
                                height: 46.h,
                                width: 46.w,
                                decoration: BoxDecoration(
                                    color: Helper.svgBackground,
                                    borderRadius: BorderRadius.circular(8.r)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.memory(
                                      base64Decode(_logoBase64!),
                                      fit: BoxFit.fill),
                                ),
                              )
                            : Container(
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
                      onTap: () {
                        _showBottomSheet(
                            context, "progress", false, true, false);
                      },
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
                      trailing: _startSlide != null
                          ? Container(
                              height: 46.h,
                              width: 46.w,
                              decoration: BoxDecoration(
                                  color: Helper.svgBackground,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.memory(
                                    base64Decode(_startSlideBase64!),
                                    fit: BoxFit.fill),
                              ),
                            )
                          : Container(
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
                      onTap: () {
                        _showBottomSheet(
                            context, "progress", false, false, true);
                      },
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
                      trailing: _endSlide != null
                          ? Container(
                              height: 46.h,
                              width: 46.w,
                              decoration: BoxDecoration(
                                  color: Helper.svgBackground,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.memory(
                                    base64Decode(_endSlideBase64!),
                                    fit: BoxFit.fill),
                              ),
                            )
                          : Container(
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
                child: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Create LiveLapse",
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
                  FormData? formData = FormData.fromMap({
                    "startDate": _selectedStartDate,
                    "endDate": _selectedEndDate,
                    "startTime": startTime,
                    "endTime": endTime,
                    "imagesPerDay": _images,
                    "quality": _quality,
                    "hasTimestamp": _timeStamp,
                    "hasAiBlending": _stability,
                    "filterBlurryImages": _dustyImages,
                  });
                  if (_logo != null) {
                    formData.files.add(MapEntry(
                        "logo", await MultipartFile.fromFile(_logo!.path)));
                  }
                  if (_startSlide != null) {
                    formData.files.add(MapEntry("startingSlide",
                        await MultipartFile.fromFile(_startSlide!.path)));
                  }
                  if (_endSlide != null) {
                    formData.files.add(MapEntry("endingSlide",
                        await MultipartFile.fromFile(_endSlide!.path)));
                  }

                  setState(() {
                    _isLoading = true;
                  });
                  await ref
                      .watch(advancedLivelapseProvider.notifier)
                      .advancedLivelapse(
                          widget.projectId, widget.cameraId, formData)
                      .then((value) async {
                    value.fold((failure) {
                      print("errorrrrrr");
                    }, (res) {
                      print("response data" + res.toString());
                      initSocket(res["_id"]);
                      _showProgressBottomSheet(context, ref);
                    });

                    Utils.toastSuccessMessage("Livelapse Created");

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
                },
              ),
            ),
          ],
        ),
      ),
    );
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
                    'Generating LiveLapse',
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
                                      progressColor: Helper.primary,
                                      padding: EdgeInsets.zero,
                                      curve: Curves.easeInOut,
                                      barRadius: Radius.circular(4.r),
                                      lineHeight: 8.h,
                                      percent: _progressBar / 100),
                                ),
                                Text(
                                  "${(_progressBar).toInt()}%",
                                  style: TextStyle(
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
    // return showModalBottomSheet(
    //     context: context,
    //     backgroundColor: Colors.transparent,
    //     builder: (context) {
    //       return Consumer(builder: (context, watch, child) {
    //         // final progress = ref.watch(progressBarProvider.notifier).state;
    //         final progress = ref.watch(progressProvider).bar;
    //         print("progresssss in bottom sheet" + progress.toString());
    //         return StatefulBuilder(
    //             builder: (BuildContext cntx, StateSetter setState) {
    //           setState(() {});
    //           return Container(
    //             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(16.r),
    //                   topRight: Radius.circular(16.r)),
    //               color: Colors.white,
    //             ),
    //             height: 270.h,
    //             width: MediaQuery.of(context).size.width,
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   crossAxisAlignment: CrossAxisAlignment.center,
    //                   children: [
    //                     Text(
    //                       'Generating LiveLapse',
    //                       style: TextStyle(
    //                           color: Helper.baseBlack,
    //                           fontSize: 18.sp,
    //                           fontWeight: FontWeight.w500),
    //                     ),
    //                   ],
    //                 ),
    //                 SizedBox(height: 20.h),
    //                 Column(
    //                   mainAxisAlignment: MainAxisAlignment.start,
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: [
    //                     ListTile(
    //                       contentPadding: EdgeInsets.zero,
    //                       isThreeLine: true,
    //                       leading: Container(
    //                         padding: EdgeInsets.symmetric(
    //                             horizontal: 6.w, vertical: 6.h),
    //                         width: 32.w,
    //                         height: 32.h,
    //                         decoration: BoxDecoration(
    //                             color: Color.fromRGBO(229, 240, 255, 1),
    //                             borderRadius: BorderRadius.circular(32.r),
    //                             border: Border.all(
    //                                 color: Color.fromRGBO(245, 249, 255, 1),
    //                                 width: 4.w)),
    //                         child: SvgPicture.asset(
    //                           'assets/images/film.svg',
    //                         ),
    //                       ),
    //                       title: Text(
    //                         "Camera 2 - The Bridges.mp4",
    //                         style: TextStyle(
    //                             color: Helper.textColor700,
    //                             fontSize: 14,
    //                             fontWeight: FontWeight.w500),
    //                       ),
    //                       subtitle: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           mainAxisSize: MainAxisSize.min,
    //                           children: [
    //                             Text(
    //                               "Fetching images",
    //                               style: TextStyle(
    //                                   color: Helper.textColor600,
    //                                   fontSize: 14,
    //                                   fontWeight: FontWeight.w400),
    //                             ),
    //                             SizedBox(height: 10.h),
    //                             Row(
    //                                 mainAxisSize: MainAxisSize.max,
    //                                 mainAxisAlignment:
    //                                     MainAxisAlignment.spaceBetween,
    //                                 children: [
    //                                   ClipRRect(
    //                                     borderRadius:
    //                                         BorderRadius.circular(4.r),
    //                                     child: LinearPercentIndicator(
    //                                         width: 210.w,
    //                                         fillColor: Helper.textColor300,
    //                                         backgroundColor:
    //                                             Helper.textColor300,
    //                                         progressColor: Helper.primary,
    //                                         padding: EdgeInsets.zero,
    //                                         curve: Curves.easeInOut,
    //                                         barRadius: Radius.circular(4.r),
    //                                         lineHeight: 8.h,
    //                                         percent: progress / 100),
    //                                   ),
    //                                   Text(
    //                                     "${(_progressBar).toInt()}%",
    //                                     style: TextStyle(
    //                                         color: Helper.textColor700,
    //                                         fontSize: 14,
    //                                         fontWeight: FontWeight.w500),
    //                                   )
    //                                 ])
    //                           ]),
    //                       trailing: SvgPicture.asset(
    //                         'assets/images/checkbox_base.svg',
    //                       ),
    //                     ),
    //                     SizedBox(height: 20.h),
    //                     Container(
    //                       height: 52.h,
    //                       width: double.infinity,
    //                       child: ElevatedButton(
    //                         child: Text(
    //                           "Close",
    //                           style: TextStyle(
    //                               color: Colors.white,
    //                               fontSize: 16,
    //                               fontWeight: FontWeight.w500),
    //                           // currentIndex == contents.length - 1 ? "Continue" : "Next"
    //                         ),
    //                         style: ButtonStyle(
    //                             backgroundColor:
    //                                 MaterialStatePropertyAll(Helper.baseBlack),
    //                             shape: MaterialStateProperty.all(
    //                               RoundedRectangleBorder(
    //                                 borderRadius: BorderRadius.circular(8.r),
    //                               ),
    //                             )),
    //                         onPressed: () {
    //                           context.pop();
    //                         },
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           );
    //         });
    //       });
    //     });
  }

  _showBottomSheet(
      context, progress, bool logo, bool startSlide, bool endSlide) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 340.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Upload Media',
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
                  onTap: () async {
                    if (logo) {
                      _pickLogo(ImageSource.camera).then((value) {
                        context.pop();
                      });
                    } else if (startSlide) {
                      _pickStartSlide(ImageSource.camera).then((value) {
                        context.pop();
                      });
                    } else {
                      _pickEndSlide(ImageSource.camera).then((value) {
                        context.pop();
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Take Photo',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (logo) {
                      _pickLogo(ImageSource.gallery).then((value) {
                        context.pop();
                      });
                    } else if (startSlide) {
                      _pickStartSlide(ImageSource.gallery).then((value) {
                        context.pop();
                      });
                    } else {
                      _pickEndSlide(ImageSource.gallery).then((value) {
                        context.pop();
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Choose Photo',
                      style: TextStyle(
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (logo) {
                      _pickLogo(ImageSource.gallery).then((value) {
                        context.pop();
                      });
                    } else if (startSlide) {
                      _pickStartSlide(ImageSource.gallery).then((value) {
                        context.pop();
                      });
                    } else {
                      _pickEndSlide(ImageSource.gallery).then((value) {
                        context.pop();
                      });
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Browse from files',
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

  _showImageBottomSheet(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
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
                  'Select Images',
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
                  onTap: () async {
                    setState(() {
                      _images = "1";
                      _showImages = "1 Image";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
                  onTap: () async {
                    setState(() {
                      _images = "3";
                      _showImages = "3 Images";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
                  onTap: () async {
                    setState(() {
                      _images = "5";
                      _showImages = "5 Images";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
                  onTap: () async {
                    setState(() {
                      _images = "10";
                      _showImages = "10 Images";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
                  onTap: () async {
                    setState(() {
                      _images = "15";
                      _showImages = "15 Images";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
                  onTap: () async {
                    setState(() {
                      _images = "20";
                      _showImages = "20 Images";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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

  _showStartDateBottomSheet(context, String startDate, String endDate,
      String selectedStartDate, String selectedEndDate) {
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
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    selectedDayHighlightColor: Helper.primary,
                      // lastDate: DateTime.parse(endDate),
                      // firstDate: DateTime.parse(startDate),
                      ),
                  value: [],
                  onValueChanged: (value) {
                    print(value.toString());
                    DateTime date = DateTime.parse(value[0].toString());
                    selectedStartDate = DateFormat("yyyyMMdd").format(date);
                    print("selectedDate " + selectedStartDate);
                    displayStartTime(selectedStartDate);
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
                                print(startTime.toString());
                                displayStartTime(startTime);
                              });
                            },
                          ),
                        ),
                        // In this example, the time value is formatted manually.
                        // You can use the intl package to format the value based on
                        // the user's locale settings.
                        child: Text(
                          displayStartTime(startTime),
                          style: TextStyle(
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
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.primary),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )),
                    onPressed: () {
                      _selectedStartDate = selectedStartDate;
                      context.pop();
                      _showEndDateBottomSheet(
                          context, "23", "22", selectedEndDate);
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
    String selectedEndDate,
  ) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(
          builder: (context, setState) {
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
                            color: Helper.baseBlack,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  CalendarDatePicker2(
                    config: CalendarDatePicker2Config(
                      selectedDayHighlightColor: Helper.primary,
                        // lastDate: DateTime.parse(endDate),
                        // firstDate: DateTime.parse(startDate),
                        ),
                    value: [],
                    onValueChanged: (value) {
                      print(value.toString());
                      DateTime date = DateTime.parse(value[0].toString());
                      selectedEndDate = DateFormat("yyyyMMdd").format(date);
                      print("selectedDate " + selectedEndDate);
                    },
                  ),
                  Divider(
                    thickness: 0.5,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    Text("End time",
                        style: TextStyle(
                            color: Helper.baseBlack,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.sp)),
                    SizedBox(width: 20.w),
                    CupertinoButton(
                      color: Helper.fillsBackground,
                      onPressed: () => _showDialog(
                        CupertinoDatePicker(
                          initialDateTime: DateTime.parse("19700101T$endTime"),
                          mode: CupertinoDatePickerMode.time,
                          use24hFormat: false,
                          // This is called when the user changes the time.
                          onDateTimeChanged: (DateTime newTime) {
                            final timeString = DateTime.parse(newTime.toString());
                            String formattedTime =
                                DateFormat('HHmmss').format(timeString);
                            setState(() {
                              endTime = formattedTime;
                              print("endtime " + endTime);
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
                        _selectedEndDate = selectedEndDate;
                        context.pop();
                      },
                    ),
                  ),
                ],
              ),
            );
          }
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
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
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
                  onTap: () async {
                    setState(() {
                      _showQuality = "Standard definitions";
                      _quality = "SD";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
                  onTap: () {
                    setState(() {
                      _showQuality = "High Definition";
                      _quality = "HD";
                    });
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
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
