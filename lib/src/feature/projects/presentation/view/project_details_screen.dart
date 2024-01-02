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
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_group.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/viewed_by_widget.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_by_id_model.dart'
    as model;
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
  model.ProjectByIdModel? projectByIdData;

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
          .getProjectById(widget.projectId);
    });
  }

  @override
  void dispose() {
    //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarIconBrightness: Brightness.dark,
    //       statusBarBrightness: Brightness.dark,
    //       systemNavigationBarColor: Colors.black,
    //       statusBarColor: Colors.black.withOpacity(0.2)
    // ));
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
    print("users passed" + widget.projectUsers.toString());
    final projectByIdData = ref.watch(
        projectByIdControllerProvider.select((value) => value.projectDetails));
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(60.h),
      //   child: Container(
      //     color: Colors.white,
      //     child: Padding(
      //       padding: EdgeInsets.only(right: 16.w, left: 16.w),
      //       child: AppBar(
      //         backgroundColor: Colors.white,
      //         surfaceTintColor: Colors.white,
      //         automaticallyImplyLeading: false,
      //         titleSpacing: 12.0.w,
      //         leading: InkWell(
      //   onTap: () {
      //     context.pop();
      //   },
      //   child: Transform.rotate(
      //     angle: 180 * (3.1415926535 / 180),
      //     child: SvgPicture.asset('assets/images/chevron-right.svg',
      //         color: Helper.iconColor, fit: BoxFit.contain),
      //   ),
      // ),
      //         leadingWidth: 24,
      //         title: Text(
      //           widget.projectName,
      //           style: TextStyle(
      //               color: Helper.baseBlack,
      //               fontSize: 18.sp,
      //               fontWeight: FontWeight.w500),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: SafeArea(
        top: false,
        // maintainBottomViewPadding: true,
        child: RefreshIndicator(
          color: Helper.primary,
          onRefresh: () async {
            HapticFeedback.mediumImpact();
            return await ref
                .refresh(projectByIdControllerProvider.notifier)
                .getProjectById(widget.projectId);
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
                    // borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Stack(
                      fit: StackFit.expand,
                      alignment: Alignment.topCenter,
                      children: [
                        CarouselSlider.builder(
                          itemCount: widget.projectImages.length,
                          options: CarouselOptions(
                              // height: 284.h,
                              viewportFraction: 1,
                              aspectRatio: 1 / 1,
                              initialPage: 0,
                              autoPlay: false,
                              // enlargeCenterPage: true,
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
                                    // memCacheHeight: height.toInt(), memCacheWidth: width.toInt()
                                    fit: BoxFit.fill,
                                    // placeholder: (context, url) =>
                                    //     CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        ClipRRect(
                                      child: Image.asset(
                                        'assets/images/error_image.jpeg',
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                //  ClipRRect(
                                //     // borderRadius: BorderRadius.circular(16.r),
                                //     child: Image.network(
                                //     widget.projectImages![itemIndex].url!,
                                //     fit: BoxFit.fill,
                                //     errorBuilder: (BuildContext context,
                                //         Object exception,
                                //         StackTrace? stackTrace) {
                                //       return ClipRRect(
                                //         child: Image.asset(
                                //           'assets/images/error_image.jpeg',
                                //           fit: BoxFit.fill,
                                //         ),
                                //       );
                                //     },
                                //   ))
                                : ClipRRect(
                                    // borderRadius: BorderRadius.circular(16.r),
                                    child: Image.asset(
                                      'assets/images/error_image.jpeg',
                                      fit: BoxFit.fill,
                                      height: 264.h,
                                    ),
                                  ),
                          ),
                        ),

                        // Positioned(
                        //   top: 0,
                        //   left: 0,
                        //   right: 0,
                        //   height: MediaQuery.of(context).padding.top,
                        //   child: Container(
                        //     color: Colors.black
                        //         .withOpacity(0.3), // Adjust opacity as needed
                        //   ),
                        // ),
                        Positioned(
                          top: 60,
                          left: 20,
                          child: BlurryContainer(
                            height: 30,
                            padding: EdgeInsets.only(
                                top: 3.h, bottom: 3.h, left: 2.w, right: 3.w),
                            blur: 3,
                            borderRadius: BorderRadius.circular(30.r),
                            color: Colors.white,
                            child: InkWell(
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
                        // Positioned(
                        //   top: 60,
                        //   right: 60,
                        //   child: InkWell(
                        //     onTap: () {
                        //       showModalBottomSheet(
                        //           useRootNavigator: true,
                        //           isScrollControlled: true,
                        //           context: context,
                        //           backgroundColor: Colors.transparent,
                        //           builder: (context) => ViewedByWidget(
                        //               data: widget.projectUsers,
                        //               showText: "Current members"));
                        //     },
                        //     child: Container(
                        //       // width: 150,
                        //       height: 35,
                        //       padding: EdgeInsets.symmetric(horizontal: 4.w),
                        //       // blur: 3,
                        //       // borderRadius: BorderRadius.circular(30.r),
                        //       // color: Colors.transparent,
                        //       child: AvatarGroupWidget(
                        //         avatars: (widget.projectUsers as List<User>)
                        //             .map((user) {
                        //           return {
                        //             'dpUrl': user.dp != null ? user.dpUrl : "",
                        //             'name': user.name,
                        //             'backgroundColor': user.preset!.color,
                        //           };
                        //         }).toList(),
                        //         size: 30.h,
                        //         max: 3,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        // data[index].images!.isNotEmpty
                        //     ?
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
                        // : SizedBox(),
                      ]),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.projectName,
                        style: TextStyle(
                          letterSpacing: -0.3,
                          fontSize: 28.sp,
                          fontWeight: FontWeight.w600,
                          color: Helper.baseBlack,
                        ),
                      ),
                      Text(
                        widget.projectLocation!,
                        style: TextStyle(
                          letterSpacing: -0.3,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: Helper.baseBlack.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: projectByIdData.when(
                    data: (data) {
                      projectByIdData == data;

                      print("project id data passed" +
                          projectByIdData.value.toString());
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
                      print("this is the assetMap before loop" +
                          assetMap.toString());
                      filteredLinks = [];
                      assetMap = {};
                      for (var asset in data.assets!) {
                        String name = asset.name!;
                        int count = asset.count!;
                        assetMap[name] = count;
                      }
                      print("this is the assetMap" + assetMap.toString());
                      print("this is data assests" + data.assets.toString());
                      // for (var link in links) {
                      //   var identifier = link['identifier'];
                      //   var name = link['content'];

                      //   if (assetMap.containsKey(name)) {
                      //     filteredLinks.add(link);
                      //   }
                      // }
                      // List<Map<String, dynamic>> filteredLinks = links.where((row) => assetMap[row['identifier']] != null).toList();
                      filteredLinks = links
                          .where((link) =>
                              assetMap.containsKey(link['identifier']))
                          .toList();

                      // for (var link in links) {
                      //   if (assetMap.containsKey(link['identifier'])) {
                      //     filteredLinks.add(link);
                      //   }
                      // }

                      print("filtered links" + filteredLinks.toString());

                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
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
                                          child: ViewedByWidget(
                                            data: data.users,
                                            showText: "Current members",
                                            projectId: widget.projectId,
                                            showExtra: true,
                                          ),
                                        ));
                              },
                              child: Container(
                                // width: 150,
                                height: 45,
                                // padding: EdgeInsets.symmetric(horizontal: 4.w),
                                // blur: 3,
                                // borderRadius: BorderRadius.circular(30.r),
                                // color: Colors.transparent,
                                child: AvatarGroupWidget(
                                  avatars: (data.users as List<model.User>)
                                      .map((user) {
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
                            // Container(
                            //   margin: EdgeInsets.zero,
                            //   padding: EdgeInsets.zero,
                            //   height: 264.h,
                            //   decoration: BoxDecoration(
                            //     color: Colors.white,
                            //     borderRadius: BorderRadius.circular(16.r),
                            //   ),
                            //   child: Stack(
                            //       fit: StackFit.loose,
                            //       alignment: Alignment.topCenter,
                            //       children: [
                            //         CarouselSlider.builder(
                            //           itemCount: data.images!.length,
                            //           options: CarouselOptions(
                            //               // height: 284.h,
                            //               aspectRatio: 16 / 9,
                            //               viewportFraction: 1,
                            //               initialPage: 0,
                            //               autoPlay: false,
                            //               enlargeCenterPage: true,
                            //               autoPlayCurve: Curves.fastOutSlowIn,
                            //               scrollDirection: Axis.horizontal,
                            //               onPageChanged: (index, reason) {
                            //                 setState(() {
                            //                   _currentIndex = index;
                            //                 });
                            //               }),
                            //           itemBuilder: (BuildContext context,
                            //                   int itemIndex, int pageViewIndex) =>
                            //               Container(
                            //             width: double.infinity,
                            //             decoration: BoxDecoration(
                            //               borderRadius:
                            //                   BorderRadius.circular(16.r),
                            //               color: Color.fromRGBO(235, 235, 235, 1),
                            //             ),
                            //             child: data.images!.isNotEmpty
                            //                 ? ClipRRect(
                            //                     borderRadius:
                            //                         BorderRadius.circular(16.r),
                            //                     child: Image.network(
                            //                       data.images![itemIndex].url!,
                            //                       fit: BoxFit.fill,
                            //                       errorBuilder: (BuildContext
                            //                               context,
                            //                           Object exception,
                            //                           StackTrace? stackTrace) {
                            //                         return ClipRRect(
                            //                           child: Image.asset(
                            //                             'assets/images/error_image.jpeg',
                            //                             fit: BoxFit.fill,
                            //                           ),
                            //                         );
                            //                       },
                            //                     ))
                            //                 : ClipRRect(
                            //                     borderRadius:
                            //                         BorderRadius.circular(16.r),
                            //                     child: Image.asset(
                            //                       'assets/images/error_image.jpeg',
                            //                       fit: BoxFit.fill,
                            //                       height: 264.h,
                            //                     ),
                            //                   ),
                            //           ),
                            //         ),
                            //         Positioned(
                            //           top: 20,
                            //           left: 20,
                            //           child: BlurryContainer(
                            //               padding: EdgeInsets.symmetric(
                            //                   vertical: 6.h, horizontal: 8.w),
                            //               blur: 3,
                            //               borderRadius:
                            //                   BorderRadius.circular(30.r),
                            //               color: Colors.white.withOpacity(0.1),
                            //               child: Row(
                            //                 children: [
                            //                   SvgPicture.asset(
                            //                       'assets/images/ai.svg'),
                            //                   SizedBox(width: 4.w),
                            //                   Text("AI enhanced",
                            //                       style: TextStyle(
                            //                           color: Colors.white,
                            //                           fontWeight: FontWeight.w500,
                            //                           fontSize: 12.sp)),
                            //                 ],
                            //               )),
                            //         ),
                            //         Positioned(
                            //           top: 20,
                            //           right: 20,
                            //           child: InkWell(
                            //             onTap: () {
                            //               showModalBottomSheet(
                            //                   useRootNavigator: true,
                            //                   isScrollControlled: true,
                            //                   context: context,
                            //                   backgroundColor: Colors.transparent,
                            //                   builder: (context) =>
                            //                       ViewedByWidget(
                            //                           data: data.users,
                            //                           showText:
                            //                               "Current members"));
                            //             },
                            //             child: BlurryContainer(
                            //               // width: 150,
                            //               height: 30,
                            //               padding: EdgeInsets.symmetric(
                            //                   vertical: 4.h, horizontal: 4.w),
                            //               blur: 3,
                            //               borderRadius:
                            //                   BorderRadius.circular(30.r),
                            //               color: Colors.white.withOpacity(0.3),
                            //               child: AvatarGroupWidget(
                            //                 avatars: data.users!.map((user) {
                            //                   return {
                            //                     'dpUrl': user.dp != null
                            //                         ? user.dpUrl
                            //                         : "",
                            //                     'name': user.name,
                            //                     'backgroundColor':
                            //                         user.preset!.color,
                            //                   };
                            //                 }).toList(),
                            //                 size: 22.h,
                            //                 max: 3,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //         // data[index].images!.isNotEmpty
                            //         //     ?
                            //         Positioned(
                            //           top: 150.h,
                            //           child: Padding(
                            //               padding:
                            //                   const EdgeInsets.only(bottom: 12),
                            //               child: data.images!.length > 0
                            //                   ? DotsIndicator(
                            //                       dotsCount: data.images!.length,
                            //                       position: _currentIndex != null
                            //                           ? _currentIndex!
                            //                           : 0,
                            //                       decorator: DotsDecorator(
                            //                           color: Colors.white
                            //                               .withOpacity(0.6),
                            //                           shape:
                            //                               RoundedRectangleBorder(
                            //                                   borderRadius:
                            //                                       BorderRadius
                            //                                           .circular(
                            //                                               6.r)),
                            //                           activeColor: Colors.white,
                            //                           activeShape:
                            //                               RoundedRectangleBorder(
                            //                                   borderRadius:
                            //                                       BorderRadius
                            //                                           .circular(
                            //                                               8.r)),
                            //                           size: Size(6, 6),
                            //                           activeSize: Size(8, 8),
                            //                           spacing: EdgeInsets.only(
                            //                               right: 6.w)),
                            //                     )
                            //                   : SizedBox()),
                            //         ),
                            //         // : SizedBox(),
                            //         Positioned.fill(
                            //           bottom: 7,
                            //           // left: 20,
                            //           child: Align(
                            //             alignment: Alignment.bottomCenter,
                            //             child: Container(
                            //                 height: 88.h,
                            //                 width: double.infinity,
                            //                 margin: EdgeInsets.zero,
                            //                 padding: EdgeInsets.all(20.w),
                            //                 decoration: BoxDecoration(
                            //                     borderRadius:
                            //                         BorderRadius.circular(15.r),
                            //                     color: Color.fromRGBO(
                            //                         246, 246, 246, 1)),
                            //                 child: Row(
                            //                   mainAxisAlignment:
                            //                       MainAxisAlignment.spaceBetween,
                            //                   mainAxisSize: MainAxisSize.min,
                            //                   children: [
                            //                     Column(
                            //                       crossAxisAlignment:
                            //                           CrossAxisAlignment.start,
                            //                       children: [
                            //                         Text(
                            //                           data.name!,
                            //                           style: TextStyle(
                            //                             fontSize: 18.sp,
                            //                             fontWeight:
                            //                                 FontWeight.w500,
                            //                             color: Helper.baseBlack,
                            //                           ),
                            //                         ),
                            //                         // SizedBox(
                            //                         //   height: 6.h,
                            //                         // ),
                            //                         Text(
                            //                           data.location!.name!,
                            //                           style: TextStyle(
                            //                             fontSize: 14.sp,
                            //                             fontWeight:
                            //                                 FontWeight.w400,
                            //                             color: Helper.baseBlack
                            //                                 .withOpacity(0.5),
                            //                           ),
                            //                         ),
                            //                       ],
                            //                     ),
                            //                     TextButton(
                            //                         onPressed: () {
                            //                           context.push('/editproject',
                            //                               extra: data);
                            //                         },
                            //                         style: ButtonStyle(
                            //                             shape: MaterialStateProperty
                            //                                 .all(
                            //                                     RoundedRectangleBorder(
                            //                               borderRadius:
                            //                                   BorderRadius
                            //                                       .circular(8.r),
                            //                             )),
                            //                             backgroundColor:
                            //                                 MaterialStateProperty
                            //                                     .all(Colors
                            //                                         .white)),
                            //                         child: Text(
                            //                           "Edit",
                            //                           style: TextStyle(
                            //                               color: Helper.baseBlack,
                            //                               fontSize: 14.sp,
                            //                               letterSpacing: 0,
                            //                               wordSpacing: 0,
                            //                               fontWeight:
                            //                                   FontWeight.w600),
                            //                         ))
                            //                   ],
                            //                 )),
                            //           ),
                            //         ),
                            //       ]),
                            // ),
                            // SizedBox(height: 12.h),
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
                                                  BorderRadius.circular(12.r)),
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
                                                  fontWeight: FontWeight.w400),
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
                                              "projectName": widget.projectName
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
                                            child: SvgPicture.asset(e['icon']),
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
                                                  fontWeight: FontWeight.w400)),
                                          trailing: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Helper.textColor400)),
                                      Divider(
                                        thickness: 1,
                                        color:
                                            Helper.baseBlack.withOpacity(0.04),
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
                    loading: () => SingleChildScrollView(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 44.h),
                            Container(
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
                                    Positioned.fill(
                                      // top: 0,
                                      // left: 0,
                                      child: Align(
                                        alignment: Alignment.topCenter,
                                        child: CarouselSlider.builder(
                                          itemCount: 1,
                                          options: CarouselOptions(
                                              // height: 198.h,
                                              viewportFraction: 1,
                                              aspectRatio: 16 / 9,
                                              initialPage: 0,
                                              autoPlay: false,
                                              enlargeCenterPage: true,
                                              autoPlayCurve:
                                                  Curves.fastOutSlowIn,
                                              scrollDirection: Axis.horizontal,
                                              onPageChanged: (index, reason) {
                                                setState(() {
                                                  _currentIndex = index;
                                                });
                                              }),
                                          itemBuilder: (BuildContext context,
                                                  int itemIndex,
                                                  int pageViewIndex) =>
                                              Container(
                                                  width: double.infinity,
                                                  margin: EdgeInsets.zero,
                                                  padding: EdgeInsets.zero,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.r),
                                                    color: Color.fromRGBO(
                                                        235, 235, 235, 1),
                                                  ),
                                                  child: Skeleton(
                                                    variant: "rectangular",
                                                    borderRadius: 16.r,
                                                  )),
                                        ),
                                      ),
                                    ),
                                    Positioned.fill(
                                      bottom: 7,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Skeleton(
                                                        variant: 'text',
                                                        width: 80.w,
                                                        height: 15.h,
                                                        borderRadius: 8.r),
                                                    SizedBox(
                                                      height: 6.h,
                                                    ),
                                                    Skeleton(
                                                      variant: 'text',
                                                      width: 60.w,
                                                      height: 10.h,
                                                      borderRadius: 8.r,
                                                    ),
                                                  ],
                                                ),
                                                Skeleton(
                                                  variant: 'rectangular',
                                                  borderRadius: 8.r,
                                                  width: 50.w,
                                                  height: 30.h,
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                  ]),
                            ),
                            // SizedBox(height: 12.h),
                            // SizedBox(
                            //   height: 58.h,
                            //   child: ListView.separated(
                            //       shrinkWrap: true,
                            //       scrollDirection: Axis.horizontal,
                            //       itemBuilder: (context, index) {
                            //         return Container(
                            //           padding: EdgeInsets.all(8.w),
                            //           decoration: BoxDecoration(
                            //               color: Color.fromRGBO(
                            //                 246,
                            //                 246,
                            //                 246,
                            //                 1,
                            //               ),
                            //               borderRadius:
                            //                   BorderRadius.circular(12.r)),
                            //           child: Row(
                            //             children: [
                            //               Skeleton(
                            //                 variant: 'rectangular',
                            //                 borderRadius: 12.r,
                            //                 width: 30.w,
                            //                 height: 30.h,
                            //               ),
                            //               SizedBox(
                            //                 width: 8.w,
                            //               ),
                            //               Column(
                            //                 crossAxisAlignment:
                            //                     CrossAxisAlignment.start,
                            //                 children: [
                            //                   Skeleton(
                            //                     variant: 'text',
                            //                     borderRadius: 8.r,
                            //                     width: 20.w,
                            //                     height: 10.h,
                            //                   ),
                            //                   SizedBox(
                            //                     height: 10.h,
                            //                   ),
                            //                   Skeleton(
                            //                     variant: 'text',
                            //                     borderRadius: 8.r,
                            //                     width: 50.w,
                            //                     height: 10.h,
                            //                   ),
                            //                 ],
                            //               )
                            //             ],
                            //           ),
                            //         );
                            //       },
                            //       separatorBuilder: (context, index) {
                            //         return SizedBox(width: 12.w);
                            //       },
                            //       itemCount: 3),
                            // ),
                            // SizedBox(
                            //   height: 24.h,
                            // ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 16.w, vertical: 5.h),
                            //   decoration: BoxDecoration(
                            //       color: Color.fromRGBO(
                            //         246,
                            //         246,
                            //         246,
                            //         1,
                            //       ),
                            //       borderRadius: BorderRadius.circular(12.r)),
                            //   child: Column(children: [
                            //     ...[1, 2, 3, 4, 5, 6].map((e) {
                            //       return Column(
                            //         children: [
                            //           ListTile(
                            //             dense: true,
                            //             minVerticalPadding: 0,
                            //             // visualDensity: VisualDensity(vertical: ,),
                            //             contentPadding: EdgeInsets.zero,
                            //             leading: Skeleton(
                            //               variant: 'rectangular',
                            //               borderRadius: 8.r,
                            //               width: 20.w,
                            //               height: 20.h,
                            //             ),
                            //             title: Skeleton(
                            //               variant: 'text',
                            //               borderRadius: 8.r,
                            //               width: 40.w,
                            //               height: 10.h,
                            //             ),
                            //             subtitle: Skeleton(
                            //               variant: 'text',
                            //               borderRadius: 8.r,
                            //               width: 50.w,
                            //               height: 10.h,
                            //             ),
                            //             trailing: Skeleton(
                            //               variant: 'rectangular',
                            //               borderRadius: 8.r,
                            //               width: 20.w,
                            //               height: 20.h,
                            //             ),
                            //           ),
                            //           Divider(
                            //             thickness: 1,
                            //             color: Helper.baseBlack.withOpacity(0.04),
                            //           )
                            //         ],
                            //       );
                            //     }).toList(),
                            //   ]),
                            // ),
                          ]),
                    ),
                  ),
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
    'countText': 'Cameras'
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
  print(assetName);
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
          subtitle: Text(count.toString() + " photos · 2 videos",
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
