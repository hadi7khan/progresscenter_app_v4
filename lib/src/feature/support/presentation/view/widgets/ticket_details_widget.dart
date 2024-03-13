import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_by_id_model.dart';

class TicketDetailsWidget extends StatefulWidget {
  final TicketByIdModel ticketData;
  const TicketDetailsWidget({super.key, required this.ticketData});

  @override
  State<TicketDetailsWidget> createState() => _TicketDetailsWidgetState();
}

class _TicketDetailsWidgetState extends State<TicketDetailsWidget> {
  showDateTimeString(date, dateFormat) {
    String formattedDate = DateFormat(dateFormat).format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        color: Colors.white,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          widget.ticketData.topic,
          style: TextStyle(
              letterSpacing: -0.3,
              color: Helper.baseBlack,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 12.h),
        Text(
          widget.ticketData.subject,
          style: TextStyle(
              letterSpacing: -0.3,
              color: Helper.baseBlack,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500),
        ),
        Text(
          widget.ticketData.detail,
          style: TextStyle(
              letterSpacing: -0.3,
              color: Helper.baseBlack.withOpacity(0.5),
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
        ListTile(
          horizontalTitleGap: 8.w,
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            'assets/images/user-circle.svg',
          ),
          title: Text(
            widget.ticketData.user.name,
            style: TextStyle(
                letterSpacing: -0.3,
                color: Helper.baseBlack.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
        ListTile(
          horizontalTitleGap: 8.w,
          dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            'assets/images/calendar-check-ticket.svg',
          ),
          title: Text(
            showDateTimeString(
                widget.ticketData.updatedAt, 'dd MMM, yy · hh:mm a'),
            style: TextStyle(
                letterSpacing: -0.3,
                color: Helper.baseBlack.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
        ),
      ]),
    );
  }
}
