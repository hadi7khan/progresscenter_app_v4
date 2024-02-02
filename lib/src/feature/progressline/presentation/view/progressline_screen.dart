import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
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

  Future<String> fetchFeed() async {
    await Service().progresslineProjectsList().then((value) {
      if (value.isNotEmpty) {
        _progresslineProjects = value;
        _projectId = _progresslineProjects[0].id;
      }
    });
    return "Data loaded";
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
            child: RefreshIndicator(
          displacement: 10.0,
          color: ref.watch(primaryColorProvider),
          onRefresh: () async {
            HapticFeedback.mediumImpact();
            return await ref
                .refresh(progresslineControllerProvider.notifier)
                .getProgressline(_projectId);
          },
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
                      InkWell(
                          onTap: () {
                            context.push('/notifications');
                          },
                          child: SvgPicture.asset('assets/images/home.svg')),
                      Row(
                        children: [
                          SizedBox(width: 12.w),
                          ConstrainedBox(
                            constraints: new BoxConstraints(
                              maxHeight: 30.h,
                              maxWidth: 30.w,
                            ),
                            child: PopupMenuButton(
                              padding: EdgeInsets.zero,
                              icon: SvgPicture.asset('assets/images/sort.svg'),
                              position: PopupMenuPosition.under,
                              itemBuilder: (BuildContext context) {
                                return _progresslineProjects.map((project) {
                                  return PopupMenuItem(
                                      value: project.id,
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
                                                    gaplessPlayback: true,
                                                    errorBuilder:
                                                        (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                                stackTrace) {
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
                                              letterSpacing: -0.3,
                                              color: Helper.baseBlack,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        subtitle: Text(
                                          project.postCount.toString(),
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              color: Helper.baseBlack
                                                  .withOpacity(0.5),
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ));
                                }).toList();
                              },
                              onSelected: (value) {
                                ref
                                    .read(
                                        progresslineControllerProvider.notifier)
                                    .getProgressline(value);
                              },
                            ),
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
                            letterSpacing: -1,
                            color: Helper.textColor700,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  FutureBuilder(
                      future: fetchFeed(),
                      builder: ((context, snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return const Text('');
                          case ConnectionState.active:
                          case ConnectionState.waiting:
                            return const Text('');
                          case ConnectionState.done:
                            if (snapshot.hasError) return const Text('');
                            return FeedWidget(
                                progresslineProjects: _progresslineProjects,
                                projectId: _projectId);
                        }
                      }))
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
