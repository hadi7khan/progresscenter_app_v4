import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_card.dart';

class ProjectWidget extends ConsumerStatefulWidget {
  final List<ProjectModel> projects;
  ProjectWidget({super.key, required this.projects});

  @override
  ConsumerState<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends BaseConsumerState<ProjectWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 30.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.projects.length,
      itemBuilder: ((context, index) {
        return ProjectCard(index: index, project: widget.projects[index]);
      }),
    );
  }
}
