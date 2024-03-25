import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/reports/presentation/provider/schedule_reports_controller.dart';
import 'dart:developer' as dev;

import 'package:progresscenter_app_v4/src/feature/reports/presentation/provider/scheduled_report_controller.dart';
import 'package:progresscenter_app_v4/src/feature/reports/presentation/view/generate_report/instant_report_tabview.dart';

class ScheduledReportTabview extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraId;
  final String endDate;
  final String startDate;
  const ScheduledReportTabview(
      {super.key,
      required this.projectId,
      required this.cameraId,
      required this.endDate,
      required this.startDate});

  @override
  ConsumerState<ScheduledReportTabview> createState() =>
      _ScheduledReportTabviewState();
}

class _ScheduledReportTabviewState
    extends BaseConsumerState<ScheduledReportTabview> {
  bool _isLoading = false;
  String _showDuration = "Select";
  String _duration = "Select";
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  Map<String, dynamic>? user;
  int maxImageDays = 0;
  List<Map<String, dynamic>> periods = [
    {
      "label": 'Weekly',
      "value": 'WEEKLY',
    },
    {
      "label": 'Monthly',
      "value": 'MONTHLY',
    },
    {
      "label": 'Quarterly',
      "value": 'QUARTERLY',
    },
    {
      "label": 'Biannually',
      "value": 'BIANNUALLY',
    },
    {
      "label": 'Annually',
      "value": 'ANNUALLY',
    },
  ];
  int getReportIntervalDays(CameraReportIntervalType intervalType) {
    final Map<CameraReportIntervalType, int> periods = {
      CameraReportIntervalType.WEEKLY: 7,
      CameraReportIntervalType.MONTHLY: 30,
      CameraReportIntervalType.QUARTERLY: 90,
      CameraReportIntervalType.BIANNUALLY: 180,
      CameraReportIntervalType.ANNUALLY: 365,
    };

    return periods[intervalType]!;
  }

  @override
  void initState() {
    super.initState();
    fetchUser();
    getDateDifference(widget.startDate, widget.endDate);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(scheduledReportProvider.notifier).getScheduledReport(
            widget.projectId,
            widget.cameraId,
          );
    });
  }

  getDateDifference(String sDate, String eDate) {
    DateTime startDate = DateTime.parse(sDate);
    DateTime endDate = DateTime.parse(eDate);

    Duration difference = endDate.difference(startDate);
    maxImageDays = difference.inDays;

    // Print the difference in days
    dev.log('Difference in days: ${maxImageDays} days');
  }

  fetchUser() {
    user = _prefsLocator.getUser();
  }

  @override
  Widget build(BuildContext context) {
    final scheduledReportData = ref.watch(
        scheduledReportProvider.select((value) => value.scheduledReport));
    return SingleChildScrollView(
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.h),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: Colors.white,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Use the scheduled report to generate a PDF report",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8.h),
                      RichText(
                        text: TextSpan(
                          text:
                              "Report will be generated and sent to the following mail : ",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor400,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                              text: "${user!['email']}",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor900,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "Report type",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 8.h),
                      InkWell(
                        onTap: () {
                          _showTypeBottomSheet(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: Helper.textColor300),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: ListTile(
                            title: Text(
                              _showDuration,
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor500,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                            trailing: SvgPicture.asset(
                              'assets/images/chevron-down.svg',
                              color: Helper.textColor500,
                              width: 24,
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(height: 24.h),
              scheduledReportData.when(
                  data: (data) {
                    dev.log("data" + data.toString());
                    return data.id != null
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 24.h),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: Colors.white,
                            ),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      text: "Currently running : ",
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.textColor400,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: data.type,
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              color: Helper.baseBlack,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Service()
                                          .deleteScheduledReport(
                                              widget.projectId, widget.cameraId)
                                          .then((value) {
                                        ref
                                            .watch(scheduledReportProvider
                                                .notifier)
                                            .getScheduledReport(
                                                widget.projectId,
                                                widget.cameraId);
                                        Utils.toastSuccessMessage(
                                            "Report removed successfully",
                                            context);
                                      });
                                    },
                                    child: Text(
                                      "Stop",
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.errorColor,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ]),
                          )
                        : SizedBox();
                  },
                  error: (err, _) {
                    return const Text("Failed to fetch images data",
                        style: TextStyle(
                            letterSpacing: -0.3, color: Helper.errorColor));
                  },
                  loading: () => SizedBox()),
              SizedBox(height: 59.h),
              Container(
                height: 52.h,
                width: double.infinity,
                child: ElevatedButton(
                  child: _isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "Schedule",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                          // currentIndex == contents.length - 1 ? "Continue" : "Next"
                        ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          ref.watch(primaryColorProvider)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      )),
                  onPressed: () async {
                    setState(() {
                      _isLoading = true;
                    });
                    Map<String, dynamic> data = {"type": _duration};
                    await ref
                        .watch(scheduleReportsProvider.notifier)
                        .scheduleReport(widget.projectId, widget.cameraId, data)
                        .then((value) async {
                      value.fold((failure) {}, (res) {
                        ref
                            .watch(scheduledReportProvider.notifier)
                            .getScheduledReport(
                                widget.projectId, widget.cameraId);
                        Utils.toastSuccessMessage(
                            "Report scheduled successfully", context);
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    });
                  },
                ),
              ),
            ],
          )),
    );
  }

  _showTypeBottomSheet(context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Select Duration',
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                    itemCount: periods.length,
                    shrinkWrap: true,
                    itemBuilder: ((context, index) {
                      final int intervalDays = getReportIntervalDays(
                        CameraReportIntervalType.values[index],
                      );
                      final bool isItemEnabled = maxImageDays >= intervalDays;

                      return InkWell(
                        onTap: isItemEnabled
                            ? () async {
                                setState(() {
                                  _duration = periods[index]["value"];
                                  _showDuration = periods[index]["label"];
                                });
                                context.pop();
                              }
                            : null,
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 16.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white,
                          ),
                          child: Text(
                            periods[index]["label"],
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: isItemEnabled
                                    ? Helper.baseBlack
                                    : Colors.grey,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      );
                    })),
                SizedBox(height: 20.h),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.baseBlack),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )),
                    onPressed: () {
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
