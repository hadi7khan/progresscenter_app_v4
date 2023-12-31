import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/data/models/notifications_model.dart'
    as model;

class NotificationWidget extends StatefulWidget {
  final model.Notification? notificationsData;
  const NotificationWidget({super.key, this.notificationsData});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AvatarWidget(
                dpUrl: widget.notificationsData!.createdBy!.dp != null
                    ? widget.notificationsData!.createdBy!.dpUrl!
                    : "",
                name: widget.notificationsData!.createdBy!.name!,
                backgroundColor:
                    widget.notificationsData!.createdBy!.preset!.color!,
                size: 32,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.notificationsData!.message!,
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Replied to your comment in Uncool Project  ",
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor600,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.circle,
                color: Helper.successColor,
                size: 8,
              )
            ],
          ),
          Divider(
            thickness: 1,
            color: Helper.baseBlack.withOpacity(0.06),
          )

          // ListTile(
          //   dense: true,
          //   contentPadding: EdgeInsets.zero,
          //   horizontalTitleGap: 8.w,
          //   leading: AvatarWidget(
          //     dpUrl:
          //         "https://www.kasandbox.org/programming-images/avatars/spunky-sam.png",
          //     name: "hadi",
          //     backgroundColor: "",
          //     size: 24,
          //   ),
          //   title: Text(
          //     "Yafer Nazir",
          //     style: TextStyle(
          //         letterSpacing: -0.3,
          //         color: Helper.textColor700,
          //         fontSize: 14.sp,
          //         fontWeight: FontWeight.w500),
          //   ),
          //   trailing: Text(
          //     "Replied to your comment in Uncool Project - CCTV Camera ",
          //     style: TextStyle(
          //         letterSpacing: -0.3,
          //         color: Helper.textColor600,
          //         fontSize: 14.sp,
          //         fontWeight: FontWeight.w400),
          //   ),
          // ),
        ],
      ),
    );
  }
}
