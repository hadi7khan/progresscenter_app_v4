import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_controller.dart';

class Date2Widget extends ConsumerStatefulWidget {
  final String startDate;
  final String endDate;
  final String selectedDate;
  final String cameraId;
  final String projectId;
  final WidgetRef ref;
  final ValueChanged<String> changeDate;
  Date2Widget(
      {super.key,
      required this.startDate,
      required this.endDate,
      required this.selectedDate,
      required this.cameraId,
      required this.projectId,
      required this.ref,
      required this.changeDate});

  @override
  ConsumerState<Date2Widget> createState() => _Date2WidgetState();
}

class _Date2WidgetState extends BaseConsumerState<Date2Widget> {
  String changeDate = "";
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
                'Split 2 Image Date',
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
              changeDate = DateFormat("yyyyMMdd").format(date);
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
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  widget.ref
                      .read(splitView2ControllerProvider.notifier)
                      .getImagesByCamId(widget.projectId, widget.cameraId,
                          searchDate: changeDate);
                });
                widget.changeDate(changeDate);
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
