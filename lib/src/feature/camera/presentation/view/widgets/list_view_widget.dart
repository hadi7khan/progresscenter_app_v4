import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ListViewWidget extends StatefulWidget {
  final data;
  final projectName;
  const ListViewWidget({super.key, this.data, this.projectName});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/cameradetails', extra: {
          "projectId": widget.data.project,
          "projectName": widget.projectName,
          "cameraId": widget.data.id,
        });
      },
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        height: 264.h,
        decoration: BoxDecoration(
          color: Helper.widgetBackground,
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
                          child: CachedNetworkImage(
                            imageUrl: widget.data.latestImage!.urlThumb,
                            // memCacheHeight: height.toInt(), memCacheWidth: width.toInt()
                            fit: BoxFit.fill,
                            // placeholder: (context, url) =>
                            //     CircularProgressIndicator(),
                            errorWidget: (context, url, error) => ClipRRect(
                              child: Image.asset(
                                'assets/images/error_image.jpeg',
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                          //  Image.network(
                          //   widget.data.latestImage!.urlThumb,
                          //   // height: 284.h,
                          //   fit: BoxFit.fill,
                          //   errorBuilder: (BuildContext context, Object exception,
                          //       StackTrace? stackTrace) {
                          //     return ClipRRect(
                          //       child: Image.asset(
                          //         'assets/images/error_image.jpeg',
                          //         fit: BoxFit.cover,
                          //       ),
                          //     );
                          //   },
                          // ),
                          ))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        'assets/images/error_image.jpeg',
                        fit: BoxFit.fill,
                        height: 264.h,
                      ),
                    ),
              // Positioned(
              //   top: 16,
              //   left: 16,
              //   child: BlurryContainer(
              //       blur: 3,
              //       padding:
              //           EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
              //       borderRadius: BorderRadius.circular(30.r),
              //       color: Colors.white.withOpacity(0.1),
              //       child: Row(
              //         children: [
              //           SvgPicture.asset(
              //             'assets/images/updated.svg',
              //             height: 10.h,
              //             width: 9.w,
              //             color: Colors.white,
              //           ),
              //           SizedBox(width: 4.w),
              //           Text(
              //               widget.data.lastUpdated != null
              //                   ? showDateTimeString(widget.data.lastUpdated,
              //                       'h:mma · dd MMM yy')
              //                   : "N/A",
              //               style: TextStyle(
              //                   letterSpacing: -0.3,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 12.sp)),
              //         ],
              //       )),
              // ),
              // Positioned(
              //   top: 16,
              //   right: 16,
              //   child: BlurryContainer(
              //       blur: 3,
              //       padding:
              //           EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
              //       borderRadius: BorderRadius.circular(30.r),
              //       color: Colors.white.withOpacity(0.1),
              //       child: Row(
              //         children: [
              //           SvgPicture.asset(
              //             'assets/images/weather.svg',
              //             height: 10.h,
              //             width: 9.w,
              //             color: Colors.white,
              //           ),
              //           SizedBox(width: 4.w),
              //           Text("25℃",
              //               style: TextStyle(
              //                   letterSpacing: -0.3,
              //                   color: Colors.white,
              //                   fontWeight: FontWeight.w500,
              //                   fontSize: 12.sp)),
              //         ],
              //       )),
              // ),
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
                              Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      color: widget.data.latestImage != null
                                          ? isDateTimeWithin24Hours(
                                              widget.data.latestImage.datetime,
                                            )
                                              ? Helper.successColor
                                              : Helper.errorColor
                                          : Helper.errorColor,
                                      size: 10,
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    Text(
                                      widget.data.name!,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        letterSpacing: -0.3,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Helper.baseBlack,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // SizedBox(
                              //   height: 6.h,
                              // ),
                              Row(
                                children: [
                                  Text(
                                    "Last Uploaded · ",
                                    style: TextStyle(
                                      letterSpacing: -0.3,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Helper.baseBlack.withOpacity(0.5),
                                    ),
                                  ),
                                  Text(
                                    // "Last Uploaded · " +
                                    widget.data.latestImage != null
                                        ? showDateTimeString(
                                            widget.data.latestImage.datetime,
                                            'dd MMM yy · h:mma ')
                                        : "N/A",
                                    style: TextStyle(
                                      letterSpacing: -0.3,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Helper.baseBlack.withOpacity(0.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          // TextButton(
                          //     onPressed: () {
                          //       context.push('/cameradetails', extra: {
                          //         "projectId": widget.data.project,
                          //         "projectName": widget.data.name!,
                          //         "cameraId": widget.data.id,
                          //       });
                          //     },
                          //     style: ButtonStyle(
                          //         shape: MaterialStateProperty.all(
                          //             RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(8.r),
                          //         )),
                          //         backgroundColor:
                          //             MaterialStateProperty.all(Colors.white)),
                          //     child: Text(
                          //       "View",
                          //       style: TextStyle(
                          //           color: Helper.baseBlack,
                          //           fontSize: 14.sp,
                          //           letterSpacing: 0.2,
                          //           fontWeight: FontWeight.w600),
                          //     ))
                        ],
                      )),
                ),
              ),
            ]),
      ),
    );
  }
}

showDateTimeString(datetime, dateFormat) {
  // Format the DateTime object into the desired format
  String dateWithT = datetime!.substring(0, 8) + 'T' + datetime!.substring(8);
  DateTime dateTime = DateTime.parse(dateWithT);
  print("datetime" + dateTime.toString());

  // print("isactive" + isActive.toString());

  final String formattedTime = DateFormat(dateFormat).format(dateTime);
  // final String formatTimeForBool =
  // DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  // isDateTimeWithin24Hours(formatTimeForBool);
  // print("formatTimeForBool" + formatTimeForBool.toString());
  return formattedTime;
}

bool isDateTimeWithin24Hours(String datetime) {
  DateTime now = DateTime.now();
  // Format the DateTime object into the desired format
  String dateWithT = datetime!.substring(0, 8) + 'T' + datetime!.substring(8);
  DateTime dateTime = DateTime.parse(dateWithT);
  final String formatTimeForBool =
      DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  DateTime dateTimeParsed = DateTime.parse(formatTimeForBool);
  Duration difference = now.difference(dateTimeParsed);
  print("difference" + difference.toString());
  bool isactiveeee = difference.inHours < 24;
  print("isactiveeee" + isactiveeee.toString());

  return difference.inHours < 24;
}

showDate(date, dateFormat) {
  // Parse the string to a DateTime object
  DateTime dateTime = DateFormat("yyyyMMddHHmmss").parse(date);

  // Format the date in the desired format
  String formattedDate = DateFormat("hh:mm a · dd MMM, yyyy").format(dateTime);
  return formattedDate;
}
