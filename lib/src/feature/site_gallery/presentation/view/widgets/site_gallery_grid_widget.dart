import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SiteGalleryGridViewWidget extends StatefulWidget {
  final data;
  const SiteGalleryGridViewWidget({super.key, this.data});

  @override
  State<SiteGalleryGridViewWidget> createState() => _SiteGalleryGridViewWidgetState();
}

class _SiteGalleryGridViewWidgetState extends State<SiteGalleryGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      // height: 264.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child:
          Stack(fit: StackFit.loose, children: [
        widget.data.type == "IMAGE"
            ? ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Stack(alignment: Alignment.center, children: [
                   AspectRatio(
                        aspectRatio: 3 / 2,
                        child: Image.network(
                            widget.data.url!,
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
                ]))
            : ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Image.asset(
                  'assets/images/error_image.jpeg',
                  fit: BoxFit.cover,
                  // height: 264.h,
                ),
              ),
        Positioned.fill(
          // bottom: 20,
          // left: 20,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                // height: 88.h,
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
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Helper.baseBlack,
                      ),
                    ),
                    // SizedBox(
                    //   height: 6.h,
                    // ),
                    Text(
                      showDate(widget.data.createdAt!.toIso8601String(),
                          'dd MMM yyyy'),
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