import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_project_details.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_group.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/viewed_by_widget.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_by_id_controller.dart';

class MyListItem {
  final String svgAsset;
  final String title;
  final String subTitle;

  MyListItem(
      {required this.svgAsset, required this.title, required this.subTitle});
}

class ProjectDetailsScreen extends ConsumerStatefulWidget {
  final String label;
  final String projectId;
  final String projectName;
  final projectImages;
  final projectLocation;
  final projectUsers;
  const ProjectDetailsScreen({
    super.key,
    required this.label,
    required this.projectId,
    required this.projectName,
    required this.projectImages,
    required this.projectLocation,
    required this.projectUsers,
  });

  @override
  ConsumerState<ProjectDetailsScreen> createState() =>
      _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState
    extends BaseConsumerState<ProjectDetailsScreen> {
  int? _currentIndex;
  ProjectModel? projectByIdData;
  bool includeChildren = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.3),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(projectByIdControllerProvider.notifier)
          .getProjectById(widget.projectId, includeChildren);
    });
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black.withOpacity(0.3),
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light));
    super.dispose();
  }

  showDateTimeString(date, dateFormat) {
    // Format the DateTime object into the desired format
    String formattedDate = DateFormat(dateFormat).format(date);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final projectByIdData = ref.watch(
        projectByIdControllerProvider.select((value) => value.projectDetails));
    return Scaffold(
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          displacement: 10.0,
          color: ref.watch(primaryColorProvider),
          onRefresh: () async {
            HapticFeedback.mediumImpact();
            HapticFeedback.mediumImpact();
            return await ref
                .refresh(projectByIdControllerProvider.notifier)
                .getProjectById(widget.projectId, includeChildren);
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  height: MediaQuery.of(context).size.width * 0.8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.topCenter,
                      children: [
                        CarouselSlider.builder(
                          itemCount: widget.projectImages.length,
                          options: CarouselOptions(
                              viewportFraction: 1,
                              aspectRatio: 1 / 1,
                              initialPage: 0,
                              autoPlay: false,
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
                            decoration: BoxDecoration(
                              // borderRadius: BorderRadius.circular(16.r),
                              color: Color.fromRGBO(235, 235, 235, 1),
                            ),
                            child: widget.projectImages!.isNotEmpty
                                ? CachedNetworkImage(
                                    imageUrl:
                                        widget.projectImages![itemIndex].url!,
                                    fit: BoxFit.fill,
                                    errorWidget: (context, url, error) =>
                                        ClipRRect(
                                      child: Image.asset(
                                        'assets/images/error_image.jpeg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : ClipRRect(
                                    child: Image.asset(
                                      'assets/images/error_image.jpeg',
                                      fit: BoxFit.fill,
                                      height: 264.h,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: 20,
                          child: BlurryContainer(
                            height: 30,
                            padding: EdgeInsets.only(
                                top: 3, bottom: 3, left: 2, right: 3),
                            blur: 3,
                            borderRadius: BorderRadius.circular(30.r),
                            color: Colors.white,
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                context.pop();
                              },
                              child: Transform.rotate(
                                angle: 180 * (3.1415926535 / 180),
                                child: SvgPicture.asset(
                                    'assets/images/chevron-right.svg',
                                    color: Helper.iconColor,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 60,
                          right: 20,
                          child: BlurryContainer(
                            height: 30,
                            padding: EdgeInsets.only(
                                top: 5, bottom: 5, left: 6, right: 5),
                            blur: 3,
                            borderRadius: BorderRadius.circular(30.r),
                            color: Colors.white,
                            child: InkWell(
                              highlightColor: Colors.transparent,
                              onTap: () {
                                context.push('/editproject',
                                    extra: projectByIdData.value);
                              },
                              child: SvgPicture.asset(
                                  'assets/images/8666681_edit_icon.svg',
                                  color: Helper.iconColor,
                                  width: 18,
                                  height: 18),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10.h,
                          child: Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: widget.projectImages!.length > 0
                                  ? DotsIndicator(
                                      dotsCount: widget.projectImages!.length,
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
                                    )
                                  : SizedBox()),
                        ),
                      ]),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: projectByIdData.when(
                      data: (data) {
                        projectByIdData == data;
                        List<MyListItem> myItems = [
                          MyListItem(
                            svgAsset: 'assets/images/updated.svg',
                            title: 'Last updated',
                            subTitle: showDateTimeString(
                                data.updatedAt, 'dd MMM, yy · hh:mm a'),
                          ),
                          MyListItem(
                              svgAsset: 'assets/images/updated.svg',
                              title: 'PPE Score',
                              subTitle: data.aiStats != null
                                  ? data.aiStats!.ppeScore!.toString()
                                  : "N/A"),
                          MyListItem(
                              svgAsset: 'assets/images/updated.svg',
                              title: 'Construction',
                              subTitle:
                                  data.constructionDays.toString() + " days"),
                        ];

                        filteredLinks = [];
                        assetMap = {};
                        for (var asset in data.assets!) {
                          String name = asset.name!;
                          int count = asset.count != null ? asset.count! : 0;
                          assetMap[name] = count;
                        }

                        filteredLinks = links
                            .where((link) =>
                                assetMap.containsKey(link['identifier']))
                            .toList();

                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name!,
                                style: TextStyle(
                                  letterSpacing: -0.3,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Helper.baseBlack,
                                ),
                              ),
                              Text(
                                data.location!.name!,
                                style: TextStyle(
                                  letterSpacing: -0.3,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Helper.baseBlack.withOpacity(0.5),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              InkWell(
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  showModalBottomSheet(
                                      useRootNavigator: true,
                                      isScrollControlled: true,
                                      context: context,
                                      backgroundColor: Colors.transparent,
                                      builder: (context) => Padding(
                                            padding: EdgeInsets.only(
                                                    bottom:
                                                        MediaQuery.of(context)
                                                            .viewInsets
                                                            .bottom) *
                                                0.6,
                                            child: ViewedByWidget(
                                              data: data.users,
                                              showText: "Current members",
                                              projectId: widget.projectId,
                                              showExtra: true,
                                            ),
                                          ));
                                },
                                child: Container(
                                  height: 45,
                                  child: AvatarGroupWidget(
                                    avatars:
                                        (data.users as List<User>).map((user) {
                                      return {
                                        'dpUrl':
                                            user.dp != null ? user.dpUrl : "",
                                        'name': user.name,
                                        'backgroundColor': user.preset!.color,
                                      };
                                    }).toList(),
                                    size: 40.h,
                                    max: 3,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              SizedBox(
                                height: 58.h,
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  itemCount: myItems.length,
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
                                          borderRadius:
                                              BorderRadius.circular(12.r)),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(5.w),
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        12.r)),
                                            child: SvgPicture.asset(
                                                myItems[index].svgAsset),
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                myItems[index].title,
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.baseBlack
                                                        .withOpacity(0.5),
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(myItems[index].subTitle,
                                                  style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      color: Helper.baseBlack,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500))
                                            ],
                                          )
                                        ],
                                      ),
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return SizedBox(width: 12.w);
                                  },
                                ),
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
                                child: Column(children: [
                                  ...filteredLinks.map((e) {
                                    return Column(
                                      children: [
                                        ListTile(
                                            onTap: () {
                                              context.push(e['to'], extra: {
                                                "projectId": widget.projectId,
                                                "projectName":
                                                    widget.projectName
                                              });
                                            },
                                            dense: true,
                                            minVerticalPadding: 0,
                                            // visualDensity: VisualDensity(vertical: ,),
                                            contentPadding: EdgeInsets.zero,
                                            leading: Container(
                                              padding: EdgeInsets.all(10.w),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.r)),
                                              child:
                                                  SvgPicture.asset(e['icon']),
                                            ),
                                            title: Text(
                                              e['content'],
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.baseBlack,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            subtitle: Text(
                                                assetMap[e['identifier']]
                                                        .toString() +
                                                    " " +
                                                    e['countText'],
                                                style: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.baseBlack
                                                        .withOpacity(0.5),
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w400)),
                                            trailing: Icon(
                                                Icons.arrow_forward_ios,
                                                color: Helper.textColor400)),
                                        Divider(
                                          thickness: 1,
                                          color: Helper.baseBlack
                                              .withOpacity(0.04),
                                        )
                                      ],
                                    );
                                  }).toList(),
                                ]),
                              ),
                            ]);
                      },
                      error: (err, _) {
                        return const Text("Failed to load Project details",
                            style: TextStyle(
                                letterSpacing: -0.3, color: Helper.errorColor));
                      },
                      loading: () => LoadingProjectDetails()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Map<String, int> assetMap = {};
