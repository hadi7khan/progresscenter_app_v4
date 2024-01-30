import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/presentation/view/widgets/cctv_widget.dart';

class CctvGridViewWidget extends StatefulWidget {
  final data;
  const CctvGridViewWidget({super.key, this.data});

  @override
  State<CctvGridViewWidget> createState() => _CctvGridViewWidgetState();
}

class _CctvGridViewWidgetState extends State<CctvGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/fullViewCCTV', extra: {
          "projectId": widget.data.project,
          "name": widget.data.name,
          "streamingUrl": widget.data.streamingUrl,
          // "type": widget.data.type
        });
      },
      child: Container(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        // height: 264.h,
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
                        fit: BoxFit.cover,
                        height: 284.h,
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
                            style: TextStyle(
                              letterSpacing: -0.3,
                              fontSize: 14.sp,
                              overflow: TextOverflow.ellipsis,
                              fontWeight: FontWeight.w500,
                              color: Helper.baseBlack,
                            ),
                          ),
                          Text(
                            "Installed · " +
                                showDate(widget.data.installationDate,
                                    'dd MMM yyyy'),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Helper.baseBlack.withOpacity(0.5),
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
  // Parse the installationDate string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
