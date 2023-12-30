import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/camera/data/model/camera_model.dart';
import 'dart:developer';

import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/camera_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_by_cam_id_controller.dart';

class CamerasWidget extends ConsumerStatefulWidget {
  final List<CameraModel> data;
  final projectId;
  final projectName;

  const CamerasWidget(
      {super.key,
      required this.data,
      required this.projectId,
      required this.projectName});

  @override
  ConsumerState<CamerasWidget> createState() => _CamerasWidgetState();
}

class _CamerasWidgetState extends BaseConsumerState<CamerasWidget> {
  showDateTimeString(datetime, dateFormat) {
    // Format the DateTime object into the desired format
    String dateWithT = datetime!.substring(0, 8) + 'T' + datetime!.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    print("datetime" + dateTime.toString());

    final String formattedTime = DateFormat(dateFormat).format(dateTime);

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    log(widget.data.toString());
    return Container(
      padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Change Camera",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: widget.data.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(height: 20.h);
              },
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () async {
                    context.pushReplacement('/cameradetails', extra: {
                      "projectId": widget.projectId,
                      "projectName": widget.projectName,
                      "cameraId": widget.data[index].id,
                    });
                    // WidgetsBinding.instance.addPostFrameCallback((_) {
                    //   ref
                    //       .refresh(imagesByCamIdControllerProvider.notifier)
                    //       .getImagesByCamId(
                    //         widget.projectId,
                    //         widget.data[index].id,
                    //       );
                    // });

                    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    //   ref
                    //       .read(imagesByCamIdControllerProvider.notifier)
                    //       .getImagesByCamId(
                    //         widget.projectId,
                    //         widget.data[index].id,
                    //       )
                    //       .then((value) {
                    //     log("imagesByCamIdControllerProvider executed----------");
                    //   });
                    // });
                    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    //   ref
                    //       .read(cameraByIdControllerProvider.notifier)
                    //       .getCameraById(
                    //         widget.projectId,
                    //         widget.data[index].id,
                    //       )
                    //       .then((value) {
                    //     log("cameraByIdControllerProvider executed----------");
                    //   });
                    // });
                    context.pop();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 4,
                          child: widget.data[index].latestImage != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8.r),
                                  ),
                                  child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: CachedNetworkImage(
                                        imageUrl: widget
                                            .data[index].latestImage!.urlThumb,
                                        // memCacheHeight: height.toInt(), memCacheWidth: width.toInt()
                                        fit: BoxFit.fill,
                                        // placeholder: (context, url) =>
                                        //     CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            ClipRRect(
                                          child: Image.asset(
                                            'assets/images/error_image.jpeg',
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      )))
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: AspectRatio(
                                    aspectRatio: 16 / 9,
                                    child: Image.asset(
                                      'assets/images/error_image.jpeg',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )),
                      Expanded(
                          flex: 6,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.data[index].name!,
                                  style: TextStyle(
                                      color: Helper.textColor600,
                                      letterSpacing: -0.3,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  // "Last Uploaded · " +
                                  widget.data[index].latestImage != null
                                      ? showDateTimeString(
                                          widget.data[index].latestImage!
                                              .datetime,
                                          'dd MMM yy · h:mma ')
                                      : "N/A",
                                  style: TextStyle(
                                    letterSpacing: -0.3,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Helper.textColor600,
                                  ),
                                ),
                              ],
                            ),
                          ))
                    ],
                  ),
                );

                // ListTile(
                //   horizontalTitleGap: 12.w,
                //   // dense: true,
                //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                //   contentPadding: EdgeInsets.only(bottom: 10.h),
                //   leading: widget.data[index].latestImage != null
                //       ? ClipRRect(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(8.r),
                //           ),
                //           child: AspectRatio(
                //               aspectRatio: 16 / 9,
                //               child: CachedNetworkImage(
                //                 imageUrl:
                //                     widget.data[index].latestImage!.urlThumb,
                //                 // memCacheHeight: height.toInt(), memCacheWidth: width.toInt()
                //                 fit: BoxFit.fill,
                //                 // placeholder: (context, url) =>
                //                 //     CircularProgressIndicator(),
                //                 errorWidget: (context, url, error) => ClipRRect(
                //                   child: Image.asset(
                //                     'assets/images/error_image.jpeg',
                //                     fit: BoxFit.fill,
                //                   ),
                //                 ),
                //               )))
                //       : ClipRRect(
                //           borderRadius: BorderRadius.circular(8.r),
                //           child: AspectRatio(
                //             aspectRatio: 16 / 9,
                //             child: Image.asset(
                //               'assets/images/error_image.jpeg',
                //               fit: BoxFit.fill,
                //             ),
                //           ),
                //         ),
                //   title: Text(
                //     widget.data[index].name!,
                //     style: TextStyle(
                //         color: Helper.textColor600,
                //         letterSpacing: -0.3,
                //         fontSize: 14.sp,
                //         fontWeight: FontWeight.w600),
                //   ),
                //   subtitle: Text(
                //     // "Last Uploaded · " +
                //     widget.data[index].latestImage != null
                //         ? showDateTimeString(
                //             widget.data[index].latestImage!.datetime,
                //             'dd MMM yy · h:mma ')
                //         : "N/A",
                //     style: TextStyle(
                //       letterSpacing: -0.3,
                //       fontSize: 12.sp,
                //       fontWeight: FontWeight.w400,
                //       color: Helper.textColor600,
                //     ),
                //   ),
                // );
              },
            ),
          ],
        ),
      ),
    );
  }
}
