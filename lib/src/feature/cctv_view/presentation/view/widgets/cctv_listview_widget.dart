import 'dart:async';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:http/http.dart' as http;

class CctvListViewWidget extends StatefulWidget {
  final data;
  const CctvListViewWidget({super.key, this.data});

  @override
  State<CctvListViewWidget> createState() => _CctvListViewWidgetState();
}

class _CctvListViewWidgetState extends State<CctvListViewWidget> {
  late Timer _timer;
  bool isOnline = false;

  // @override
  // void initState() {
  //   super.initState();

  // // Start the timer when the widget is initialized
  // _timer = Timer.periodic(Duration(seconds: 5), (timer) {
  //   _checkStatus();
  // });

  // Initial check for the status
  // _checkStatus();
  // }

  Future _checkStatus() async {
    try { 
      // Assume that widget.data.streamingUrl is not null
      final response = await Dio().get(widget.data.streamingUrl!);
      print('cctv response   ' + response.data.toString());
      print('cctv response code   ' + response.statusCode.toString());
      // Check for a successful status code and a content-type header
      if (response.statusCode == 200) {
        setState(() {
          isOnline = true;
          print('isOnline changed   ' + isOnline.toString());
        });
      } else {
        setState(() {
          isOnline = false;
        });
      }
    } catch (e, stackTrace) {
      print('Error checking status: $e');
      print('StackTrace: $stackTrace');
      setState(() {
        isOnline = false;
      });
    }
  }

  @override
  void dispose() {
    // Cancel the timer when the widget is disposed
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Schedule a call to _checkStatus every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _checkStatus();
    });
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 264.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child:
          Stack(fit: StackFit.loose, alignment: Alignment.topCenter, children: [
        widget.data.latestImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Image.network(
                  widget.data.latestImage.url!,
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
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  'assets/images/error_image.jpeg',
                  fit: BoxFit.fill,
                  height: 264.h,
                ),
              ),
        Positioned(
          top: 16,
          right: 16,
          child: BlurryContainer(
              blur: 3,
              padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.white.withOpacity(0.1),
              child: Row(
                children: [
                  Icon(Icons.circle, size: 8, color: isOnline ? Helper.successColor : Helper.errorColor,),
                  // SvgPicture.asset(
                  //   'assets/images/updated.svg',
                  //   height: 10.h,
                  //   width: 9.w,
                  //   color: Colors.white,
                  // ),
                  SizedBox(width: 4.w),
                  Text(isOnline ? "Online" : "Offline",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: isOnline ? Helper.successColor : Helper.errorColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp)),
                ],
              )),
        ),
        Positioned.fill(
          // bottom: 20,
          // left: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 88.h,
                width: double.infinity,
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Color.fromRGBO(246, 246, 246, 1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              widget.data.name!,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: TextStyle(
                                letterSpacing: -0.3,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                color: Helper.baseBlack,
                              ),
                            ),
                          ),
                          Text(
                            "Installed · " +
                                showDate(widget.data.installationDate,
                                    'dd MMM yyyy'),
                            style: TextStyle(
                              letterSpacing: -0.3,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Helper.baseBlack.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          context.push('/fullViewCCTV', extra: {
                            "projectId": widget.data.project,
                            "name": widget.data.name,
                            "streamingUrl": widget.data.streamingUrl,
                            // "type": widget.data.type
                          });
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                            )),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        child: Text(
                          "View",
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 14.sp,
                              letterSpacing: 0.2,
                              fontWeight: FontWeight.w600),
                        ))
                  ],
                )),
          ),
        ),
      ]),
    );
  }
}

showDate(date, dateFormat) {
  // Parse the installationDate string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
