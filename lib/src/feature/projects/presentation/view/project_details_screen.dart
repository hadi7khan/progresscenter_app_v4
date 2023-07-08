import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_by_id_controller.dart';

class ProjectDetailsScreen extends ConsumerStatefulWidget {
  final String label;
  final String projectId;
  final String projectName;
  const ProjectDetailsScreen({
    super.key,
    required this.label,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<ProjectDetailsScreen> createState() =>
      _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState
    extends BaseConsumerState<ProjectDetailsScreen> {
  int? _currentIndex;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(projectByIdControllerProvider.notifier)
          .getProjectById(widget.projectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final projectByIdData = ref.watch(
        projectByIdControllerProvider.select((value) => value.projectDetails));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: projectByIdData.when(
              data: (data) {
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
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
                        ],
                      ),
                      SizedBox(height: 24.h),
                      Stack(
                          fit: StackFit.loose,
                          alignment: Alignment.bottomCenter,
                          children: [
                            CarouselSlider.builder(
                              itemCount: data.images!.length,
                              options: CarouselOptions(
                                  height: 284.h,
                                  viewportFraction: 1,
                                  initialPage: 0,
                                  autoPlay: false,
                                  enlargeCenterPage: true,
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex = index;
                                    });
                                  }),
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.only(bottom: 15.h),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(16.r),
                                        color: Color.fromRGBO(235, 235, 235, 1),
                                      ),
                                      child:
                                          // data[index].images!.isNotEmpty
                                          //     ?
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.r),
                                              child: Image.network(
                                                data.images![itemIndex].url!,
                                                fit: BoxFit.cover,
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
                                              ))
                                      // : SizedBox(),
                                      ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: BlurryContainer(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6.h, horizontal: 8.w),
                                  blur: 3,
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: Colors.white.withOpacity(0.1),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset('assets/images/ai.svg'),
                                      SizedBox(width: 4.w),
                                      Text("AI enhanced",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12.sp)),
                                    ],
                                  )),
                            ),
                            // data[index].images!.isNotEmpty
                            //     ?
                            Positioned(
                              top: 168.h,
                              child: Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: DotsIndicator(
                                    dotsCount: data.images!.length,
                                    position: _currentIndex != null
                                        ? _currentIndex!
                                        : 0,
                                    decorator: DotsDecorator(
                                        color: Colors.white.withOpacity(0.6),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6.r)),
                                        activeColor: Colors.white,
                                        activeShape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.r)),
                                        size: Size(6, 6),
                                        activeSize: Size(8, 8),
                                        spacing: EdgeInsets.only(right: 6.w)),
                                  )),
                            ),
                            // : SizedBox(),
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
                                        color:
                                            Color.fromRGBO(246, 246, 246, 1)),
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
                                              data.name!,
                                              style: TextStyle(
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500,
                                                color: Helper.baseBlack,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 6.h,
                                            // ),
                                            Text(
                                              data.location!.name!,
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: Helper.baseBlack
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              // context.push(widget.detailsPath, extra: {"projectId": "projectId", "projectName": data[index].name!});
                                            },
                                            style: ButtonStyle(
                                                shape:
                                                    MaterialStateProperty.all(
                                                        RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                )),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white)),
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                  color: Helper.baseBlack,
                                                  fontSize: 14.sp,
                                                  letterSpacing: 0,
                                                  wordSpacing: 0,
                                                  fontWeight: FontWeight.w600),
                                            ))
                                      ],
                                    )),
                              ),
                            ),
                          ]),
                      SizedBox(height: 12.h),
                      SizedBox(
                        height: 58.h,
                        child: ListView.separated(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.all(8.w),
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      246,
                                      246,
                                      246,
                                      1,
                                    ),
                                    borderRadius: BorderRadius.circular(12.r)),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5.w),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      child: SvgPicture.asset(
                                          'assets/images/updated.svg'),
                                    ),
                                    SizedBox(
                                      width: 8.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Updated",
                                          style: TextStyle(
                                              color: Helper.baseBlack
                                                  .withOpacity(0.5),
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Text("9:00 AM · 12 Nov 2023",
                                            style: TextStyle(
                                                color: Helper.baseBlack,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500))
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(width: 12.w);
                            },
                            itemCount: 3),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 5.h),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(
                              246,
                              246,
                              246,
                              1,
                            ),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: ListView.separated(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: data.assets!.length,
                            separatorBuilder: (cont, index) {
                              return Divider(
                                thickness: 1,
                                color: Helper.baseBlack.withOpacity(0.04),
                              );
                            },
                            itemBuilder: (cont, index) {
                              return buildAsset(
                                  context,
                                  index,
                                  AssetType.values
                                      .byName(data.assets![index].name!),
                                  data.assets![index].count, widget.projectId, widget.projectName);
                            }),
                      ),
                    ]);
              },
              error: (err, _) {
                return const Text("Failed to load Project details",
                    style: TextStyle(color: Helper.errorColor));
              },
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

