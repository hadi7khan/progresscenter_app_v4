import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class GridViewWidget extends StatefulWidget {
  final data;
  final projectName;
  const GridViewWidget({super.key, this.data, this.projectName});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
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
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Stack(fit: StackFit.loose, children: [
          widget.data.latestImage != null
              ? ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: Image.network(
                      widget.data.latestImage!.urlThumb,
                      gaplessPlayback: true,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return ClipRRect(
                          child: Image.asset(
                            'assets/images/error_image.jpeg',
                            fit: BoxFit.fill,
                          ),
                        );
                      },
                    ),
                  ))
              : ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  child: Image.asset(
                    'assets/images/error_image.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Color.fromRGBO(246, 246, 246, 1)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.data.name!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          letterSpacing: -0.3,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Helper.baseBlack,
                        ),
                      ),
                      Row(
                        children: [
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
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}

showDateTimeString(datetime, dateFormat) {
  String dateWithT = datetime!.substring(0, 8) + 'T' + datetime!.substring(8);
  DateTime dateTime = DateTime.parse(dateWithT);

  final String formattedTime =
      DateFormat('dd MMM yy · h:mma ').format(dateTime);
  return formattedTime;
}

showDate(date, dateFormat) {
  DateTime parsedDate = DateTime.parse(date);

  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
