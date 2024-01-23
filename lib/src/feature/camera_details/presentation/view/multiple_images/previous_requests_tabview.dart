import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_app_bar.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_livelapse_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/multi_images_controller.dart';

class PreviousRequestsTabview extends ConsumerStatefulWidget {
  final String projectId;
  final String cameraName;
  final String cameraId;
  const PreviousRequestsTabview(
      {super.key,
      required this.projectId,
      required this.cameraName,
      required this.cameraId});

  @override
  ConsumerState<PreviousRequestsTabview> createState() =>
      _PreviousRequestsTabviewState();
}

class _PreviousRequestsTabviewState
    extends BaseConsumerState<PreviousRequestsTabview> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(multiImageControllerProvider.notifier)
          .getMultiImages(widget.projectId, widget.cameraId);
    });
  }

  getDate(date, dateFormat) {
    if (date == null) {
      return "";
    }
    print("datetime format" + date.toString());
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat(dateFormat).format(parsedDate);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final multiImageData = ref.watch(
        multiImageControllerProvider.select((value) => value.multiImages));
    return multiImageData.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 24.h),
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 8.h),
                              decoration: BoxDecoration(
                                color: data[index].status == "EXPIRED"
                                    ? Helper.errorColor.withOpacity(0.1)
                                    : Helper.successColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                data[index].status!,
                                maxLines: 1,
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: data[index].status == "EXPIRED"
                                        ? Helper.errorColor
                                        : Helper.successColor),
                              ),
                            ),
                            data[index].status == "COMPLETED"
                                ? Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 14.w, vertical: 8.h),
                                    decoration: BoxDecoration(
                                      color: ref
                                          .watch(primaryColorProvider)
                                          .withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8.r),
                                    ),
                                    child: Text(
                                      "DOWNLOAD",
                                      maxLines: 1,
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color:
                                              ref.watch(primaryColorProvider)),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "By " + data[index].requestedBy!.name!,
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.baseBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Time period",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          getDate(data[index].startDate, "dd MMM yyyy") +
                              " - " +
                              getDate(data[index].endDate, "dd MMM yyyy"),
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.baseBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Requested on",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          getDate(data[index].endDate, "hh:mm a . dd MMM yyyy"),
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.baseBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                }),
                itemCount: data.length),
          );
        },
        error: (err, _) {
          return const Text("Failed to fetch livelapse",
              style: TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
        },
        loading: () => SizedBox());
  }
}
