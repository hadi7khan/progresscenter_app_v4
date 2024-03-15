import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_project_model.dart';

class ProjectsFilterWidget extends StatefulWidget {
  final List<ProgresslineProjectModel> progresslineProjects;
  final Function onChange;
  final int postsCount;
  const ProjectsFilterWidget(
      {super.key,
      required this.progresslineProjects,
      required this.onChange,
      required this.postsCount});

  @override
  State<ProjectsFilterWidget> createState() => _ProjectsFilterWidgetState();
}

class _ProjectsFilterWidgetState extends State<ProjectsFilterWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              widget.onChange("All");
            },
            child: ListTile(
              horizontalTitleGap: 8.w,
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: 0),
              contentPadding: EdgeInsets.zero,
              leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(color: Helper.widgetBackground),
                  )),
              title: Text(
                "All Posts",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                widget.postsCount.toString(),
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Helper.baseBlack.withOpacity(0.5),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                log(widget.progresslineProjects[index].id.toString());
                return InkWell(
                  onTap: () {
                    widget.onChange(widget.progresslineProjects[index].id);
                  },
                  child: ListTile(
                    horizontalTitleGap: 8.w,
                    dense: true,
                    visualDensity: VisualDensity(horizontal: 0, vertical: 0),
                    contentPadding: EdgeInsets.zero,
                    leading:
                        widget.progresslineProjects[index].coverImageUrl != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(4.r),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.network(
                                    widget.progresslineProjects[index]
                                        .coverImageUrl,
                                    fit: BoxFit.fill,
                                    gaplessPlayback: true,
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
                                ))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(4.r),
                                child: AspectRatio(
                                  aspectRatio: 16 / 9,
                                  child: Image.asset(
                                    'assets/images/error_image.jpeg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                    title: Text(
                      widget.progresslineProjects[index].name,
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      widget.progresslineProjects[index].postCount.toString(),
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack.withOpacity(0.5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                );
              },
              separatorBuilder: ((context, index) {
                return SizedBox(
                  height: 10.h,
                );
              }),
              itemCount: widget.progresslineProjects.length),
        ],
      ),
    );
  }
}
