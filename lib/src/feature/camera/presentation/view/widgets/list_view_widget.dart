import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera/presentation/provider/camera_controller.dart';

class ListViewWidget extends ConsumerStatefulWidget {
  final data;
  final projectName;
  final projectId;
  const ListViewWidget(
      {super.key, this.data, this.projectName, this.projectId});

  @override
  ConsumerState<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends BaseConsumerState<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      onTap: () {
        context.push('/cameradetails', extra: {
          "projectId": widget.data.project,
          "projectName": widget.projectName,
          "cameraId": widget.data.id,
          "cameraName": widget.data.name,
        });
      },
      child: RefreshIndicator(
        color: ref.watch(primaryColorProvider),
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          return await ref
              .refresh(cameraControllerProvider.notifier)
              .getCameras(widget.projectId);
        },
        child: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          height: 264.h,
          decoration: BoxDecoration(
            color: Helper.widgetBackground,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(fit: StackFit.loose, children: [
            widget.data.latestImage != null
                ? ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r)),
                    child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(
                          imageUrl: widget.data.latestImage!.urlThumb,
                          fit: BoxFit.fill,
                          errorWidget: (context, url, error) => ClipRRect(
                            child: Image.asset(
                              'assets/images/error_image.jpeg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        )))
                : ClipRRect(
                    borderRadius: BorderRadius.circular(16.r),
                    child: Image.asset(
                      'assets/images/error_image.jpeg',
                      fit: BoxFit.fill,
                      height: 264.h,
                    ),
                  ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 88.h,
                    width: double.infinity,
                    margin: EdgeInsets.zero,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
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
                            Row(
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
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Text(
                                    widget.data.name!,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      letterSpacing: -0.3,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Helper.baseBlack,
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                      ],
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

showDateTimeString(datetime, dateFormat) {
  String dateWithT = datetime!.substring(0, 8) + 'T' + datetime!.substring(8);
  DateTime dateTime = DateTime.parse(dateWithT);
  final String formattedTime = DateFormat(dateFormat).format(dateTime);

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

  bool isactiveeee = difference.inHours < 24;

  return difference.inHours < 24;
}

showDate(date, dateFormat) {
  DateTime dateTime = DateFormat("yyyyMMddHHmmss").parse(date);

  String formattedDate = DateFormat("hh:mm a · dd MMM, yyyy").format(dateTime);
  return formattedDate;
}