enum AssetType {
  TIMELAPSE("TIMELAPSE", 0),
  DRONE_FOOTAGE("DRONE_FOOTAGE", 1),
  CAMERA_CCTV("CAMERA_CCTV", 2),
  CAMERA_360("CAMERA_360", 3),
  SITE_GALLERY("SITE_GALLERY", 4),
  EQUIPMENT_TRACKERS("EQUIPMENT_TRACKERS", 5),
  ;

  final String value;
  final int indx;

  const AssetType(this.value, this.indx);
}

List assetItems = AssetType.values.map((assetType) {
  return Text(assetTypeToString(assetType));
}).toList();

Widget buildAsset(BuildContext context, index, assetName, count, projectId, projectName) {
  print(assetName);
  switch (assetName) {
    case AssetType.TIMELAPSE:
      return ListTile(
          onTap: () {
            context.push('/timelapse', extra: {"projectId": projectId, "projectName": projectName});
          },
          dense: true,
          minVerticalPadding: 0,
          // visualDensity: VisualDensity(vertical: ,),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset('assets/images/timelapse.svg'),
          ),
          title: Text(
            assetTypeToString(assetName),
            style: TextStyle(
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " Cameras active",
              style: TextStyle(
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.DRONE_FOOTAGE:
      return ListTile(
          onTap: () {
            context.push('/dronefootage', extra: {"projectId": projectId, "projectName": projectName});
          },
          dense: true,
          minVerticalPadding: 0,
          // visualDensity: VisualDensity(vertical: -2,),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset('assets/images/drone_footage.svg'),
          ),
          title: Text(
            assetTypeToString(assetName),
            style: TextStyle(
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " Footages",
              style: TextStyle(
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.CAMERA_CCTV:
      return ListTile(
          onTap: () {
            context.push('/cctv', extra: {"projectId": projectId, "projectName": projectName});
          },
          dense: true,
          minVerticalPadding: 0,
          // visualDensity: VisualDensity(vertical: -2,),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset('assets/images/cctv.svg'),
          ),
          title: Text(
            assetTypeToString(assetName),
            style: TextStyle(
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " Cameras active",
              style: TextStyle(
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.CAMERA_360:
      return ListTile(
          onTap: () {
            context.push('/camera360', extra: {"projectId": projectId, "projectName": projectName});
          },
          dense: true,
          minVerticalPadding: 0,
          // visualDensity: VisualDensity(vertical: -2,),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset('assets/images/camera_360.svg'),
          ),
          title: Text(
            assetTypeToString(assetName),
            style: TextStyle(
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " photos · 2 videos",
              style: TextStyle(
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.SITE_GALLERY:
      return ListTile(
          onTap: () {
            context.push('/sitegallery', extra: {"projectId": projectId, "projectName": projectName});
          },
          dense: true,
          minVerticalPadding: 0,
          // visualDensity: VisualDensity(vertical: -2,),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset('assets/images/camera_360.svg'),
          ),
          title: Text(
            assetTypeToString(assetName),
            style: TextStyle(
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " photos · 2 videos",
              style: TextStyle(
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.EQUIPMENT_TRACKERS:
      return ListTile(
          onTap: () {
            context.push('/camera360', extra: {"projectId": projectId, "projectName": projectName});
          },
          dense: true,
          minVerticalPadding: 0,
          // visualDensity: VisualDensity(vertical: -2,),
          contentPadding: EdgeInsets.zero,
          leading: Container(
            padding: EdgeInsets.all(10.w),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12.r)),
            child: SvgPicture.asset('assets/images/drone_footage.svg'),
          ),
          title: Text(
            assetTypeToString(assetName),
            style: TextStyle(
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " photos · 2 videos",
              style: TextStyle(
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    default:
      return Text("none");
  }
}

String assetTypeToString(AssetType assetType) {
  switch (assetType) {
    case AssetType.TIMELAPSE:
      return 'TimeLapse';
    case AssetType.DRONE_FOOTAGE:
      return 'Drone Footage';
    case AssetType.CAMERA_CCTV:
      return 'Cctv View';
    case AssetType.CAMERA_360:
      return '360° Cameras';
    case AssetType.SITE_GALLERY:
      return 'Site Gallery';
    case AssetType.EQUIPMENT_TRACKERS:
      return 'Equipment trackers';
    default:
      return '';
  }
}
