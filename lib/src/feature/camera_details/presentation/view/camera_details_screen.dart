import 'dart:async';
import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_app_bar.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_cam_details.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/bottom_navigation/view/camera_view_bottom_nav.dart';
import 'package:progresscenter_app_v4/src/feature/camera/presentation/provider/camera_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/camera_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_by_cam_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_controller_watcher.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/landscape_camera_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/camera_bottomsheet_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/cameras_widget.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/widgets/date_slider_widget.dart';
import 'dart:developer';

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
  final dataKey = new GlobalKey();
  List<DateTime> daysInMonth = [];
  String _selectedDate = '';
  String _searchDate = '';
  DateTime currentMonth = DateTime.now();
  String showMonth = "JAN";
  bool showBottomBar = true;
  TransformationController? controller;
  AnimationController? animationController;
  Animation<Matrix4>? animation;
  OverlayEntry? entry;
  ScrollController _scrollController = ScrollController();
  CarouselController carouselController = CarouselController();
  ImageData? imageData;
  GlobalKey _listViewKey = GlobalKey();
  TransformationController viewTransformationController =
      TransformationController();
  PageController _pageController = PageController();
  GlobalKey<ScrollableState> listViewKey = GlobalKey<ScrollableState>();

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
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
      ref.read(cameraByIdControllerProvider.notifier).getCameraById(
            widget.projectId,
            widget.cameraId,
          );
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(imagesByCamIdControllerProvider.notifier)
          .getImagesByCamId(widget.projectId, widget.cameraId,
              searchDate: _searchDate)
          .then((value) {
        getDaysInMonth(value.endDate, true);
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
      print("datetime format" + month.toString());
      final firstDayOfMonth = DateTime(month.year, month.month, 1);
      final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

      print(firstDayOfMonth.toString());
      print(lastDayOfMonth.toString());
      for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
        daysInMonth.add(DateTime(month.year, month.month, i));
      }

      return daysInMonth;
    }
    log("datetime format" + currentMonth.toString());
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0);

    log("firstDayOfMonth" + firstDayOfMonth.toString());

    for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
    }

    return daysInMonth;
  }

  showDate(String date) {
    DateTime parsedDate = DateTime.parse(date);

    String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);

    showMonth = DateFormat.MMM().format(parsedDate).toUpperCase();
    scrollToItem(10, listViewKey);

    return formattedDate;
  }

  parseDateTimeString(String time) {
    String dateWithT = time.substring(0, 8) + 'T' + time.substring(8);
    DateTime dateTime = DateTime.parse(dateWithT);
    final String formattedTime = DateFormat('h:mm a').format(dateTime);
    return formattedTime;
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

  bool _isCurrentItemFullyVisible() {
    double currentItemPosition = _scrollController.position.pixels;
    double itemWidth = 44.0;
    return currentItemPosition >= 0 && currentItemPosition < itemWidth;
  }

  void scrollToItem(int index, GlobalKey<ScrollableState> key) {
    Scrollable.ensureVisible(key.currentContext!,
        alignment: 0.5, duration: Duration(seconds: 1));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
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
                return AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.white,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  titleSpacing: 0.0,
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
                  title: camerasListData.when(
                    data: (data) {
                      return InkWell(
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
                .getImagesByCamId(widget.projectId, widget.cameraId)
                .then((value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Timer(Duration(seconds: 1), () {
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
              });
            });
          },
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Container(
              child: Consumer(builder: (context, ref, child) {
                return imagesByCameraIdData.when(
                    data: (imagesData) {
                      showBottomBar = true;

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            imagesData.images!.isEmpty
                                ? Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              (Scaffold.of(context)
                                                      .appBarMaxHeight!
                                                      .toDouble() +
                                                  kBottomNavigationBarHeight +
                                                  184.h),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                : Stack(children: [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height -
                                              (Scaffold.of(context)
                                                      .appBarMaxHeight!
                                                      .toDouble() +
                                                  kBottomNavigationBarHeight +
                                                  184.h),
                                      child: Image.network(
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
                                      ),
                                    ),
                                    BlurryContainer(
                                      blur: 30,
                                      height:
                                          MediaQuery.of(context).size.height -
                                              (Scaffold.of(context)
                                                      .appBarMaxHeight!
                                                      .toDouble() +
                                                  kBottomNavigationBarHeight +
                                                  184.h),
                                      padding: EdgeInsets.zero,
                                      borderRadius: BorderRadius.zero,
                                      child: PageView.builder(
                                        controller: _pageController,
                                        itemCount: imagesByCameraIdInter
                                            .images!.length,
                                        reverse: true,
                                        itemBuilder: (BuildContext context,
                                            int itemIndex) {
                                          return Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              BlurryContainer(
                                                  blur: 30,
                                                  borderRadius:
                                                      BorderRadius.zero,
                                                  height: 250.h,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: Colors.white
                                                      .withOpacity(0.4),
                                                  child: SizedBox()),
                                              PinchZoom(
                                                maxScale: 10,
                                                child: Image.network(
                                                  currentImage.urlPreview!,
                                                  width: double.infinity,
                                                  gaplessPlayback: true,
                                                  scale: 1,
                                                  loadingBuilder: (context,
                                                      child, loadingProgress) {
                                                    if (loadingProgress == null)
                                                      return child;

                                                    return Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: ref.watch(
                                                            primaryColorProvider),
                                                        value: (loadingProgress !=
                                                                null)
                                                            ? (loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                loadingProgress
                                                                    .expectedTotalBytes!)
                                                            : 0,
                                                      ),
                                                    );
                                                  },
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
                                            ],
                                          );
                                        },
                                        onPageChanged: (int index) {
                                          Scrollable.ensureVisible(
                                              GlobalObjectKey(
                                                imagesByCameraIdInter
                                                    .images![index].id
                                                    .toString(),
                                              ).currentContext!,
                                              alignment: 0.1);

                                          final reversedIndex =
                                              imagesByCameraIdInter
                                                      .images!.length -
                                                  index;
                                          setState(() {
                                            final image = model.Image(
                                              id: imagesByCameraIdInter
                                                  .images![index].id,
                                              name: imagesByCameraIdInter
                                                  .images![index].name,
                                              datetime: imagesByCameraIdInter
                                                  .images![index].datetime,
                                              date: imagesByCameraIdInter
                                                  .images![index].date,
                                              urlPreview: imagesByCameraIdInter
                                                  .images![index].urlPreview,
                                              urlThumb: imagesByCameraIdInter
                                                  .images![index].urlThumb,
                                            );
                                            ref
                                                .read(currentImageProvider
                                                    .notifier)
                                                .setCurrentImage(image);
                                          });
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      top: 16,
                                      left: 16,
                                      child: InkWell(
                                        onTap: () async {
                                          await _showDateBottomSheet(
                                              context,
                                              imagesByCameraIdInter.startDate!,
                                              imagesByCameraIdInter.endDate!,
                                              _selectedDate,
                                              widget.cameraId,
                                              currentImage.datetime!,
                                              widget.projectId,
                                              ref,
                                              currentMonth);
                                          setState(() {});
                                        },
                                        child: BlurryContainer(
                                            blur: 3,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 6.h, horizontal: 8.w),
                                            borderRadius:
                                                BorderRadius.circular(30.r),
                                            color:
                                                Colors.black.withOpacity(0.3),
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
                                                        currentImage.datetime!,
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
                                    Positioned(
                                      top: 16,
                                      right: 16,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder: (context, animation,
                                                      secondaryAnimation) =>
                                                  LandscapeCameraDetailsScreen(
                                                projectId: widget.projectId,
                                                cameraId: widget.cameraId,
                                                imagesData:
                                                    imagesByCameraIdInter,
                                                projectName: widget.projectName,
                                              ),
                                              transitionsBuilder: (context,
                                                  animation,
                                                  secondaryAnimation,
                                                  child) {
                                                const begin = 0.75;
                                                const end = 1.0;
                                                var rotationAnimation = Tween(
                                                        begin: begin, end: end)
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
                                              vertical: 6.h, horizontal: 6.w),
                                          borderRadius:
                                              BorderRadius.circular(30.r),
                                          color: Colors.black.withOpacity(0.3),
                                          child: SvgPicture.asset(
                                            'assets/images/expand.svg',
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            SizedBox(
                              height: 76.h,
                              child: ListView.separated(
                                  separatorBuilder: (context, builder) {
                                    return SizedBox(
                                      width: 2.w,
                                    );
                                  },
                                  itemCount:
                                      imagesByCameraIdInter.images!.length,
                                  key: _listViewKey,
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  controller: _scrollController,
                                  itemBuilder: ((context, index) {
                                    final reversedIndex =
                                        imagesByCameraIdInter.images!.length -
                                            1 -
                                            index;

                                    return InkWell(
                                      onTap: () {
                                        final image = model.Image(
                                          id: imagesByCameraIdInter
                                              .images![reversedIndex].id,
                                          name: imagesByCameraIdInter
                                              .images![reversedIndex].name,
                                          datetime: imagesByCameraIdInter
                                              .images![reversedIndex].datetime,
                                          urlPreview: imagesByCameraIdInter
                                              .images![reversedIndex]
                                              .urlPreview,
                                          urlThumb: imagesByCameraIdInter
                                              .images![reversedIndex].urlThumb,
                                        );
                                        ref
                                            .read(currentImageProvider.notifier)
                                            .setCurrentImage(image);
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 4.h),
                                        child: Column(
                                            key: GlobalObjectKey(
                                              imagesByCameraIdInter
                                                  .images![reversedIndex].id
                                                  .toString(),
                                            ),
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.zero,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          6.r),
                                                  border: currentImage!.id ==
                                                          imagesByCameraIdInter
                                                              .images![
                                                                  reversedIndex]
                                                              .id!
                                                      ? Border.all(
                                                          color: ref.watch(
                                                              primaryColorProvider),
                                                          width: 2.w,
                                                        )
                                                      : Border.all(
                                                          width: 2.w,
                                                          color: Colors
                                                              .transparent),
                                                ),
                                                child: Container(
                                                  padding: EdgeInsets.zero,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    border: currentImage.id ==
                                                            imagesByCameraIdInter
                                                                .images![
                                                                    reversedIndex]
                                                                .id!
                                                        ? Border.all(
                                                            color: Colors.white,
                                                            width: 0.7.w,
                                                          )
                                                        : Border.all(
                                                            width: 0.6.w,
                                                            color: Colors
                                                                .transparent),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.r),
                                                    child: Image.network(
                                                      imagesByCameraIdInter
                                                          .images![
                                                              reversedIndex]
                                                          .urlThumb!,
                                                      gaplessPlayback: true,
                                                      width: 44.w,
                                                      height: 44.h,
                                                      fit: BoxFit.fill,
                                                      errorBuilder:
                                                          (BuildContext context,
                                                              Object exception,
                                                              StackTrace?
                                                                  stackTrace) {
                                                        return ClipRRect(
                                                          child: Image.asset(
                                                            'assets/images/error_image.jpeg',
                                                            width: 44.w,
                                                            height: 44.h,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 6.h,
                                              ),
                                              Text(
                                                parseDateTimeString(imagesData
                                                    .images![reversedIndex]
                                                    .datetime!),
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.textColor700,
                                                    fontSize: 8.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )
                                            ]),
                                      ),
                                    );
                                  })),
                            ),
                            SizedBox(
                              height: 74.h,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await _showDateBottomSheet(
                                          context,
                                          imagesByCameraIdInter.startDate!,
                                          imagesByCameraIdInter.endDate!,
                                          _selectedDate,
                                          widget.cameraId,
                                          currentImage!.datetime!,
                                          widget.projectId,
                                          ref,
                                          currentMonth);
                                      setState(() {});
                                    },
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w, vertical: 14.h),
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
                                        )),
                                  ),
                                  Expanded(
                                    child: DateSliderWidget(
                                      daysInMonth: daysInMonth,
                                      selectedDate: currentImage.date,
                                      onChange: (value) {
                                        log(value.toString());
                                        ref
                                            .watch(
                                                imagesByCamIdControllerProvider
                                                    .notifier)
                                            .getImagesByCamId(widget.projectId,
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
      ),
      bottomNavigationBar: showBottomBar
          ? SafeArea(
              child: Container(
                // padding: EdgeInsets.only(bottom: Platform.isIOS ? 50.h : 0.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  border: Border(
                    top: BorderSide(
                        color: Colors.white.withOpacity(0.2), width: 0.5),
                  ),
                ),
                height: 50.h,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.push('/livelapse', extra: {
                            "projectId": widget.projectId,
                            "projectName": widget.projectName,
                            "cameraId": widget.cameraId
                          });
                        },
                        child: IconBottomBar(
                          icon: 'assets/images/video-recorder.svg',
                          selected: true,
                          text: 'LiveLapse',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.push('/slider', extra: {
                            "projectId": widget.projectId,
                            "projectName": widget.projectName,
                            "cameraId": widget.cameraId
                          });
                        },
                        child: IconBottomBar(
                          icon: 'assets/images/sliders.svg',
                          selected: true,
                          text: 'Slider',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.push('/compare', extra: {
                            "projectId": widget.projectId,
                            "projectName": widget.projectName,
                            "cameraId": widget.cameraId
                          });
                        },
                        child: IconBottomBar(
                          icon: 'assets/images/rows.svg',
                          selected: true,
                          text: 'Compare',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.push('/splitview', extra: {
                            "projectId": widget.projectId,
                            "projectName": widget.projectName,
                            "cameraId": widget.cameraId
                          });
                        },
                        child: IconBottomBar(
                          icon: 'assets/images/layout-left.svg',
                          selected: true,
                          text: 'Split View',
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          HapticFeedback.mediumImpact();
                          context.push('/report', extra: {
                            "projectId": widget.projectId,
                            "projectName": widget.projectName,
                            "cameraId": widget.cameraId,
                            "startDate": imagesByCameraIdInter.startDate!,
                            "endDate": imagesByCameraIdInter.endDate!,
                            "cameraName": widget.cameraName,
                          });
                        },
                        child: IconBottomBar(
                          icon: 'assets/images/file-download.svg',
                          selected: true,
                          text: 'Report',
                        ),
                      )
                    ]),
              ),
            )
          : SizedBox(),
    );
  }

  _showDateBottomSheet(
      context,
      String startDate,
      String endDate,
      String selectedDate,
      String cameraId,
      String showMonthText,
      String projectId,
      WidgetRef ref,
      DateTime currentMonth) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(builder: (context, StateSetter modalState) {
          // bottomSheetState = modalState;
          return Container(
            padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            // height: MediaQuery.of(context).size.height * 1.6,
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
                    lastDate: DateTime.parse(endDate),
                    firstDate: DateTime.parse(startDate),
                    selectedDayHighlightColor: ref.watch(primaryColorProvider),
                  ),
                  value: [],
                  onValueChanged: (value) {
                    print(value.toString());
                    DateTime date = DateTime.parse(value[0].toString());
                    selectedDate = DateFormat("yyyyMMdd").format(date);
                    print("selectedDate " + selectedDate);
                    log("value0 " + value[0]!.toString());
                    currentMonth = value[0]!;
                    log("currentMonth" + currentMonth.toString());
                  },
                ),
                // SizedBox(height: 20.h),
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
                        backgroundColor: MaterialStatePropertyAll(
                            ref.watch(primaryColorProvider)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )),
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ref
                            .read(imagesByCamIdControllerProvider.notifier)
                            .getImagesByCamId(projectId, cameraId,
                                searchDate: selectedDate);
                      });

                      context.pop();
                      setState(() {
                        getDaysInMonth(currentMonth, false);
                        showDate(showMonthText);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }
}
