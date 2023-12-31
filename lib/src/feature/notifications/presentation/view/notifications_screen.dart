import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/presentation/provider/notifications_controller.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/presentation/view/widgets/notification_widget.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends BaseConsumerState<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(notificationsControllerProvider.notifier).getNotifications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final notificationsData = ref.watch(
        notificationsControllerProvider.select((value) => value.notifications));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: AppBar(
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 12.0.w,
            leading: InkWell(
              onTap: () {
                context.pop();
              },
              child: SvgPicture.asset(
                'assets/images/close-x.svg',
              ),
            ),
            leadingWidth: 12,
            title: Text(
              "Notifications",
              style: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: notificationsData.when(
          data: (data) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Column(
                children: [
                  ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: ((context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  fontSize: 12,
                                  color: Helper.textColor500,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 10.h),
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 16.h, horizontal: 16.w),
                                decoration: BoxDecoration(
                                    color: Helper.widgetBackground,
                                    borderRadius: BorderRadius.circular(16.r)),
                                child: Wrap(
                                  children: [
                                    for (int i = 0; i < 3; i++)
                                      NotificationWidget(),
                                  ],
                                )),
                          ],
                        );
                      }),
                      separatorBuilder: (context, index) {
                        return SizedBox(
                          height: 20.h,
                        );
                      },
                      itemCount: 5)
                ],
              ),
            );
          },
          error: (err, _) {
            return const Text("Failed to load teams",
                style:
                    TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
          },
          loading: () => LoadingTeamList(),
        ),
      )),
    );
  }
}
