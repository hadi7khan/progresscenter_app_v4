import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      onTap: () {
        context.push('/details', extra: {
          "projectId": widget.project.id,
          "projectName": widget.project.name!,
          "projectImages": widget.project.images,
          "projectLocation": widget.project.location.name,
          "projectUsers": widget.project.users
        });
      },
      child: Hero(
        tag: "project card",
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.zero,
              height: MediaQuery.of(context).size.width - 2 * 20.w,
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
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                            width: double.infinity,
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              color: Color.fromRGBO(235, 235, 235, 1),
                            ),
                            child: widget.project!.images!.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(16.r),
                                    child: Image.network(
                                      widget.project.images![itemIndex].url!,
                                      fit: BoxFit.cover,
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return ClipRRect(
                                          child: Image.asset(
                                              'assets/images/error_image.jpeg',
                                              fit: BoxFit.cover),
                                        );
                                      },
                                    ))
                                : SizedBox(),
                          ),
                        ),
                      ),
                    ),
                    // Positioned(
                    //   top: 20,
                    //   left: 20,
                    //   child: BlurryContainer(
                    //       blur: 3,
                    //       padding: EdgeInsets.symmetric(
                    //           vertical: 6.h, horizontal: 8.w),
                    //       borderRadius: BorderRadius.circular(30.r),
                    //       color: Colors.white.withOpacity(0.1),
                    //       child: Row(
                    //         children: [
                    //           SvgPicture.asset('assets/images/ai.svg'),
                    //           SizedBox(width: 4.w),
                    //           Text("AI enhanced",
                    //               style: TextStyle(
                    //                   color: Colors.white,
                    //                   fontWeight: FontWeight.w500,
                    //                   fontSize: 12.sp)),
                    //         ],
                    //       )),
                    // ),
                    widget.project.images!.isNotEmpty
                        ? Positioned(
                            bottom: 10.h,
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: DotsIndicator(
                                  dotsCount: widget.project.images!.length,
                                  position: _currentIndex!,
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
                          )
                        : SizedBox(),
                    // Positioned.fill(
                    //   bottom: 7,
                    //   // left: 20,
                    //   child: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: Container(
                    //       height: 88.h,
                    //       width: double.infinity,
                    //       margin: EdgeInsets.zero,
                    //       padding: EdgeInsets.all(20.w),
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(15.r),
                    //           color: Color.fromRGBO(246, 246, 246, 1)),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         mainAxisSize: MainAxisSize.min,
                    //         children: [
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.start,
                    //             children: [
                    //               Text(
                    //                 widget.project.name!,
                    //                 style: TextStyle(
                    //                   fontSize: 18.sp,
                    //                   fontWeight: FontWeight.w500,
                    //                   color: Helper.baseBlack,
                    //                 ),
                    //               ),
                    //               // SizedBox(
                    //               //   height: 6.h,
                    //               // ),
                    //               Text(
                    //                 widget.project.location!.name!,
                    //                 style: TextStyle(
                    //                   fontSize: 14.sp,
                    //                   fontWeight: FontWeight.w400,
                    //                   color: Helper.baseBlack.withOpacity(0.5),
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //           TextButton(
                    //               onPressed: () {
                    //                 context.push('/details', extra: {
                    //                   "projectId": widget.project.id,
                    //                   "projectName": widget.project.name!
                    //                 });
                    //               },
                    //               style: ButtonStyle(
                    //                   shape: MaterialStateProperty.all(
                    //                       RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(8.r),
                    //                   )),
                    //                   backgroundColor:
                    //                       MaterialStateProperty.all(Colors.white)),
                    //               child: Text(
                    //                 "View",
                    //                 style: TextStyle(
                    //                     color: Helper.baseBlack,
                    //                     fontSize: 14.sp,
                    //                     letterSpacing: 0.2,
                    //                     fontWeight: FontWeight.w600),
                    //               ))
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ]),
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
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Helper.baseBlack,
                  ),
                ),
                // SizedBox(
                //   height: 6.h,
                // ),
                Text(
                  widget.project.location!.name!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Helper.baseBlack.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            // Row(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             mainAxisSize: MainAxisSize.min,
            //             children: [
            //               Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     widget.project.name!,
            //                     style: TextStyle(
            //                       fontSize: 18.sp,
            //                       fontWeight: FontWeight.w500,
            //                       color: Helper.baseBlack,
            //                     ),
            //                   ),
            //                   // SizedBox(
            //                   //   height: 6.h,
            //                   // ),
            //                   Text(
            //                     widget.project.location!.name!,
            //                     style: TextStyle(
            //                       fontSize: 14.sp,
            //                       fontWeight: FontWeight.w400,
            //                       color: Helper.baseBlack.withOpacity(0.5),
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               TextButton(
            //                   onPressed: () {
            //                     context.push('/details', extra: {
            //                       "projectId": widget.project.id,
            //                       "projectName": widget.project.name!
            //                     });
            //                   },
            //                   style: ButtonStyle(
            //                       shape: MaterialStateProperty.all(
            //                           RoundedRectangleBorder(
            //                         borderRadius: BorderRadius.circular(8.r),
            //                       )),
            //                       backgroundColor:
            //                           MaterialStateProperty.all(Colors.white)),
            //                   child: Text(
            //                     "View",
            //                     style: TextStyle(
            //                         color: Helper.baseBlack,
            //                         fontSize: 14.sp,
            //                         letterSpacing: 0.2,
            //                         fontWeight: FontWeight.w600),
            //                   ))
            //             ],
            //           ),
          ],
        ),
      ),
    );
  }
}
