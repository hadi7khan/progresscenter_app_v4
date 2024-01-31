import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/archived_widget.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_widget.dart';

class ProjectsScreen extends ConsumerStatefulWidget {
  final String label;
  final String detailsPath;
  const ProjectsScreen(
      {super.key, required this.label, required this.detailsPath});

  @override
  ConsumerState<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends BaseConsumerState<ProjectsScreen> {
  List<ProjectModel> archived = [];
  bool _showArchived = false;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(projectControllerProvider.notifier).getProjects().then((value) {
        for (ProjectModel project in value) {
          if (project.status == "ARCHIVED") {
            archived.add(project);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final projectData =
        ref.watch(projectControllerProvider.select((value) => value.projects));
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SafeArea(
          child: RefreshIndicator(
            displacement: 10.0,
            color: ref.watch(primaryColorProvider),
            onRefresh: () async {
              HapticFeedback.mediumImpact();
              return await ref
                  .refresh(projectControllerProvider.notifier)
                  .getProjects();
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
                            InkWell(
                                onTap: () {
                                  context.push("/projectSearch");
                                },
                                child: SvgPicture.asset(
                                    'assets/images/search.svg')),
                            SizedBox(width: 12.w),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _showArchived = !_showArchived;
                                  });
                                },
                                child: _showArchived
                                    ? SvgPicture.asset(
                                        'assets/images/activity.svg')
                                    : SvgPicture.asset(
                                        'assets/images/archive.svg')),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _showArchived ? "Archived" : "Projects",
                          style: TextStyle(
                              letterSpacing: -1,
                              color: Helper.textColor700,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    projectData.when(
                      data: (data) {
                        return _showArchived
                            ? ArchivedWidget(archivedProjects: archived)
                            : ProjectWidget(projects: data);
                      },
                      error: (err, _) {
                        return const Text("Failed to load Projects",
                            style: TextStyle(color: Helper.errorColor));
                      },
                      loading: () => LoadingCardListScreen(),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
