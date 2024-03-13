import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class TeamCard extends ConsumerStatefulWidget {
  final teamData;
  const TeamCard({super.key, required this.teamData});

  @override
  ConsumerState<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends BaseConsumerState<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Helper.widgetBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        minVerticalPadding: 0,
        horizontalTitleGap: 8,
        visualDensity: VisualDensity(horizontal: 0, vertical: 0),
        leading: AvatarWidget(
          dpUrl: widget.teamData.dp != null ? widget.teamData.dpUrl : "",
          name: widget.teamData.name,
          backgroundColor: widget.teamData.preset.color,
          size: 42,
          fontSize: 16,
        ),
        title: Text(
          widget.teamData.name,
          style: TextStyle(
              letterSpacing: -0.3,
              color: Helper.textColor700,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          widget.teamData.designation != null
              ? widget.teamData.designation
              : "N/A",
          style: TextStyle(
              letterSpacing: -0.3,
              color: Helper.textColor600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
