import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_card.dart';

class ArchivedWidget extends ConsumerStatefulWidget {
  final List<ProjectModel> archivedProjects;
  ArchivedWidget({super.key, required this.archivedProjects});

  @override
  ConsumerState<ArchivedWidget> createState() => _ArchivedWidgetState();
}

class _ArchivedWidgetState extends BaseConsumerState<ArchivedWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.archivedProjects.isEmpty) {
      return Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.6.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/illustration.svg'),
            SizedBox(height: 16.h),
            Text(
              "No Archives",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.textColor900,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              "This space is empty.",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.textColor600,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      );
    }
    ;
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 30.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemCount: widget.archivedProjects.length,
      itemBuilder: ((context, index) {
        return ProjectCard(
            index: index, project: widget.archivedProjects[index]);
      }),
    );
  }
}
