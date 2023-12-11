
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/support_card.dart';

class SupportWidget extends ConsumerStatefulWidget {
  final supportData;
  const SupportWidget({super.key, this.supportData});

  @override
  ConsumerState<SupportWidget> createState() => _SupportWidgetState();
}

class _SupportWidgetState extends BaseConsumerState<SupportWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     ref.read(supportControllerProvider.notifier).getSupportTickets();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final supportData =
    //     ref.watch(supportControllerProvider.select((value) => value.users));
    // return supportData.when(
    //   data: (data) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: widget.supportData.length,
          itemBuilder: ((context, index) {
            final data = widget.supportData[index];
            return InkWell(
              onTap: (){
                context.push('/ticketById', extra: {
              "ticketId": data.id
              });
              },
              child: SupportCard(supportData: data));
          }),
        );
      // },
    //   error: (err, _) {
    //     return const Text("Failed to load Projects",
    //         style: TextStyle(color: Helper.errorColor));
    //   },
    //   loading: () => LoadingCardListScreen(),
    // );
  }
}
