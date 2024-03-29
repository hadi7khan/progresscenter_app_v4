import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';

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
  }

  @override
  Widget build(BuildContext context) {
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
        return InkWell(
            highlightColor: Colors.transparent,
            onTap: () {
              context.push('/userProfile', extra: {"userId": user.id});
            },
            child: TeamCard(teamData: user));
      }),
    );
  }
}