List filteredLinks = [];

List links = [
  {
    'content': 'TimeLapse',
    'to': '/camera',
    'identifier': AssetType.TIMELAPSE.name,
    'icon': 'assets/images/timelapse.svg',
    'countText': 'Cameras active'
  },
  {
    'content': 'Drone Footage',
    'to': '/dronefootage',
    'identifier': AssetType.DRONE_FOOTAGE.name,
    'icon': 'assets/images/drone_footage.svg',
    'countText': 'Footages'
  },
  {
    'content': 'Live Cameras',
    'to': '/cctv',
    'identifier': AssetType.CAMERA_CCTV.name,
    'icon': 'assets/images/cctv.svg',
    'countText': 'Cameras active'
  },
  {
    'content': '360° Cameras',
    'to': '/camera360',
    'identifier': AssetType.CAMERA_360.name,
    'icon': 'assets/images/camera_360.svg',
    'countText': 'Captures'
  },
  {
    'content': 'Site Gallery',
    'to': '/sitegallery',
    'identifier': AssetType.SITE_GALLERY.name,
    'icon': 'assets/images/camera_360.svg',
    'countText': 'Files'
  },
  {
    'content': 'Equipment Trackers',
    'to': '/equipmentTracker',
    'identifier': AssetType.EQUIPMENT_TRACKERS.name,
    'icon': 'assets/images/drone_footage.svg',
    'countText': 'Equipments'
  },
];

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

