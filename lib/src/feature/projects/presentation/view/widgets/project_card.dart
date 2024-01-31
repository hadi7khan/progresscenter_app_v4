import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ProjectCard extends StatefulWidget {
  final int? index;
  final project;
  const ProjectCard({super.key, required this.index, required this.project});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  int? _currentIndex = 0;
  CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        if (widget.project.hasCameras) {
          context.push('/details', extra: {
            "projectId": widget.project.id,
            "projectName": widget.project.name!,
            "projectImages": widget.project.images,
            "projectLocation": widget.project.location.name,
            "projectUsers": widget.project.users
          });
        } else {
          context.push('/superProject/${widget.project.id}', extra: {
            "projectId": widget.project.id,
          });
        }
      },
      child: Hero(
        tag: "project_card",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.width - 2 * 20.w,
              decoration: BoxDecoration(
                color: Helper.widgetBackground,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: widget.project.images.isNotEmpty
                  ? Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.topCenter,
                      children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: CarouselSlider.builder(
                                carouselController: carouselController,
                                itemCount: widget.project.images!.length,
                                options: CarouselOptions(
                                    // height: 198.h,
                                    viewportFraction: 1,
                                    aspectRatio: 1 / 1,
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
                                itemBuilder: (BuildContext context,
                                        int itemIndex, int pageViewIndex) =>
                                    Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.zero,
                                        padding: EdgeInsets.zero,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.r),
                                          color: Helper.widgetBackground,
                                        ),
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.r),
                                            child: CachedNetworkImage(
                                              imageUrl: widget.project
                                                  .images![itemIndex].url!,
                                              fit: BoxFit.fitHeight,
                                              errorWidget:
                                                  (context, url, error) =>
                                                      ClipRRect(
                                                child: Image.asset(
                                                  'assets/images/error_image.jpeg',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ))),
                              ),
                            ),
                          ),
                          widget.project.images!.isNotEmpty
                              ? Positioned(
                                  bottom: 10.h,
                                  child: Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 12),
                                      child: DotsIndicator(
                                        dotsCount:
                                            widget.project.images!.length,
                                        position: _currentIndex!,
                                        decorator: DotsDecorator(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6.r)),
                                            activeColor: Colors.white,
                                            activeShape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r)),
                                            size: Size(6, 6),
                                            activeSize: Size(8, 8),
                                            spacing:
                                                EdgeInsets.only(right: 6.w)),
                                      )),
                                )
                              : SizedBox(),
                        ])
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Image.asset(
                        'assets/images/error_image.jpeg',
                        fit: BoxFit.fill,
                      ),
                    ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.project.name!,
                  style: TextStyle(
                    letterSpacing: -0.3,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Helper.baseBlack,
                  ),
                ),
                Text(
                  widget.project.location!.name!,
                  style: TextStyle(
                    letterSpacing: -0.3,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Helper.baseBlack.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
