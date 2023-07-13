import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/drone_footage_controller.dart';

class DroneFootageScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const DroneFootageScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<DroneFootageScreen> createState() => _DroneFootageScreenState();
}

class _DroneFootageScreenState extends BaseConsumerState<DroneFootageScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(droneFootageControllerProvider.notifier)
          .getDroneFootage(widget.projectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final droneFootageData = ref.watch(
        droneFootageControllerProvider.select((value) => value.droneFootages));
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: droneFootageData.when(
          data: (data) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(children: [
                        Container(
                          height: 24.h,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            alignment: Alignment.centerLeft,
                            icon: Icon(
                              Icons.arrow_back,
                            ),
                            onPressed: () => context.pop(),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          widget.projectName,
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        )
                      ]),
                      // ListTile(
                      //   dense: true,
                      //   leading: Container(
                      //       height: 24.h,
                      //       child: IconButton(
                      //         padding: EdgeInsets.zero,
                      //         alignment: Alignment.centerLeft,
                      //         icon:
                      //             SvgPicture.asset('assets/images/sort.svg'),
                      //         onPressed: () => context.pop(),
                      //       ),
                      //     ),
                      //     title:Container(
                      //       height: 24.h,
                      //       child: IconButton(
                      //         padding: EdgeInsets.zero,
                      //         alignment: Alignment.centerLeft,
                      //         icon:
                      //             SvgPicture.asset('assets/images/sort.svg'),
                      //         onPressed: () => context.pop(),
                      //       ),
                      //     ),
                      // ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.zero,
                            height: 24.h,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                              icon: SvgPicture.asset('assets/images/sort.svg'),
                              onPressed: () => context.pop(),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.zero,
                            height: 24.h,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              alignment: Alignment.centerLeft,
                              icon: SvgPicture.asset('assets/images/plus.svg'),
                              onPressed: () => context.pop(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  ListView.separated(
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.h);
                    },
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      return Container(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        height: 264.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Stack(
                            fit: StackFit.loose,
                            alignment: Alignment.topCenter,
                            children: [
                              data[index].coverImageUrl != null
                                  ? ClipRRect(
                                      borderRadius:
                                              BorderRadius.only(topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
                                      child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            AspectRatio(
                                              aspectRatio: 16/9,
                                              child: Image.network(
                                                data[index].coverImageUrl!,
                                                
                                                fit: BoxFit.fill,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return ClipRRect(
                                                    child: Image.asset(
                                                      'assets/images/error_image.jpeg',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Positioned(
                                                top: 83,
                                                child: Icon(
                                                    Icons
                                                        .play_circle_outline_outlined,
                                                    color: Colors.white,
                                                    size: 44))
                                          ]))
                                  : ClipRRect(
                                      borderRadius:
                                          BorderRadius.circular(16.r),
                                      child: Image.asset(
                                        'assets/images/error_image.jpeg',
                                        fit: BoxFit.fill,
                                        height: 264.h,
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
                                          borderRadius:
                                              BorderRadius.circular(15.r),
                                          color: Color.fromRGBO(
                                              246, 246, 246, 1)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data[index].name!,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight:
                                                      FontWeight.w500,
                                                  color: Helper.baseBlack,
                                                ),
                                              ),
                                              // SizedBox(
                                              //   height: 6.h,
                                              // ),
                                              Text(
                                                showDate(
                                                    data[index].takenAtDate,
                                                    'dd MMM yyyy'),
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight:
                                                      FontWeight.w400,
                                                  color: Helper.baseBlack
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                            ],
                                          ),
                                          TextButton(
                                              onPressed: () {
                                                // context.push('/details', extra: {"projectId": "projectId", "projectName": data[index].name!});
                                              },
                                              style: ButtonStyle(
                                                  shape: MaterialStateProperty
                                                      .all(
                                                          RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius
                                                            .circular(8.r),
                                                  )),
                                                  backgroundColor:
                                                      MaterialStateProperty
                                                          .all(Colors
                                                              .white)),
                                              child: Text(
                                                "View",
                                                style: TextStyle(
                                                    color: Helper.baseBlack,
                                                    fontSize: 14.sp,
                                                    letterSpacing: 0.2,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))
                                        ],
                                      )),
                                ),
                              ),
                            ]),
                      );
                    }),
                  )
                ]);
          },
          error: (err, _) {
            return const Text("Failed to load Drone Footages",
                style: TextStyle(color: Helper.errorColor));
          },
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        ),
      )),
    ));
  }
}

showDate(date, dateFormat) {
  // Parse the installationDate string into a DateTime object
  DateTime parsedDate = DateTime.parse(date);

  // Format the DateTime object into the desired format
  String formattedDate = DateFormat(dateFormat).format(parsedDate);
  return formattedDate;
}
