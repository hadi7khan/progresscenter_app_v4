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
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/projects_filter_widget.dart';
import 'dart:developer' as dev;

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
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              useRootNavigator: true,
                              isScrollControlled: true,
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) => ProjectsFilterWidget(
                                    progresslineProjects: _progresslineProjects,
                                    onChange: (String id) {
                                      ref
                                          .read(progresslineControllerProvider
                                              .notifier)
                                          .getProgressline(id);
                                      context.pop();
                                    },
                                  ));
                        },
                        child: Row(
                          children: [
                            SizedBox(width: 12.w),
                            ConstrainedBox(
                                constraints: new BoxConstraints(
                                  maxHeight: 30.h,
                                  maxWidth: 30.w,
                                ),
                                child:
                                    SvgPicture.asset('assets/images/sort.svg')),
                          ],
                        ),
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
