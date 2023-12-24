import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/provider/site_gallery_controller.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/site_gallery_grid_widget.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/widgets/site_gallery_list_widget.dart';

class SiteGalleryScreen extends ConsumerStatefulWidget {
  final String projectId;
  final String projectName;
  const SiteGalleryScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  ConsumerState<SiteGalleryScreen> createState() => _DroneFootageScreenState();
}

class _DroneFootageScreenState extends BaseConsumerState<SiteGalleryScreen> {
  bool list = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(siteGalleryControllerProvider.notifier)
          .getSiteGallery(widget.projectId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final siteGalleryData = ref.watch(
        siteGalleryControllerProvider.select((value) => value.siteGallery));
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w),
              child: AppBar(
                // backgroundColor: Colors.white,
                // surfaceTintColor: Colors.white,
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
                  widget.projectName,
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                actions: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (list == true) {
                          list = false;
                        } else {
                          list = true;
                        }
                      });
                    },
                    child: list
                        ? SvgPicture.asset('assets/images/grid_view.svg')
                        : SvgPicture.asset('assets/images/list_view.svg'),
                  ),
                  SizedBox(width: 5.w),
                  InkWell(
                    child: SvgPicture.asset('assets/images/plus.svg'),
                    onTap: () {
                      context.push('/addSiteGallery', extra: {
                        "projectId": widget.projectId,
                        "projectName": widget.projectName
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.symmetric( vertical: 12.h),
            child: siteGalleryData.when(
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
                          "No Site gallery",
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
                return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   mainAxisSize: MainAxisSize.max,
                      //   children: [
                      //     Row(children: [
                      //       Container(
                      //         height: 24.h,
                      //         child: IconButton(
                      //           padding: EdgeInsets.zero,
                      //           alignment: Alignment.centerLeft,
                      //           icon: Icon(
                      //             Icons.arrow_back,
                      //           ),
                      //           onPressed: () => context.pop(),
                      //         ),
                      //       ),
                      //       SizedBox(width: 8.w),
                      //       Text(
                      //         widget.projectName,
                      //         style: TextStyle(
                      //             color: Helper.baseBlack,
                      //             fontSize: 18.sp,
                      //             fontWeight: FontWeight.w500),
                      //       )
                      //     ]),
                      //     Row(
                      //       mainAxisSize: MainAxisSize.min,
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         Container(
                      //           margin: EdgeInsets.zero,
                      //           height: 24.h,
                      //           child: IconButton(
                      //             padding: EdgeInsets.zero,
                      //             alignment: Alignment.centerLeft,
                      //             icon: list
                      //                 ? SvgPicture.asset(
                      //                     'assets/images/grid_view.svg')
                      //                 : SvgPicture.asset(
                      //                     'assets/images/list_view.svg'),
                      //             onPressed: () {
                      //               setState(() {
                      //                 if (list == true) {
                      //                   list = false;
                      //                 } else {
                      //                   list = true;
                      //                 }
                      //               });
                      //             },
                      //           ),
                      //         ),
                      //         Container(
                      //           margin: EdgeInsets.zero,
                      //           height: 24.h,
                      //           child: IconButton(
                      //             padding: EdgeInsets.zero,
                      //             alignment: Alignment.centerLeft,
                      //             icon: SvgPicture.asset('assets/images/plus.svg'),
                      //             onPressed: () => context.pop(),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 24.h,
                      // ),
                      list
                          ? ListView.separated(
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 16.h);
                              },
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: ((context, index) {
                                final reversedIndex = data.length - 1 - index;
                                return SiteGalleryListViewWidget(
                                  data: data[reversedIndex],
                                );
                              }),
                            )
                          : GridView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent: MediaQuery.of(context).size.width / 3, 
                                      mainAxisSpacing: 1.5.h,
                                      crossAxisSpacing: 1.5.w,
                                      childAspectRatio: 1 / 1,
                                      // mainAxisExtent: 100.h
                                      ),
                              itemCount: data.length,
                              itemBuilder: ((context, index) {
                                final reversedIndex = data.length - 1 - index;
                                return SiteGalleryGridViewWidget(
                                  data: data[reversedIndex],
                                );
                              }),
                            )
                    ]);
              },
              error: (err, _) {
                return const Text("Failed to load Drone Footages",
                    style: TextStyle(
                        letterSpacing: -0.3, color: Helper.errorColor));
              },
              loading: () => Column(
                children: [
                  SizedBox(
                    height: 44,
                  ),
                  LoadingCardListScreen(),
                ],
              ),
            ),
          )),
        ));
  }
}
