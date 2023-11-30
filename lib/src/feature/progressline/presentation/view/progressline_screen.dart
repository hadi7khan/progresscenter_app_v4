import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_project_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/progressline_controller.dart';

import 'widgets/feed_widget.dart';

class ProgresslineScreen extends ConsumerStatefulWidget {
  final String label;
  final String detailsPath;
  const ProgresslineScreen(
      {super.key, required this.label, required this.detailsPath});

  @override
  ConsumerState<ProgresslineScreen> createState() => _ProgresslineScreenState();
}

class _ProgresslineScreenState extends BaseConsumerState<ProgresslineScreen> {
  List<ProgresslineProjectModel> _progresslineProjects = [];
  String _projectId = "";

  @override
  void initState() {
    super.initState();
    

    Service().progresslineProjectsList().then((value) {
      _progresslineProjects = value;
      _projectId = _progresslineProjects[0].id;

      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(progresslineControllerProvider.notifier).getProgressline(_projectId);
    });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/home.svg'),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/search.svg'),
                        SizedBox(width: 12.w),
                        PopupMenuButton(
                          icon: SvgPicture.asset('assets/images/sort.svg'),
                          itemBuilder: (BuildContext context) {
                            return _progresslineProjects.map((project) {
                              return PopupMenuItem(
                                  value: project
                                      .id, // Use a unique identifier for each item
                                  child: ListTile(
                                    horizontalTitleGap: 8.w,
                                    dense: true,
                                    visualDensity: VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    contentPadding: EdgeInsets.zero,
                                    leading: project.coverImageUrl != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: Image.network(
                                                project.coverImageUrl,
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
                                            ))
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4.r),
                                            child: AspectRatio(
                                              aspectRatio: 16 / 9,
                                              child: Image.asset(
                                                'assets/images/error_image.jpeg',
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                    title: Text(
                                      project.name,
                                      style: TextStyle(
                                          color: Helper.baseBlack,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    subtitle: Text(
                                      project.postCount.toString(),
                                      style: TextStyle(
                                          color:
                                              Helper.baseBlack.withOpacity(0.5),
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ));
                            }).toList();
                          },
                          onSelected: (value) {
                            // Handle the selected item
                            print('Selected project with id: $value');
                            // You can perform additional actions based on the selected item
                            ref.read(progresslineControllerProvider.notifier).getProgressline(value);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Feed",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                FeedWidget(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
