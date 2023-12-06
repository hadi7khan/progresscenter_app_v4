import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/user_controller.dart';

import 'team_card.dart';

class TeamWidget extends ConsumerStatefulWidget {
  final teamData;
  const TeamWidget({super.key, this.teamData});

  @override
  ConsumerState<TeamWidget> createState() => _TeamWidgetState();
}

class _TeamWidgetState extends BaseConsumerState<TeamWidget> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref.read(teamControllerProvider.notifier).getUser();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final teamData =
    //     ref.watch(teamControllerProvider.select((value) => value.users));
    // return teamData.when(
    //   data: (data) {
        return ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: widget.teamData.length,
          itemBuilder: ((context, index) {
            final user = widget.teamData[index];
            print("user---"+ user.toString());
            return InkWell(
                onTap: () {
                  context
                      .push('/userProfile', extra: {"userId": user.id});
                },
                child: TeamCard(teamData: user));
          }),
        );
    //   },
    //   error: (err, _) {
    //     return const Text("Failed to load teams",
    //         style: TextStyle(color: Helper.errorColor));
    //   },
    //   loading: () => LoadingCardListScreen(),
    // );
  }
}
