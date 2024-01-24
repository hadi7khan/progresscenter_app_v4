import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'dart:developer';

import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class DateSliderWidget extends ConsumerStatefulWidget {
  final List<DateTime>? daysInMonth;
  final String? selectedDate;
  final Function onChange;
  const DateSliderWidget(
      {super.key, this.daysInMonth, this.selectedDate, required this.onChange});

  @override
  ConsumerState<DateSliderWidget> createState() => _DateSliderWidgetState();
}

class _DateSliderWidgetState extends BaseConsumerState<DateSliderWidget> {
  ScrollController _dateController = ScrollController();
  final dataKey = new GlobalKey();

  @override
  void initState() {
    super.initState();
    // Find the index of the selected date and scroll to that index
    if (widget.selectedDate != null) {
      int selectedIndex = widget.daysInMonth!.indexWhere(
          (date) => DateFormat('yyyyMMdd').format(date) == widget.selectedDate);
      if (selectedIndex != -1) {
        // Scroll to the selected index with some smoothness
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Timer(Duration(seconds: 1), () {
            _dateController.animateTo(
              selectedIndex * 40, // Set your item width here
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          });
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      controller: _dateController,
      itemCount: widget.daysInMonth!.length,
      itemBuilder: (context, index) {
        final day = widget.daysInMonth![index];
        final formattedDay = DateFormat.EEEE().format(day);
        final formattedDate = DateFormat.d().format(day);
        final compareDate = DateFormat('yyyyMMdd').format(day);
        log("current Image date" + widget.selectedDate.toString());
        log("formatted day to compare" + compareDate.toString());

        return InkWell(
          onTap: () {
            widget.onChange(DateFormat("yyyyMMdd").format(day));
          },
          child: Container(
            margin: EdgeInsets.zero,
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              border: Border.all(
                color: widget.selectedDate ==
                        DateFormat('yyyyMMdd')
                            .format(widget.daysInMonth![index])
                    ? Helper.baseBlack.withOpacity(0.06)
                    : Colors.transparent,
                width: 1, // Set the border width
              ),
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Stack(children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                child: Column(
                  children: [
                    Text(
                      formattedDate,
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      formattedDay.substring(0, 3).toUpperCase(),
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              widget.selectedDate ==
                      DateFormat('yyyyMMdd').format(widget.daysInMonth![index])
                  ? Positioned.fill(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 4.h,
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: ref.watch(primaryColorProvider),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4.r),
                                bottomRight: Radius.circular(4.r)),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
            ]),
          ),
        );
      },
    );
  }
}