Widget buildAsset(
    BuildContext context, index, assetName, count, projectId, projectName) {
  switch (assetName) {
    case AssetType.TIMELAPSE:
      return ListTile(
          onTap: () {
            context.push('/timelapse',
                extra: {"projectId": projectId, "projectName": projectName});
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
                letterSpacing: -0.3,
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " Cameras active",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.DRONE_FOOTAGE:
      return ListTile(
          onTap: () {
            context.push('/dronefootage',
                extra: {"projectId": projectId, "projectName": projectName});
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
                letterSpacing: -0.3,
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " Footages",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.CAMERA_CCTV:
      return ListTile(
          onTap: () {
            context.push('/cctv',
                extra: {"projectId": projectId, "projectName": projectName});
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
                letterSpacing: -0.3,
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " Cameras active",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.CAMERA_360:
      return ListTile(
          onTap: () {
            context.push('/camera360',
                extra: {"projectId": projectId, "projectName": projectName});
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
                letterSpacing: -0.3,
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " photos · 2 videos",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.SITE_GALLERY:
      return ListTile(
          onTap: () {
            context.push('/sitegallery',
                extra: {"projectId": projectId, "projectName": projectName});
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
                letterSpacing: -0.3,
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " files",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack.withOpacity(0.5),
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400)),
          trailing: Icon(Icons.arrow_forward_ios, color: Helper.textColor400));
    case AssetType.EQUIPMENT_TRACKERS:
      return ListTile(
          onTap: () {
            context.push('/equipmentTracker',
                extra: {"projectId": projectId, "projectName": projectName});
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
                letterSpacing: -0.3,
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(count.toString() + " photos · 2 videos",
              style: TextStyle(
                  letterSpacing: -0.3,
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
      return 'Live Cameras';
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
