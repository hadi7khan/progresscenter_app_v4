import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/network/constants/endpoints.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/provider/basic_livelapse_controller.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

final progressBarProvider = StateProvider<double>((ref) => 0.0);

class ProgressNotifier extends ChangeNotifier {
  double bar = 0.0;
  void addProgress(progress) {
    bar = progress;
    notifyListeners();
  }
}

final progressProvider = ChangeNotifierProvider<ProgressNotifier>((ref) {
  return ProgressNotifier();
});

class BasicTabView extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  const BasicTabView(
      {super.key, required this.projectId, required this.cameraId});

  @override
  ConsumerState<BasicTabView> createState() => _BasicTabViewState();
}

class _BasicTabViewState extends BaseConsumerState<BasicTabView> {
  PersistentBottomSheetController? _controller; // <------ Instance variable
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _timeStamp = false;
  bool _stability = false;
  bool _dustyImages = false;
  String _duration = "1";
  String _showDuration = "1 Day";
  String _showQuality = "Select Quality";
  String _quality = "SD";
  bool _isLoading = false;
  double _progressBar = 0.0;
  IO.Socket? socket;

  @override
  void initState() {
    super.initState();
    // initSocket();
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
      // socket!.on("livelapse:progress", (livelapseId, data, progress) => null);

      socket!.on('livelapse:progress', (data) {
        print("progress" + data.toString());
        print("operation" + data["operation"].toString());
        // ref.read(progressBarProvider.notifier).state = data["progress"].toDouble();
        // ref.read(progressBarProvider.notifier).state++;
        // setState(() {
        //   _progressBar = double.parse(data["progress"].toString());
        // });
        _controller!.setState!(() {
          _progressBar = double.parse(data["progress"].toString());
        });
        ref
            .read(progressProvider.notifier)
            .addProgress(data["progress"].toDouble());

        // progressTabCtx.updateItem(itemData._id, { text: operation, progress: progress });
      });

      socket!.on('livelapse:completed', (data) {
        print("completed" + data.toString());
        socket!.disconnect();
        socket!.dispose();

        // progressTabCtx.updateItem(itemData._id, { text: operation, progress: progress });
      });
      socket!.on('livelapse:errored', (data) {
        print("errored" + data.toString());
        socket!.disconnect();
        socket!.dispose();
        // progressTabCtx.updateItem(itemData._id, { text: operation, progress: progress });
      });
    });
    // socket!.disconnect();
    // socket!.dispose();
    // socket!.destroy();
    socket!.onDisconnect((_) => print('Connection Disconnection'));
    socket!.onConnectError((err) => print(err));
    socket!.onError((err) => print(err));
  }

  // @override
  // void dispose() {
  //   socket!.disconnect();
  //   socket!.dispose();
  //   super.dispose();
  // }

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
                      "Select Duration",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 8.h),
                    InkWell(
                      onTap: () {
                        _showDurationBottomSheet(context);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          leading: SvgPicture.asset('assets/images/clock.svg',
                              color: Helper.textColor500),
                          title: Text(
                            _showDuration,
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
                      "Select Quality",
                      style: TextStyle(
                          letterSpacing: -0.3,
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
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "Time and Date will be visible",
                        style: TextStyle(
                            letterSpacing: -0.3,
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
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "AI Powered technology",
                        style: TextStyle(
                            letterSpacing: -0.3,
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
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      subtitle: Text(
                        "AI Powered technology",
                        style: TextStyle(
                            letterSpacing: -0.3,
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
                  setState(() {
                    _isLoading = true;
                  });
                  Map<String, dynamic> data = {
                    "days": _duration,
                    "quality": _quality,
                    "hasTimestamp": _timeStamp,
                    "hasAiBlending": _stability,
                    "filterBlurryImages": _dustyImages,
                  };
                  await ref
                      .watch(basicLivelapseProvider.notifier)
                      .basicLivelapse(widget.projectId, widget.cameraId, data)
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

  _showDurationBottomSheet(context) {
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
        height: 560.h,
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
                InkWell(
                  onTap: () async {
                    setState(() {
                      _duration = "1";
                      _showDuration = "1 Day";
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
                      '1 Day',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "5";
                      _showDuration = "5 Days";
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
                      '5 Days',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "15";
                      _showDuration = "15 Days";
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
                      '15 Days',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "30";
                      _showDuration = "30  Days";
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
                      '30 Days',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "90";
                      _showDuration = "3 Months";
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
                      '3 Months',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "180";
                      _showDuration = "6 Months";
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
                      '6 Months',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _duration = "365";
                      _showDuration = "1 Year";
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
                      '1 Year',
                      style: TextStyle(
                          letterSpacing: -0.3,
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
                      // setState(() {
                      //       _isLoading = true;
                      //     });
                      //     Map<String, dynamic> data = {
                      //       "quality": _quality,
                      //       "days": _duration,
                      //       "hasTimestamp": _timeStamp,
                      //       "hasAiBlending": _stability,
                      //       "filterBlurryImages": _dustyImages
                      //     };
                      //     print(data.toString());
                      //     await ref
                      //         .watch(inviteMembersProvider.notifier)
                      //         .inviteMember(data, widget.projectId)
                      //         .then((value) async {
                      //       value.fold((failure) {
                      //         print("errorrrrrr");
                      //       }, (data) {
                      //         // final token = data['token'];
                      //         // context.push('/verifyEmail',
                      //         //     extra: {"token": token});
                      //         context.pop();
                      //           Utils.toastSuccessMessage(
                      //           "Member Added",);
                      //       });

                      //       setState(() {
                      //         _isLoading = false;
                      //       });
                      //     });
                      // context.pop();
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
                          letterSpacing: -0.3,
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
                          letterSpacing: -0.3,
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
  }

  calculateProgress(double sentBytes) {
    print("sentBytes--------------" + sentBytes.toString());
    _progressBar = sentBytes;
    return sentBytes;
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
    //                                         progressColor: ref.watch(primaryColorProvider),
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
}
