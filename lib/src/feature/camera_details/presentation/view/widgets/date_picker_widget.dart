import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class DatePickerWidget extends ConsumerStatefulWidget {
  final String startDate;
  final String endDate;
  final String showMonthText;
  final DatePickerCallback onChange;
  const DatePickerWidget(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.showMonthText,
      required this.onChange});

  @override
  ConsumerState<DatePickerWidget> createState() => _DatePickerWidgetState();
}

typedef void DatePickerCallback(String dateSelected, DateTime currentMonth);

class _DatePickerWidgetState extends BaseConsumerState<DatePickerWidget> {
  String _selectedDate = '';
  DateTime currentMonth = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Select Date',
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          CalendarDatePicker2(
            config: CalendarDatePicker2Config(
              lastDate: DateTime.parse(widget.endDate),
              firstDate: DateTime.parse(widget.startDate),
              selectedDayHighlightColor: ref.watch(primaryColorProvider),
            ),
            value: [],
            onValueChanged: (value) {
              DateTime date = DateTime.parse(value[0].toString());
              _selectedDate = DateFormat("yyyyMMdd").format(date);

              currentMonth = value[0]!;
            },
          ),
          Container(
            height: 52.h,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10.h),
            child: ElevatedButton(
              child: Text(
                "Done",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                // currentIndex == contents.length - 1 ? "Continue" : "Next"
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(ref.watch(primaryColorProvider)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  )),
              onPressed: () {
                widget.onChange(_selectedDate, currentMonth);
              },
            ),
          ),
        ],
      ),
    );
  }
}
