import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ChatMessageWidget extends StatelessWidget {
  final String message;
  final String userType;
  final String userName;
  final String dpUrl;
  final DateTime createdAt;

  ChatMessageWidget({
    required this.message,
    required this.userType,
    required this.userName,
    required this.dpUrl,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    showDateTimeString(String date, dateFormat) {
      // DateTime timestamp = DateTime.parse(date).toLocal();
      // print("date: "  +timestamp.toString());
      // Format the DateTime object into the desired format
      String formattedDate =
          DateFormat(dateFormat).format(DateTime.parse(date));
      print("date: " + formattedDate.toString());
      return formattedDate;
    }

    return Align(
      alignment:
          userType == 'User' ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: userType == 'User' ? Helper.primary : Helper.widgetBackground,
          borderRadius: BorderRadius.only(
            topLeft:
                userType == 'User' ? Radius.circular(8.r) : Radius.circular(0),
            topRight:
                userType == 'User' ? Radius.circular(0) : Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
            bottomRight: Radius.circular(8.r),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                userType == 'ConsoleUser'
                    ? AvatarWidget(
                        dpUrl: dpUrl != null ? dpUrl : "",
                        name: userName,
                        backgroundColor: "",
                        size: 24,
                      )
                    : SizedBox(),
                userType == 'ConsoleUser' ? SizedBox(width: 8.w) : SizedBox(),
                Text(
                  userName,
                  style: TextStyle(
                    letterSpacing: -0.3,
                      color: userType == 'ConsoleUser'
                      ? Helper.textColor700
                      : Colors.white,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              message,
              style: TextStyle(
                    letterSpacing: -0.3,
                  color: userType == 'ConsoleUser'
                      ? Helper.textColor900
                      : Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 4.0),
            Text(
              showDateTimeString(createdAt.toIso8601String(), 'hh:mm a'),
              style: TextStyle(
                    letterSpacing: -0.3,
                  color: Helper.baseBlack,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
