import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
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
import 'package:progresscenter_app_v4/src/feature/bottom_navigation/view/camera_view_bottom_nav.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/camera_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/images_by_cam_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';
import 'package:zoom_pinch_overlay/zoom_pinch_overlay.dart';

class CameraDetailsSreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  const CameraDetailsSreen({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.cameraId,
  });

  @override
  ConsumerState<CameraDetailsSreen> createState() => _CameraDetailsSreenState();
}

class _CameraDetailsSreenState extends BaseConsumerState<CameraDetailsSreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  int _selectedImageIndex = 0;
  List<DateTime> daysInMonth = [];
  String _selectedDate = '';
  String _searchDate = '';
  DateTime currentMonth = DateTime.now();
  String showMonth = "JAN";
  bool showBottomBar = true;
  // StateSetter? bottomSheetState;
  TransformationController? controller;
  AnimationController? animationController;
  Animation<Matrix4>? animation;
  OverlayEntry? entry;
  ScrollController _scrollController = ScrollController();
  GlobalKey _listViewKey = GlobalKey();
  TransformationController viewTransformationController =
      TransformationController();

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    final zoomFactor = 2.0;
    final xTranslate = 400.0;
    final yTranslate = 400.0;
    // viewTransformationController.value.setEntry(0, 0, zoomFactor);
    // viewTransformationController.value.setEntry(1, 1, zoomFactor);
    // viewTransformationController.value.setEntry(2, 2, zoomFactor);
    // viewTransformationController.value.setEntry(0, 3, -xTranslate);
    // viewTransformationController.value.setEntry(1, 3, -yTranslate);

    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )
      ..addListener(() {
        controller!.value = animation!.value;
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          removeOverlay();
        }
      });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(cameraByIdControllerProvider.notifier).getCameraById(
            widget.projectId,
            widget.cameraId,
          );
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(imagesByCamIdControllerProvider.notifier).getImagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate);
    });
    // DateTime _currentMonth = DateTime.now();
    // getDaysInMonth(_currentMonth);
  }

  removeOverlay() {
    entry!.remove();
    entry = null;
  }

  resetAnimation() {
    animation = Matrix4Tween(
      begin: controller!.value,
      end: Matrix4.identity(),
    ).animate(CurvedAnimation(
        parent: animationController!, curve: Curves.decelerate));
    animationController!.forward(from: 0);
  }

  void showOverlay(BuildContext context, image) {
    final renderBox = context.findRenderObject()! as RenderBox;
    final offSet = renderBox.localToGlobal(Offset.zero);
    final size = MediaQuery.of(context).size;
    entry = OverlayEntry(builder: (context) {
      return buildImage(image);
      // Stack(
      //   children: [
      //     Positioned.fill(
      //       child: Container(color: Colors.black)
      //     ),
      //     Positioned(
      //       left: offSet.dx,
      //       top: offSet.dy,
      //       width: size.width,
      //       child: buildImage(image,)),
      //   ],
      // );
    });
    final overlay = Overlay.of(context);
    overlay.insert(entry!);
  }

  Widget buildImage(
    String image,
  ) {
    return Builder(
        builder: (BuildContext context) => InteractiveViewer(
              transformationController: controller,
              panEnabled: false,
              onInteractionEnd: resetAnimation(),
              onInteractionStart: (details) {
                if (details.pointerCount < 2) return;
                if (entry == null) {
                  showOverlay(context, image);
                }
              },
              clipBehavior: Clip.none,
              minScale: 1,
              maxScale: 4,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  image,
                  width: double.infinity,
                  // height: 210.h,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;

                    return Center(
                      child: CircularProgressIndicator(
                        color: Helper.primary,
                        value: (loadingProgress != null)
                            ? (loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!)
                            : 0,
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
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
            ));
  }

  List<DateTime> getDaysInMonth(currentMonth, bool isString) {
    daysInMonth = [];
    // final currentMonth = DateTime.parse(month);
    if (isString) {
      final month = DateTime.parse(currentMonth);
      print("datetime format" + month.toString());
      final firstDayOfMonth = DateTime(month.year, month.month, 1);
      final lastDayOfMonth = DateTime(month.year, month.month + 1, 0);

      print(firstDayOfMonth.toString());
      print(lastDayOfMonth.toString());
      // final daysInMonth = <DateTime>[];
      for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
        daysInMonth.add(DateTime(month.year, month.month, i));
      }

      return daysInMonth;
    }
    print("datetime format" + currentMonth.toString());
    final firstDayOfMonth = DateTime(currentMonth.year, currentMonth.month, 1);
    final lastDayOfMonth =
        DateTime(currentMonth.year, currentMonth.month + 1, 0);

    print(firstDayOfMonth.toString());
    print(lastDayOfMonth.toString());
    // final daysInMonth = <DateTime>[];
    for (var i = firstDayOfMonth.day; i <= lastDayOfMonth.day; i++) {
      daysInMonth.add(DateTime(currentMonth.year, currentMonth.month, i));
    }

    return daysInMonth;
  }

  showDate(String date) {
    // Parse the endDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat('dd MMM yyyy').format(parsedDate);
    showMonth = DateFormat.MMM().format(parsedDate).toUpperCase();
    return formattedDate;
  }

  // static int getDaysInMonth(int year, int month) {
  //   if (month == DateTime.february) {
  //     final bool isLeapYear =
  //         (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
  //     return isLeapYear ? 29 : 28;
  //   }
  //   const List<int> daysInMonth = <int>[
  //     31,
  //     -1,
  //     31,
  //     30,
  //     31,
  //     30,
  //     31,
  //     31,
  //     30,
  //     31,
  //     30,
  //     31
  //   ];
  //   return daysInMonth[month - 1];
  // }

  @override
  void dispose() {
    controller!.dispose();
    animationController!.dispose();
    ref.invalidate(selectedImageDataProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cameraByIdData = ref.watch(
        cameraByIdControllerProvider.select((value) => value.cameraById));
    final imagesByCameraIdData = ref.watch(
        imagesByCamIdControllerProvider.select((value) => value.imagesByCamId));
    final selectedImageData = ref.watch(selectedImageDataProvider);
    final scaleMatrix = Matrix4.identity()..scale(1.9);

    viewTransformationController = TransformationController(scaleMatrix);

    return Scaffold(
      backgroundColor: Color.fromRGBO(247, 247, 247, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: AppBar(
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
              title: cameraByIdData.when(
                skipLoadingOnRefresh: false,
                skipLoadingOnReload: false,
                data: (cameraData) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  cameraData.name!,
                                  style: TextStyle(
                                      color: Helper.baseBlack,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  width: 6.w,
                                ),
                                // SvgPicture.asset('assets/images/chevron-down.svg'),
                              ],
                            ),
                            Text(
                              widget.projectName,
                              style: TextStyle(
                                  color: Helper.baseBlack.withOpacity(0.5),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ]),
                      SvgPicture.asset('assets/images/chevron-down.svg'),
                    ],
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
                      _showCameraBottomSheet(context);
                    },
                    child: SvgPicture.asset('assets/images/dots-vertical.svg')),
              ],
              actionsIconTheme: IconThemeData(color: Helper.iconColor),
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.only(bottom: kBottomNavigationBarHeight),
          child: Consumer(builder: (context, ref, child) {
            print("state printed" + selectedImageData.toString());
            return imagesByCameraIdData.when(
              data: (imagesData) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  // Scroll to the last index
                  _scrollController.animateTo(
                    _scrollController.position.maxScrollExtent,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                });
                if (imagesData.images!.isEmpty) {
                  showBottomBar = false;

                  return Center(
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/illustration.svg'),
                          SizedBox(height: 16.h),
                          Text(
                            "No Images yet",
                            style: TextStyle(
                                color: Helper.textColor900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                ;
                getDaysInMonth(imagesData.endDate, true);
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(children: [
                        Container(
                          height: MediaQuery.of(context).size.height -
                              (Scaffold.of(context)
                                      .appBarMaxHeight!
                                      .toDouble() +
                                  kBottomNavigationBarHeight +
                                  147.h),
                          child: Image.network(
                            selectedImageData == null
                                ? imagesData.images![0].urlPreview!
                                : selectedImageData.urlPreview!,
                            width: double.infinity,
                            // scale: 20,
                            // height: 210.h,
                            fit: BoxFit.fitHeight,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return Center(
                                child: CircularProgressIndicator(
                                  color: Helper.primary,
                                  value: (loadingProgress != null)
                                      ? (loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!)
                                      : 0,
                                ),
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
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
                          blur: 10,
                          borderRadius: BorderRadius.zero,
                          padding: EdgeInsets.zero,
                          child: Container(
                              // color: Helper.textColor300,
                              height: MediaQuery.of(context).size.height -
                                  (Scaffold.of(context)
                                          .appBarMaxHeight!
                                          .toDouble() +
                                      kBottomNavigationBarHeight +
                                      147.h),
                              child: InteractiveViewer(
                                // transformationController:
                                //     viewTransformationController,
                                // panEnabled: false,
                                // boundaryMargin: EdgeInsets.all(100),
                                // minScale: 0.1,
                                //  alignment: Alignment.center,
                                // constrained: false,
                                maxScale: 10,
                                child: Image.network(
                                  selectedImageData == null
                                      ? imagesData.images![0].urlPreview!
                                      : selectedImageData.urlPreview!,
                                  width: double.infinity,
                                  // scale: 20,
                                  // height: 210.h,
                                  // fit: BoxFit.fitHeight,
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                    if (loadingProgress == null) return child;

                                    return Center(
                                      child: CircularProgressIndicator(
                                        color: Helper.primary,
                                        value: (loadingProgress != null)
                                            ? (loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!)
                                            : 0,
                                      ),
                                    );
                                  },
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
                              )),
                        ),
                        Positioned(
                          top: 16,
                          left: 16,
                          child: InkWell(
                            onTap: () async {
                              await _showDateBottomSheet(
                                  context,
                                  imagesData.startDate!,
                                  imagesData.endDate!,
                                  _selectedDate,
                                  widget.cameraId,
                                  widget.projectId,
                                  ref,
                                  currentMonth);
                              setState(() {});
                            },
                            child: BlurryContainer(
                                blur: 3,
                                padding: EdgeInsets.symmetric(
                                    vertical: 6.h, horizontal: 8.w),
                                borderRadius: BorderRadius.circular(30.r),
                                color: Colors.white.withOpacity(0.1),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/timeline.svg',
                                      height: 16.h,
                                      width: 16.w,
                                      color: Colors.white,
                                    ),
                                    SizedBox(width: 4.w),
                                    Text(showDate(imagesData.endDate!),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
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
                              // SystemChrome.setPreferredOrientations(
                              //     [DeviceOrientation.landscapeRight]);
                              context.push('/landscapeCameraDetails', extra: {
                                "projectId": widget.projectId,
                                "projectName": widget.projectName,
                                "cameraId": widget.cameraId,
                                "imagesData": imagesData
                              });
                            },
                            child: BlurryContainer(
                              blur: 3,
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.h, horizontal: 6.w),
                              borderRadius: BorderRadius.circular(30.r),
                              color: Colors.white.withOpacity(0.1),
                              child: SvgPicture.asset(
                                'assets/images/expand.svg',
                                // height: 16.h,
                                // width: 16.w,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ]),
                      SizedBox(height: 6.h),
                      SizedBox(
                        height: 73.h,
                        child: ListView.separated(
                            separatorBuilder: (context, builder) {
                              return SizedBox(
                                width: 2.w,
                              );
                            },
                            itemCount: imagesData.images!.length,
                            key: _listViewKey,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            controller: _scrollController,
                            itemBuilder: ((context, index) {
                              // _scrollDown();

                              final reversedIndex =
                                  imagesData.images!.length - 1 - index;
                              String dateWithT = imagesData
                                      .images![reversedIndex].datetime!
                                      .substring(0, 8) +
                                  'T' +
                                  imagesData.images![reversedIndex].datetime!
                                      .substring(8);
                              DateTime dateTime = DateTime.parse(dateWithT);
                              final String formattedTime =
                                  DateFormat('h:mm a').format(dateTime);
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    _selectedImageIndex = reversedIndex;
                                  });
                                  final imageData = ImageData(
                                    name:
                                        imagesData.images![reversedIndex].name,
                                    dateTime: imagesData
                                        .images![reversedIndex].datetime,
                                    camera: imagesData
                                        .images![reversedIndex].camera,
                                    id: imagesData.images![reversedIndex].id,
                                    urlPreview: imagesData
                                        .images![reversedIndex].urlPreview,
                                  );

                                  ref
                                      .read(selectedImageDataProvider.notifier)
                                      .setImageData(imageData);
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 2.h),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.zero,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6.r),
                                            border: _selectedImageIndex ==
                                                    reversedIndex
                                                ? Border.all(
                                                    color: Helper.primary,
                                                    width: 2.w,
                                                  )
                                                : Border.all(
                                                    width: 2.w,
                                                    color: Colors.transparent),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            child: Image.network(
                                              imagesData.images![reversedIndex]
                                                  .urlThumb!,
                                              width: 44.w,
                                              height: 44.h,
                                              fit: BoxFit.fill,
                                              errorBuilder:
                                                  (BuildContext context,
                                                      Object exception,
                                                      StackTrace? stackTrace) {
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
                                        SizedBox(
                                          height: 6.h,
                                        ),
                                        Text(
                                          formattedTime,
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              color: Helper.textColor700,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.w500),
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
                                    imagesData.startDate!,
                                    imagesData.endDate!,
                                    _selectedDate,
                                    widget.cameraId,
                                    widget.projectId,
                                    ref,
                                    currentMonth);
                                setState(() {});
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.w, vertical: 14.h),
                                  child: Text(
                                    "- $showMonth -",
                                    style: TextStyle(
                                        letterSpacing: -0.3,
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w700,
                                        color:
                                            Helper.baseBlack.withOpacity(0.3)),
                                  )),
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                itemCount: daysInMonth.length,
                                itemBuilder: (context, index) {
                                  final day = daysInMonth[index];
                                  final formattedDay =
                                      DateFormat.EEEE().format(day);
                                  final formattedDate =
                                      DateFormat.d().format(day);
                                  final isSelected = index == _selectedIndex;

                                  return InkWell(
                                    onTap: () {
                                      setState(() {
                                        _selectedIndex =
                                            index; // Update the selected index when an item is tapped
                                      });
                                      print(day.toString());
                                      // DateTime date =
                                      //     DateTime.parse(value[0].toString());
                                      _searchDate =
                                          DateFormat("yyyyMMdd").format(day);
                                      print("month list date" + _searchDate);
                                      ref
                                          .watch(imagesByCamIdControllerProvider
                                              .notifier)
                                          .getImagesByCamId(
                                              widget.projectId, widget.cameraId,
                                              searchDate: _searchDate);
                                    },
                                    child: Container(
                                      margin: EdgeInsets.zero,
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: isSelected
                                              ? Helper.baseBlack
                                                  .withOpacity(0.06)
                                              : Colors.transparent,
                                          width: 1, // Set the border width
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                      child: Stack(children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.w, vertical: 12.h),
                                          child: Column(
                                            children: [
                                              Text(
                                                formattedDate,
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.baseBlack,
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Text(
                                                formattedDay
                                                    .substring(0, 3)
                                                    .toUpperCase(),
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.baseBlack,
                                                    fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ),
                                        isSelected
                                            ? Positioned.fill(
                                                // top: -2,
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Container(
                                                    height: 4.h,
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 5.w),
                                                    decoration: BoxDecoration(
                                                      color: Helper.primary,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              bottomLeft: Radius
                                                                  .circular(
                                                                      4.r),
                                                              bottomRight:
                                                                  Radius
                                                                      .circular(
                                                                          4.r)),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ]),
                                    ),
                                  );
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
              loading: () => LoadingCamDetails(
                showCalendarList: true,
                topPadding: 72.h,
              ),
            );
          }),
        ),
      ),
      bottomNavigationBar: showBottomBar
          ? Container(
              // padding: EdgeInsets.only(bottom: Platform.isIOS ? 70.h : 0.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                border: Border(
                  top: BorderSide(
                      color: Colors.white.withOpacity(0.2), width: 0.5),
                ),
              ),
              // height: Platform.isIOS ? 50.h : 50.h,
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
                          "cameraId": widget.cameraId
                        });
                      },
                      child: IconBottomBar(
                        icon: 'assets/images/file-download.svg',
                        selected: true,
                        text: 'Report',
                      ),
                    )
                  ]),
            )
          : SizedBox(),
    );
  }

  _showCameraBottomSheet(context) {
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
        height: 620.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(children: [
                  Text(
                    'Camera name',
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '25℃ Sunny, Hyderabad, India',
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Color.fromRGBO(127, 127, 127, 0.5),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    '10-07-2023, 12:30 PM',
                    style: TextStyle(
                        letterSpacing: -0.3,
                        color: Color.fromRGBO(127, 127, 127, 0.5),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ])
              ],
            ),
            SizedBox(height: 24.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () async {
                    // setState(() {
                    //   _images = "1";
                    //   _showImages = "1 Image";
                    // });
                    context.pop();
                  },
                  child: Container(
                    height: 44.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Helper.bottomIconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset('assets/images/download.svg',
                              // width: 44.w,
                              // height: 44.h,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Helper.primary, BlendMode.srcIn))),
                      title: Text(
                        'Download',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () async {
                    // setState(() {
                    //   _images = "1";
                    //   _showImages = "1 Image";
                    // });
                    context.pop();
                  },
                  child: Container(
                    height: 44.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Helper.bottomIconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset('assets/images/share.svg',
                              // width: 44.w,
                              // height: 44.h,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Helper.primary, BlendMode.srcIn))),
                      title: Text(
                        'Share',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () async {
                    // setState(() {
                    //   _images = "1";
                    //   _showImages = "1 Image";
                    // });
                    context.pop();
                  },
                  child: Container(
                    height: 44.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Helper.bottomIconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset('assets/images/message.svg',
                              // width: 44.w,
                              // height: 44.h,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Helper.primary, BlendMode.srcIn))),
                      title: Text(
                        'Comment',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () async {
                    // setState(() {
                    //   _images = "1";
                    //   _showImages = "1 Image";
                    // });
                    context.pop();
                  },
                  child: Container(
                    height: 44.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Helper.bottomIconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset('assets/images/ai.svg',
                              width: 24.w,
                              height: 24.h,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Helper.primary, BlendMode.srcIn))),
                      title: Text(
                        'AI Insights',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () async {
                    // setState(() {
                    //   _images = "1";
                    //   _showImages = "1 Image";
                    // });
                    context.pop();
                  },
                  child: Container(
                    height: 44.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Helper.bottomIconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset('assets/images/camera.svg',
                              // width: 44.w,
                              // height: 44.h,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Helper.primary, BlendMode.srcIn))),
                      title: Text(
                        'Image quality',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
                InkWell(
                  onTap: () async {
                    // setState(() {
                    //   _images = "1";
                    //   _showImages = "1 Image";
                    // });
                    context.pop();
                  },
                  child: Container(
                    height: 44.h,
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: Container(
                          decoration: BoxDecoration(
                            color: Helper.bottomIconBack,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          padding: EdgeInsets.all(8.w),
                          child: SvgPicture.asset(
                              'assets/images/camera-flash.svg',
                              // width: 44.w,
                              // height: 44.h,
                              fit: BoxFit.cover,
                              colorFilter: ColorFilter.mode(
                                  Helper.primary, BlendMode.srcIn))),
                      title: Text(
                        'Default view',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24.h),
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

  _showDateBottomSheet(
      context,
      String startDate,
      String endDate,
      String selectedDate,
      String cameraId,
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
                    selectedDayHighlightColor: Helper.primary,
                  ),
                  value: [],
                  onValueChanged: (value) {
                    print(value.toString());
                    DateTime date = DateTime.parse(value[0].toString());
                    selectedDate = DateFormat("yyyyMMdd").format(date);
                    print("selectedDate " + selectedDate);
                    currentMonth = value[0]!;
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
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.primary),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )),
                    onPressed: () {
                      print(selectedDate);
                      //         ref
                      // .read(imagesByCamIdControllerProvider.notifier)
                      // .getIagesByCamId(projectId, cameraId, searchDate: selectedDate );
                      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                        ref
                            .read(imagesByCamIdControllerProvider.notifier)
                            .getImagesByCamId(projectId, cameraId,
                                searchDate: selectedDate);
                      });

                      context.pop();
                      setState(() {
                        getDaysInMonth(currentMonth, false);
                        showDate(endDate);
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
