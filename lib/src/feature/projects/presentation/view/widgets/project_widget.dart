import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';

class ProjectWidget extends ConsumerStatefulWidget {
  const ProjectWidget({super.key});

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
              padding: EdgeInsets.only(
                  top: 8.h, right: 8.w, left: 8.w, bottom: 20.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   height: 185.h,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(14.r),
                  //     color: Color.fromRGBO(235, 235, 235, 1),
                  //   ),
                  // ),
                  Stack(alignment: Alignment.bottomCenter, children: [
                    CarouselSlider.builder(
                      itemCount: data[index].images!.length,
                      options: CarouselOptions(
                          height: 185.h,
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
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14.r),
                          color: Color.fromRGBO(235, 235, 235, 1),
                        ),
                        child: data[index].images!.isNotEmpty
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(14.r),
                                child: Image.network(
                                  data[index].images![itemIndex].url!,
                                  fit: BoxFit.cover,
                                ))
                            : SizedBox(),
                      ),
                    ),
                    data[index].images!.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: DotsIndicator(
                              dotsCount: data[index].images!.length,
                              position:
                                  _currentIndex != null ? _currentIndex! : 0,
                              decorator: DotsDecorator(
                                color: Colors.white.withOpacity(0.6),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.r)),
                                activeColor: Colors.white,
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r)),
                                size: Size(6, 6),
                                activeSize: Size(8, 8),
                              ),
                            ))
                        : SizedBox(),
                  ]),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    data[index].name!,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Helper.textColor700,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    data[index].location!.name!,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Helper.textColor400,
                    ),
                  ),
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
