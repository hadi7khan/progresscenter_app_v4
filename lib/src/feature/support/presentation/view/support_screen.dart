import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_support_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/provider/support_controller.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/support_widget.dart';

class SupportScreen extends ConsumerStatefulWidget {
  final label;
  final detailsPath;
  const SupportScreen({super.key, this.label, this.detailsPath});

  @override
  ConsumerState<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends BaseConsumerState<SupportScreen> {
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

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: supportData.when(
              data: (data) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/images/home.svg'),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/search.svg'),
                            SizedBox(width: 12.w),
                            InkWell(
                                onTap: () {
                                  context.push('/createTicket');
                                },
                                child:
                                    SvgPicture.asset('assets/images/plus.svg')),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Support",
                          style: TextStyle(
                              letterSpacing: -1,
                              color: Helper.textColor700,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    SupportWidget(supportData: data),
                  ],
                );
              },
              error: (err, _) {
                return const Text("Failed to load support tickets",
                    style: TextStyle(
                        letterSpacing: -0.3, color: Helper.errorColor));
              },
              loading: () => LoadingSupportList(),
            )),
      )),
    );
  }
}
