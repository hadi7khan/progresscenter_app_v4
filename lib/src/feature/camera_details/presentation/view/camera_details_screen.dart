import 'dart:async';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_app_bar.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_cam_details.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera/presentation/provider/camera_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/camera_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_by_cam_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_controller_watcher.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/landscape_camera_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/bottom_nav_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/camera_bottomsheet_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/cameras_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/carousel_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/date_picker_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/date_slider_widget.dart';
import 'dart:developer';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart'
    as model;

import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/image_slider_widget.dart';

class CameraDetailsSreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  final String cameraName;
  const CameraDetailsSreen({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.cameraId,
    required this.cameraName,
  });

  @override
  ConsumerState<CameraDetailsSreen> createState() => _CameraDetailsSreenState();
}

class _CameraDetailsSreenState extends BaseConsumerState<CameraDetailsSreen>
    with SingleTickerProviderStateMixin {
  List<DateTime> daysInMonth = [];
  final String _searchDate = '';
  String showMonth = "JAN";
  bool showBottomBar = true;
  ScrollController _scrollController = ScrollController();
  bool hasImages = false;
  String showDateSelected = '';

  @override
  void initState() {
    super.initState();
    log("cameraIdddd:" + widget.cameraId.toString());

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cameraByIdControllerProvider.notifier).getCameraById(
            widget.projectId,
            widget.cameraId,
          );
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Timer(Duration(seconds: 2), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(imagesByCamIdControllerProvider.notifier)
          .getImagesByCamId(widget.projectId, widget.cameraId,
              searchDate: _searchDate)
          .then((value) {
        getDaysInMonth(value.endDate, true);
        log("imageslengthh:" + value.images.length.toString());
        showDate(value.endDate);
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cameraControllerProvider.notifier).getCameras(widget.projectId);
    });
  }

  List<DateTime> getDaysInMonth(currentMonth, bool isString) {
    daysInMonth = [];
    if (isString) {
      final month = DateTime.parse(currentMonth);
      final firstDayOfMonth = DateTime(month.year, month.month, 1);
      final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

      for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
        daysInMonth.add(DateTime(month.year, month.month, i));
      }

      return daysInMonth;
    }
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0);
    for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
    }

    return daysInMonth;
  }

  showDate(String date) {
    DateTime parsedDate = DateTime.parse(date);
    String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
    showMonth = DateFormat.MMM().format(parsedDate).toUpperCase();

    return formattedDate;
  }

  parseEndDateTimeString(String datetime, bool showMonthOnly) {
    String dateWithT = datetime.substring(0, 8) + 'T' + datetime.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    String formattedTime;
    if (showMonthOnly) {
      formattedTime = DateFormat('MMM').format(dateTime);
      return formattedTime;
    }
    formattedTime = DateFormat('dd MMM yyyy h:mm a').format(dateTime);
    return formattedTime;
  }

  parseDateTimeString(String time) {
    String dateWithT = time.substring(0, 8) + 'T' + time.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    final String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
  }

  @override
  void dispose() {
    super.dispose();
    // ref.invalidate(imagesByCamIdControllerProvider);
  }

  @override
  Widget build(BuildContext context) {
    final camerasListData =
        ref.watch(cameraControllerProvider.select((value) => value.cameras));
    final cameraByIdData = ref.watch(
        cameraByIdControllerProvider.select((value) => value.cameraById));
    final imagesByCameraIdData = ref.watch(
        imagesByCamIdControllerProvider.select((value) => value.imagesByCamId));

    final imagesByCameraIdInter = ref.watch(imagesByCameraIdInterProvider);
    final currentImage = ref.watch(currentImageProvider);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: cameraByIdData.when(
              data: (cameraData) {
                hasImages = cameraData.hasImages!;
                return AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  titleSpacing: 0.0,
                  leading: InkWell(
                    highlightColor: Colors.transparent,
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
                  title: camerasListData.when(
                    data: (data) {
                      return InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          showModalBottomSheet(
                              useRootNavigator: true,
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Padding(
                                    padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context)
                                                .viewInsets
                                                .bottom) *
                                        0.6,
                                    child: CamerasWidget(
                                      data: data,
                                      projectId: widget.projectId,
                                      projectName: widget.projectName,
                                    ),
                                  ));
                        },
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  cameraData.name!,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Helper.baseBlack,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  widget.projectName,
                                  style: TextStyle(
                                      color: Helper.baseBlack.withOpacity(0.5),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ]),
                        ),
                      );
                    },
                    error: (err, _) {
                      return const Text("Error",
                          style: TextStyle(color: Helper.errorColor));
                    },
                    loading: () => LoadingAppBar(),
                  ),
                  actions: [
                    InkWell(
                        highlightColor: Colors.transparent,
                        onTap: () {
                          showModalBottomSheet(
                              useRootNavigator: true,
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => CameraBottomSheet(
                                  cameraName: cameraData.name!,
                                  projectId: widget.projectId,
                                  cameraId: widget.cameraId,
                                  startDate: cameraData.installationDate!,
                                  endDate: cameraData.endDate!,
                                  imageName: currentImage!.name!,
                                  imageUrl: currentImage.urlPreview!,
                                  imageHeight: currentImage.resolution!.height!,
                                  imageWidth: currentImage.resolution!.width!));
                        },
                        child: SvgPicture.asset(
                            'assets/images/dots-vertical.svg')),
                  ],
                  actionsIconTheme: IconThemeData(color: Helper.iconColor),
                );
              },
              error: (err, _) {
                return const Text("Error",
                    style: TextStyle(color: Helper.errorColor));
              },
              loading: () => LoadingAppBar(),
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: true,
        child: RefreshIndicator(
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          color: ref.watch(primaryColorProvider),
          displacement: 40,
          onRefresh: () async {
            HapticFeedback.mediumImpact();
            return await ref
                .refresh(imagesByCamIdControllerProvider.notifier)
                .getImagesByCamId(widget.projectId, widget.cameraId);
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Consumer(builder: (context, ref, child) {
              return imagesByCameraIdData.when(
                  data: (imagesData) {
                    showBottomBar = true;

                    return !hasImages
                        ? Center(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.6,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/illustration.svg'),
                                  SizedBox(height: 16.h),
                                  Text(
                                    "No Images Available",
                                    style: TextStyle(
                                        color: Helper.textColor900,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                                Stack(children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height -
                                        (Scaffold.of(context)
                                                .appBarMaxHeight!
                                                .toDouble() +
                                            kBottomNavigationBarHeight +
                                            184.h),
                                    child: imagesData.images!.isNotEmpty
                                        ? Image.network(
                                            currentImage!.urlThumb!,
                                            gaplessPlayback: true,
                                            width: double.infinity,
                                            fit: BoxFit.fitHeight,
                                            errorBuilder: (BuildContext context,
                                                Object exception,
                                                StackTrace? stackTrace) {
                                              return ClipRRect(
                                                child: Image.asset(
                                                  'assets/images/error_image.jpeg',
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          )
                                        : Container(
                                            color: Helper.widgetBackground),
                                  ),
                                  BlurryContainer(
                                    blur: 30,
                                    height: MediaQuery.of(context).size.height -
                                        (Scaffold.of(context)
                                                .appBarMaxHeight!
                                                .toDouble() +
                                            kBottomNavigationBarHeight +
                                            184.h),
                                    padding: EdgeInsets.zero,
                                    borderRadius: BorderRadius.zero,
                                    child: imagesData.images!.isNotEmpty
                                        ? CarouselWidget(
                                            imagesByCameraIdInter:
                                                imagesByCameraIdInter,
                                            currentImage: currentImage!,
                                            cameraId: widget.cameraId,
                                            onChange: (value) {
                                              Scrollable.ensureVisible(
                                                  GlobalObjectKey(
                                                    value.id.toString(),
                                                  ).currentContext!,
                                                  alignment: 0.1);
                                              ref
                                                  .read(currentImageProvider
                                                      .notifier)
                                                  .setCurrentImage(value);
                                            })
                                        : Center(
                                            child: Text(
                                            "No images",
                                            style: TextStyle(
                                                color: Helper.textColor500,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 12.sp),
                                          )),
                                  ),
                                  Positioned(
                                    top: 16,
                                    left: 16,
                                    child: InkWell(
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        showModalBottomSheet(
                                            useRootNavigator: true,
                                            isScrollControlled: true,
                                            context: context,
                                            backgroundColor: Colors.transparent,
                                            builder: (context) =>
                                                DatePickerWidget(
                                                  startDate:
                                                      imagesByCameraIdInter
                                                          .startDate!,
                                                  endDate: imagesByCameraIdInter
                                                      .endDate!,
                                                  showMonthText:
                                                      currentImage.datetime!,
                                                  onChange: (dateSelected,
                                                      currentMonth) {
                                                    showDateSelected =
                                                        dateSelected;
                                                    ref
                                                        .read(
                                                            imagesByCamIdControllerProvider
                                                                .notifier)
                                                        .getImagesByCamId(
                                                            widget.projectId,
                                                            widget.cameraId,
                                                            searchDate:
                                                                dateSelected);

                                                    context.pop();
                                                    setState(() {
                                                      getDaysInMonth(
                                                          currentMonth, false);
                                                      showDate(currentImage
                                                          .datetime!);
                                                      showBottomBar = true;
                                                    });
                                                  },
                                                ));
                                      },
                                      child: BlurryContainer(
                                          blur: 3,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 6.h, horizontal: 8.w),
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          color: Colors.black.withOpacity(0.3),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                'assets/images/timeline.svg',
                                                height: 16.h,
                                                width: 16.w,
                                                color: Colors.white,
                                              ),
                                              SizedBox(width: 4.w),
                                              Text(
                                                  parseEndDateTimeString(
                                                      currentImage!.datetime!,
                                                      false),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 12.sp)),
                                            ],
                                          )),
                                    ),
                                  ),
                                  imagesData.images!.isNotEmpty
                                      ? Positioned(
                                          top: 16,
                                          right: 16,
                                          child: InkWell(
                                            highlightColor: Colors.transparent,
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                PageRouteBuilder(
                                                  pageBuilder: (context,
                                                          animation,
                                                          secondaryAnimation) =>
                                                      LandscapeCameraDetailsScreen(
                                                    projectId: widget.projectId,
                                                    cameraId: widget.cameraId,
                                                    imagesData:
                                                        imagesByCameraIdInter,
                                                    projectName:
                                                        widget.projectName,
                                                  ),
                                                  transitionsBuilder: (context,
                                                      animation,
                                                      secondaryAnimation,
                                                      child) {
                                                    const begin = 0.75;
                                                    const end = 1.0;
                                                    var rotationAnimation =
                                                        Tween(
                                                                begin: begin,
                                                                end: end)
                                                            .animate(animation);
                                                    return RotationTransition(
                                                      turns: rotationAnimation,
                                                      child: child,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            child: BlurryContainer(
                                              blur: 3,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 6.h,
                                                  horizontal: 6.w),
                                              borderRadius:
                                                  BorderRadius.circular(30.r),
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                              child: SvgPicture.asset(
                                                'assets/images/expand.svg',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        )
                                      : SizedBox(),
                                ]),
                                imagesData.images!.isNotEmpty
                                    ? SizedBox(
                                        height: 76.h,
                                        child: ImageSliderWidget(
                                          imagesByCameraIdInter:
                                              imagesByCameraIdInter,
                                          currentImage: currentImage,
                                          onChange: (value) {
                                            ref
                                                .read(currentImageProvider
                                                    .notifier)
                                                .setCurrentImage(value);
                                          },
                                        ),
                                      )
                                    : SizedBox(
                                        height: 76.h,
                                        child: Center(
                                            child: Text(
                                          "No Images on: " +
                                              showDate(showDateSelected),
                                          style: TextStyle(
                                              color: Helper.textColor500,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp),
                                        )),
                                      ),
                                SizedBox(
                                  height: 74.h,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            showModalBottomSheet(
                                                useRootNavigator: true,
                                                isScrollControlled: true,
                                                context: context,
                                                backgroundColor:
                                                    Colors.transparent,
                                                builder: (context) =>
                                                    DatePickerWidget(
                                                      startDate:
                                                          imagesByCameraIdInter
                                                              .startDate!,
                                                      endDate:
                                                          imagesByCameraIdInter
                                                              .endDate!,
                                                      showMonthText:
                                                          currentImage!
                                                              .datetime!,
                                                      onChange: (dateSelected,
                                                          currentMonth) {
                                                        ref
                                                            .read(
                                                                imagesByCamIdControllerProvider
                                                                    .notifier)
                                                            .getImagesByCamId(
                                                                widget
                                                                    .projectId,
                                                                widget.cameraId,
                                                                searchDate:
                                                                    dateSelected);

                                                        context.pop();
                                                        setState(() {
                                                          getDaysInMonth(
                                                              currentMonth,
                                                              false);
                                                          showDate(currentImage!
                                                              .datetime!);
                                                          showBottomBar = true;
                                                        });
                                                      },
                                                    ));
                                          },
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w,
                                                  vertical: 14.h),
                                              child: Text(
                                                "-" +
                                                    parseEndDateTimeString(
                                                        currentImage!.datetime!,
                                                        true) +
                                                    "-",
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    fontSize: 10.sp,
                                                    fontWeight: FontWeight.w700,
                                                    color: Helper.baseBlack
                                                        .withOpacity(0.3)),
                                              ))),
                                      Expanded(
                                        child: DateSliderWidget(
                                          daysInMonth: daysInMonth,
                                          selectedDate: currentImage!.date,
                                          onChange: (value) {
                                            log(value.toString());
                                            ref
                                                .watch(
                                                    imagesByCamIdControllerProvider
                                                        .notifier)
                                                .getImagesByCamId(
                                                    widget.projectId,
                                                    widget.cameraId,
                                                    searchDate: value);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ]);
                  },
                  error: (err, _) {
                    return const Text("Failed to fetch images data",
                        style: TextStyle(
                            letterSpacing: -0.3, color: Helper.errorColor));
                  },
                  loading: () => LoadingCamDetails());
            }),
          ),
        ),
      ),
      bottomNavigationBar:
          showBottomBar && imagesByCameraIdInter.endDate != null
              ? BottomNavWidget(
                  projectId: widget.projectId,
                  projectName: widget.projectName,
                  cameraId: widget.cameraId,
                  endDate: imagesByCameraIdInter.endDate!,
                  startDate: imagesByCameraIdInter.startDate!,
                  cameraName: widget.cameraName,
                )
              : SizedBox(),
    );
  }
}
