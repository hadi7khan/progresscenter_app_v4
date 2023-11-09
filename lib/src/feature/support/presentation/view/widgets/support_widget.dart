import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/support_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/support_card.dart';

class SupportWidget extends ConsumerStatefulWidget {
  const SupportWidget({super.key});

  @override
  ConsumerState<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends BaseConsumerState<SupportWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(supportControllerProvider.notifier).getSupportTickets();
    });
  }

  @override
  Widget build(BuildContext context) {
    final supportData =
        ref.watch(supportControllerProvider.select((value) => value.users));
    return supportData.when(
      data: (data) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: data.length,
          itemBuilder: ((context, index) {
            return SupportCard(supportData: data[index]);
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
