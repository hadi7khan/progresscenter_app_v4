import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_project_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/provider/all_progressline_posts_controller.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/widgets/feed_card.dart';

class FeedWidget extends ConsumerStatefulWidget {
  final List<ProgresslineProjectModel> progresslineProjects;
  final String projectId;
  final List<ProgressLineModel> posts;

  const FeedWidget({
    super.key,
    required this.progresslineProjects,
    required this.projectId,
    required this.posts,
  });

  @override
  ConsumerState<FeedWidget> createState() => _TeamWidgetState();
}

class _TeamWidgetState extends BaseConsumerState<FeedWidget> {
  List<ProgresslineProjectModel> _progresslineProjects = [];

  @override
  void initState() {
    super.initState();
    _progresslineProjects = widget.progresslineProjects;

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref
    //       .read(allProgresslinePostsControllerProvider.notifier)
    //       .getAllProgresslinePosts();
    // });
  }

  @override
  Widget build(BuildContext context) {
    if (_progresslineProjects.isEmpty) {
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
              "No Feeds",
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
    // final progresslineData = ref.watch(allProgresslinePostsControllerProvider
    //     .select((value) => value.allProgresslinePosts));

    // return
    // progresslineData.when(
    //   data: (data) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: widget.posts.length,
      itemBuilder: ((context, index) {
        return FeedCard(progresslineData: widget.posts[index]);
      }),
    );
    // },
    // error: (err, _) {
    //   return const Text("Failed to load Progressline",
    //       style: TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
    // },
    // loading: () => LoadingProgressline(),
    // );
  }
}
