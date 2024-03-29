import 'dart:async';
import 'dart:developer';

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
  Timer? _timer;
  bool isOnline = false;

  @override
  void initState() {
    super.initState();

    // Start the timer when the widget is initialized
    // _timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   _checkStatus();
    // });

    // Initial check for the status
    _checkStatus();
  }

  Future _checkStatus() async {
    try {
      final response =
          await Dio().get(widget.data.streamingUrl + "&q=hadikhan");
      setState(() {
        isOnline = true;
      });
      log('cctv response   ' + response.data.toString());
      log('cctv response code   ' + response.statusCode.toString());
      // Check for a successful status code and a content-type header
      if (response.statusCode == 200) {
        setState(() {
          isOnline = true;
          log('isOnline changed   ' + isOnline.toString());
          log('streaming url   ' + widget.data.streamingUrl.toString());
        });
      } else {
        setState(() {
          isOnline = false;
        });
      }
    } catch (e, stackTrace) {
      log('error streaming url   ' + widget.data.streamingUrl.toString());
      setState(() {
        isOnline = false;
      });
    }
  }

  @override
  void dispose() {
    // _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Schedule a call to _checkStatus every 5 seconds
    // _timer = Timer.periodic(Duration(seconds: 5), (timer) {
    //   _checkStatus();
    // });
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: isOnline
          ? () {
              context.push('/fullViewCCTV', extra: {
                "projectId": widget.data.project,
                "name": widget.data.name,
                "streamingUrl": widget.data.streamingUrl,
                // "type": widget.data.type
              });
            }
          : null,
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: 264.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(
            fit: StackFit.loose,
            alignment: Alignment.topCenter,
            children: [
              widget.data.latestImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r)),
                      child: Image.network(
                        widget.data.latestImage.url!,
                        fit: BoxFit.fill,
                        gaplessPlayback: true,
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
                    padding:
                        EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                    borderRadius: BorderRadius.circular(30.r),
                    color: Colors.white.withOpacity(0.1),
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          size: 8,
                          color: isOnline
                              ? Helper.successColor
                              : Helper.errorColor,
                        ),
                        SizedBox(width: 4.w),
                        Text(isOnline ? "Online" : "Offline",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: isOnline
                                    ? Helper.successColor
                                    : Helper.errorColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp)),
                      ],
                    )),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                      height: 88.h,
                      width: double.infinity,
                      margin: EdgeInsets.zero,
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
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
                        ],
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}

showDate(date, dateFormat) {
  DateTime parsedDate = DateTime.parse(date);

  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
