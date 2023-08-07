import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class TeamCard extends StatefulWidget {
  final teamData;
  const TeamCard({super.key, required this.teamData});

  @override
  State<TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<TeamCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Helper.widgetBackground,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ListTile(
        leading: AvatarWidget(
          dpUrl: widget.teamData.dpUrl,
          name: "Hadi",
          backgroundColor: "",
          size: 32,
        ),
        title: Text(
          "Mahesh Jethani",
          style: TextStyle(
              color: Helper.textColor700,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          "Mahesh Jethani",
          style: TextStyle(
              color: Helper.textColor600,
              fontSize: 12.sp,
              fontWeight: FontWeight.w400),
        ),
        trailing: SvgPicture.asset('assets/images/dots-vertical.svg'),
      ),
    );
  }
}
