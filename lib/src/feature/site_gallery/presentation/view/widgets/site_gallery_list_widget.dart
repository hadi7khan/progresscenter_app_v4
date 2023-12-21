import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SiteGalleryListViewWidget extends StatefulWidget {
  final data;
  const SiteGalleryListViewWidget({super.key, this.data});

  @override
  State<SiteGalleryListViewWidget> createState() =>
      _SiteGalleryListViewWidgetState();
}

class _SiteGalleryListViewWidgetState extends State<SiteGalleryListViewWidget> {
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
      child:
          Stack(fit: StackFit.loose, alignment: Alignment.topCenter, children: [
        widget.data.type == "IMAGE"
            ? ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                child: Stack(alignment: Alignment.center, children: [
                  widget.data.type == "IMAGE"
                      ? Image.network(
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
                        )
                      : SizedBox(),
                ]))
            : ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  'assets/images/error_image.jpeg',
                  fit: BoxFit.cover,
                  height: 284.h,
                ),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                           width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            widget.data.name!,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                    letterSpacing: -0.3,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Helper.baseBlack,
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 6.h,
                        // ),
                        Text(
                          showDate(widget.data.createdAt!.toIso8601String(),
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
                    TextButton(
                        onPressed: () {
                          // context.push('/details', extra: {"projectId": "projectId", "projectName": data[index].name!});
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
