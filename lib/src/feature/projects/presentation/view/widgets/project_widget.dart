import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';

class ProjectWidget extends ConsumerStatefulWidget {
  final String detailsPath;
  ProjectWidget(this.detailsPath, {super.key});

  @override
  ConsumerState<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends BaseConsumerState<ProjectWidget> {
  int? _currentIndex;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(projectControllerProvider.notifier).getProjects("token");
    });
  }

  @override
  Widget build(BuildContext context) {
    final projectData =
        ref.watch(projectControllerProvider.select((value) => value.projects));
    return projectData.when(
      data: (data) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 20.h);
          },
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //   height: 185.h,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(14.r),
                  //     color: Color.fromRGBO(235, 235, 235, 1),
                  //   ),
                  // ),
                  Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        CarouselSlider.builder(
                          itemCount: data[index].images!.length,
                          options: CarouselOptions(
                              height: 284.h,
                              viewportFraction: 1,
                              initialPage: 0,
                              autoPlay: false,
                              enlargeCenterPage: false,
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
                              borderRadius: BorderRadius.circular(16.r),
                              color: Color.fromRGBO(235, 235, 235, 1),
                            ),
                            child: data[index].images!.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.network(
                                      data[index].images![itemIndex].url!,
                                      fit: BoxFit.cover,
                                    ))
                                : SizedBox(),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: BlurryContainer(
                            blur: 3,
                              padding: EdgeInsets.symmetric(
                                  vertical: 6.h, horizontal: 8.w),
                              
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
                        data[index].images!.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: DotsIndicator(
                                  dotsCount: data[index].images!.length,
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
                                ))
                            : SizedBox(),
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
                                    borderRadius: BorderRadius.circular(15.r),
                                    color: Color.fromRGBO(246, 246, 246, 1)),
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
                                            fontWeight: FontWeight.w500,
                                            color: Helper.baseBlack,
                                          ),
                                        ),
                                        // SizedBox(
                                        //   height: 6.h,
                                        // ),
                                        Text(
                                          data[index].location!.name!,
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
                                          context.push(widget.detailsPath, extra: {"projectId": "projectId", "projectName": data[index].name!});
                                        },
                                        style: ButtonStyle(
                                            shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.r),)),
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white)),
                                        child: Text(
                                          "View",
                                          style: TextStyle(
                                              color: Helper.baseBlack,
                                              fontSize: 14.sp,
                                              letterSpacing: 0.2,
                                              fontWeight: FontWeight.w600),
                                        ))
                                  ],
                                )),
                          ),
                        ),
                      ]),
                  // SizedBox(
                  //   height: 20.h,
                  // ),
                  // Text(
                  //   data[index].name!,
                  //   style: TextStyle(
                  //     fontSize: 20.sp,
                  //     fontWeight: FontWeight.w600,
                  //     color: Helper.textColor700,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 6.h,
                  // ),
                  // Text(
                  //   data[index].location!.name!,
                  //   style: TextStyle(
                  //     fontSize: 16.sp,
                  //     fontWeight: FontWeight.w400,
                  //     color: Helper.textColor400,
                  //   ),
                  // ),
                ],
              ),
            );
          }),
        );
      },
      error: (err, _) {
        return const Text("Failed to load Projects",
            style: TextStyle(color: Helper.errorColor));
      },
      loading: () => const Center(
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
