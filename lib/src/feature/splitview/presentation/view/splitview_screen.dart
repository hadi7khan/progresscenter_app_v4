import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:image_compare_slider/image_compare_slider.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/provider/selected_imagedata_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view1_controller.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view1_provider.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_controller.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/provider/split_view2_provider.dart';

class SplitviewScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  final String cameraId;
  const SplitviewScreen({
    super.key,
    required this.projectId,
    required this.projectName,
    required this.cameraId,
  });

  @override
  ConsumerState<SplitviewScreen> createState() => _SplitviewScreenState();
}

class _SplitviewScreenState extends BaseConsumerState<SplitviewScreen> {
  String _searchDate1 = '';
  String _searchDate2 = '';
  String _selectedDate1 = '';
  String _selectedDate2 = '';
  int _selectedImageIndex1 = 0;
  int _selectedImageIndex2 = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splitView1ControllerProvider.notifier).getImagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate1);
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(splitView2ControllerProvider.notifier).getImagesByCamId(
          widget.projectId, widget.cameraId,
          searchDate: _searchDate1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final splitViewData1 = ref.watch(
        splitView1ControllerProvider.select((value) => value.imagesByCamId));
    final selectedSplitViewData1 = ref.watch(splitView1DataProvider);
    final splitViewData2 = ref.watch(
        splitView2ControllerProvider.select((value) => value.imagesByCamId));
    final selectedSplitViewData2 = ref.watch(splitView2DataProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.only(right: 16.w, left: 16.w),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            // titleSpacing: 12.0.w,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                'assets/images/arrow-left.svg',
              ),
            ),
            leadingWidth: 24,
            title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Split View",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "17 Jul 2019 - 18 Aug 2019 ",
                        style: TextStyle(
                            color: Helper.baseBlack.withOpacity(0.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      SvgPicture.asset('assets/images/chevron-down.svg'),
                    ],
                  )
                ]),

            actions: [
              SvgPicture.asset('assets/images/dots-vertical.svg'),
            ],

            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: splitViewData2.when(
            data: (data2) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 150.h),
                child: splitViewData1.when(
                  data: (data1) {
                    return Column(
                      children: [
                        ImageCompareSlider(
                          dividerColor: Helper.primary,
                          handlePosition: 0.96,
                          fillHandle: true,
                          itemOne: Image.network(
                            selectedSplitViewData1 == null
                                ? data1.images![0].urlPreview!
                                : selectedSplitViewData1.urlPreview!,
                            width: double.infinity,
                            // height: 210.h,
                            fit: BoxFit.fill,
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;

                              return CircularProgressIndicator(
                                color: Helper.primary,
                                value: (loadingProgress != null)
                                    ? (loadingProgress.cumulativeBytesLoaded /
                                        loadingProgress.expectedTotalBytes!)
                                    : 0,
                              );
                            },
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return ClipRRect(
                                child: Image.asset(
                                  'assets/images/error_image.jpeg',
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                          itemTwo: Image.network(
                            selectedSplitViewData2 == null
                                ? data2.images![0].urlPreview!
                                : selectedSplitViewData2.urlPreview!,
                            width: double.infinity,
                            // height: 210.h,
                            fit: BoxFit.fill,
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
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 6.h),
                        SizedBox(
                          height: 73.h,
                          child: ListView.separated(
                              separatorBuilder: (context, builder) {
                                return SizedBox(
                                  width: 2.w,
                                );
                              },
                              itemCount: data1.images!.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                String formattedTime = DateFormat("hh:mm a")
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(
                                            data1.images![index].datetime!)))
                                    .toString();
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex1 = index;
                                    });
                                    final imageData = ImageData(
                                      name: data1.images![index].name,
                                      dateTime: data1.images![index].datetime,
                                      camera: data1.images![index].camera,
                                      id: data1.images![index].id,
                                      urlPreview:
                                          data1.images![index].urlPreview,
                                    );

                                    ref
                                        .read(splitView1DataProvider.notifier)
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
                                              border: _selectedImageIndex1 ==
                                                      index
                                                  ? Border.all(
                                                      color: Helper.primary,
                                                      width: 2.w,
                                                    )
                                                  : Border.all(
                                                      width: 2.w,
                                                      color:
                                                          Colors.transparent),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              child: Image.network(
                                                data1.images![index].urlThumb!,
                                                width: 44.w,
                                                height: 44.h,
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
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            formattedTime,
                                            style: TextStyle(
                                                color: Helper.textColor700,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ]),
                                  ),
                                );
                              })),
                        ),
                        SizedBox(height: 20.h),
                        // --------------------------------------------------------------------
                        SizedBox(
                          height: 73.h,
                          child: ListView.separated(
                              separatorBuilder: (context, builder) {
                                return SizedBox(
                                  width: 2.w,
                                );
                              },
                              itemCount: data2.images!.length,
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: ((context, index) {
                                String formattedTime = DateFormat("hh:mm a")
                                    .format(DateTime.fromMillisecondsSinceEpoch(
                                        int.parse(
                                            data2.images![index].datetime!)))
                                    .toString();
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedImageIndex2 = index;
                                    });
                                    final imageData = ImageData(
                                      name: data2.images![index].name,
                                      dateTime: data2.images![index].datetime,
                                      camera: data2.images![index].camera,
                                      id: data2.images![index].id,
                                      urlPreview:
                                          data2.images![index].urlPreview,
                                    );

                                    ref
                                        .read(splitView2DataProvider.notifier)
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
                                              border: _selectedImageIndex2 ==
                                                      index
                                                  ? Border.all(
                                                      color: Helper.primary,
                                                      width: 2.w,
                                                    )
                                                  : Border.all(
                                                      width: 2.w,
                                                      color:
                                                          Colors.transparent),
                                            ),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4.r),
                                              child: Image.network(
                                                data2.images![index].urlThumb!,
                                                width: 44.w,
                                                height: 44.h,
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
                                          ),
                                          SizedBox(
                                            height: 6.h,
                                          ),
                                          Text(
                                            formattedTime,
                                            style: TextStyle(
                                                color: Helper.textColor700,
                                                fontSize: 8.sp,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ]),
                                  ),
                                );
                              })),
                        ),
                      ],
                    );
                  },
                  error: (err, _) {
                    return const Text("Failed to fetch images",
                        style: TextStyle(color: Helper.errorColor));
                  },
                  loading: () => Center(child: CircularProgressIndicator()),
                ),
              );
            },
            error: (err, _) {
              return const Text("Failed to fetch images",
                  style: TextStyle(color: Helper.errorColor));
            },
            loading: () => Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
