import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ListViewWidget extends StatefulWidget {
  final data;
  const ListViewWidget({super.key, this.data});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      height: 264.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Stack(
          fit: StackFit.loose,
          // alignment: Alignment.topCenter,
          children: [
            widget.data.latestImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r)),
                    child: AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.network(
                        widget.data.latestImage!.urlThumb,
                        // height: 284.h,
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
                    ))
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
              left: 16,
              child: BlurryContainer(
                  blur: 3,
                  padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
                  borderRadius: BorderRadius.circular(30.r),
                  color: Colors.white.withOpacity(0.1),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/updated.svg',
                        height: 10.h,
                        width: 9.w,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4.w),
                      Text(
                          widget.data.lastUpdated != null
                              ? showDateTimeString(
                                  widget.data.lastUpdated, 'h:mma · dd MMM yy')
                              : "N/A",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                    ],
                  )),
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
                      SvgPicture.asset(
                        'assets/images/weather.svg',
                        height: 10.h,
                        width: 9.w,
                        color: Colors.white,
                      ),
                      SizedBox(width: 4.w),
                      Text("25℃",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp)),
                    ],
                  )),
            ),
            Positioned.fill(
              // bottom: 7,
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.data.name!,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: Helper.baseBlack,
                              ),
                            ),
                            // SizedBox(
                            //   height: 6.h,
                            // ),
                            Text(
                              "Installed · " +
                                  showDate(widget.data.installationDate,
                                      'dd MMM yyyy'),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Helper.baseBlack.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                        TextButton(
                            onPressed: () {
                              context.push('/cameradetails', extra: {
                                "projectId": "projectId",
                                "projectName": widget.data.name!
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

showDateTimeString(date, dateFormat) {
  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(date);
  return formattedDate;
}

showDate(date, dateFormat) {
  // Parse the installationDate string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
