import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_livelapse_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/provider/livelapse_controller.dart';

class LivelapseScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  const LivelapseScreen(
      {super.key,
      required this.cameraId,
      required this.projectId,
      required this.projectName});

  @override
  ConsumerState<LivelapseScreen> createState() => _LivelapseScreenState();
}

class _LivelapseScreenState extends BaseConsumerState<LivelapseScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(livelapseControllerProvider.notifier).getLivelapse(
            widget.projectId,
            widget.cameraId,
          );
    });
  }

  getDay(date) {
    if (date == null) {
      return "";
    }
    print("datetime format" + date.toString());
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat("dd").format(parsedDate);

    return formattedDate;
  }

  getDate(date) {
    if (date == null) {
      return "";
    }
    print("datetime format" + date.toString());
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat("dd MMM, y").format(parsedDate);

    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final livelapseData = ref
        .watch(livelapseControllerProvider.select((value) => value.livelapse));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            titleSpacing: 12.0.w,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: Transform.rotate(
                angle: 180 * (3.1415926535 / 180),
                child: SvgPicture.asset('assets/images/chevron-right.svg',
                    color: Helper.iconColor, fit: BoxFit.contain),
              ),
            ),
            leadingWidth: 24,
            title: Text(
              "Livelapse",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            actions: [
              SizedBox(width: 12.w),
              InkWell(
                  onTap: () {
                    context.push('/createlivelapse', extra: {
                      "projectId": widget.projectId,
                      "projectName": widget.projectName,
                      "cameraId": widget.cameraId
                    });
                  },
                  child: SvgPicture.asset('assets/images/plus.svg')),
            ],
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          color: Helper.primary,
          onRefresh: () async {
            HapticFeedback.mediumImpact();
            return await ref
                .refresh(livelapseControllerProvider.notifier)
                .getLivelapse(widget.projectId, widget.cameraId);
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: livelapseData.when(
                  data: (data) {
                    if (data.isEmpty) {
                      return Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.88.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset('assets/images/illustration.svg'),
                            SizedBox(height: 16.h),
                            Text(
                              "No Livelapse created",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor900,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      );
                    }
                    ;
                    return Column(children: [
                      ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemCount: data.length,
                          shrinkWrap: true,
                          separatorBuilder: (context, index) {
                            return SizedBox(height: 20.h);
                          },
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                if (data[index].status == "COMPLETED") {
                                  context.push("/fullViewlivelapse", extra: {
                                    "projectId": widget.projectId,
                                    "projectName": widget.projectName,
                                    "cameraId": widget.cameraId,
                                    "url": data[index].url!,
                                    "name": data[index].name!
                                  });
                                }
                              },
                              child: Container(
                                margin: EdgeInsets.zero,
                                padding: EdgeInsets.zero,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: data[index].coverImageUrl != null
                                          ? ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                              child: Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    AspectRatio(
                                                      aspectRatio: 16 / 9,
                                                      child: Image.network(
                                                        data[index]
                                                            .coverImageUrl!,
                                                        fit: BoxFit.fill,
                                                        gaplessPlayback: true,
                                                        errorBuilder:
                                                            (BuildContext
                                                                    context,
                                                                Object
                                                                    exception,
                                                                StackTrace?
                                                                    stackTrace) {
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
                                                        top: 26,
                                                        child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 7.w,
                                                                  top: 5.45.h,
                                                                  bottom:
                                                                      5.45.h,
                                                                  right: 5.w),
                                                          height: 24.h,
                                                          width: 24.w,
                                                          decoration: BoxDecoration(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.3),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.r)),
                                                          child:
                                                              SvgPicture.asset(
                                                            // height: 13,
                                                            // width: 13,
                                                            'assets/images/icon_after.svg',
                                                          ),
                                                        ))
                                                  ]))
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: AspectRatio(
                                                aspectRatio: 16 / 9,
                                                child: Image.asset(
                                                  'assets/images/error_image.jpeg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                    ),
                                    Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(data[index].name!,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      color: Helper.baseBlack,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              Text(
                                                  data[index]
                                                          .duration!
                                                          .toString() +
                                                      " days ·" +
                                                      getDay(data[index]
                                                          .startDate) +
                                                      "-" +
                                                      getDate(
                                                          data[index].endDate),
                                                  style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      color: Helper.baseBlack
                                                          .withOpacity(0.5),
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              SizedBox(
                                                height: 12.h,
                                              ),
                                              Text(data[index].status!,
                                                  style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      color: data[index]
                                                                  .status! !=
                                                              "EXPIRED"
                                                          ? Helper.textColor400
                                                          : Helper.errorColor,
                                                      fontSize: 8.sp,
                                                      fontWeight:
                                                          FontWeight.w600))
                                            ],
                                          ),
                                        ))
                                  ],
                                ),
                              ),
                            );
                          })
                    ]);
                  },
                  error: (err, _) {
                    return const Text("Failed to fetch livelapse",
                        style: TextStyle(
                            letterSpacing: -0.3, color: Helper.errorColor));
                  },
                  loading: () => LoadingLivelapseList()),
            ),
          ),
        ),
      ),
    );
  }
}
