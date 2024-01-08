import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_card.dart';

class ProjectWidget extends ConsumerStatefulWidget {
  ProjectWidget({super.key});

  @override
  ConsumerState<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends BaseConsumerState<ProjectWidget> {
  int? _currentIndex = 0;
  CarouselController carouselController = CarouselController();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(projectControllerProvider.notifier).getProjects();
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
            return SizedBox(height: 30.h);
          },
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return ProjectCard(index: index, project: data[index]);
          }),
        );
      },
      error: (err, _) {
        return const Text("Failed to load Projects",
            style: TextStyle(color: Helper.errorColor));
      },
      loading: () => LoadingCardListScreen(),
    );
  }
}
