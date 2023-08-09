import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'package:progresscenter_app_v4/src/feature/timeline/presentation/view/widgets/feed_card.dart';

class FeedWidget extends ConsumerStatefulWidget {
  const FeedWidget({super.key});

  @override
  ConsumerState<FeedWidget> createState() => _TeamWidgetState();
}

class _TeamWidgetState extends BaseConsumerState<FeedWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(docsControllerProvider.notifier).getDocs();
    });
  }

  @override
  Widget build(BuildContext context) {
    final docsData =
        ref.watch(docsControllerProvider.select((value) => value.docs));
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: ((context, index) {
        return FeedCard();
      }),
    );
  }
}
