import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/widgets/docs_card.dart';

class DocsWidget extends ConsumerStatefulWidget {
  const DocsWidget({super.key});

  @override
  ConsumerState<DocsWidget> createState() => _TeamWidgetState();
}

class _TeamWidgetState extends BaseConsumerState<DocsWidget> {
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
    return docsData.when(
      data: (data) {
        return DocsCard(docsData: data[0]);
        // return ListView.separated(
        //   separatorBuilder: (context, index) {
        //     return SizedBox(height: 16.h);
        //   },
        //   shrinkWrap: true,
        //   padding: EdgeInsets.zero,
        //   physics: BouncingScrollPhysics(),
        //   itemCount: data.length,
        //   itemBuilder: ((context, index) {
        //     return DocsCard(docsData: data[index]);
        //   }),
        // );
      },
      error: (err, _) {
        return const Text("Failed to load Docs",
            style: TextStyle(color: Helper.errorColor));
      },
      loading: () => LoadingCardListScreen(),
    );
  }
}
