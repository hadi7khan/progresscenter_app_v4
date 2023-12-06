import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingTeamList extends StatefulWidget {
  const LoadingTeamList({super.key});

  @override
  State<LoadingTeamList> createState() => _LoadingTeamListState();
}

class _LoadingTeamListState extends State<LoadingTeamList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(height: 36.w),
              ],
            ),
          ],
        ),
        SizedBox(height: 14.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Skeleton(
              variant: "text",
              height: 30.h,
              width: 100.w,
              borderRadius: 10.r,
            ),
          ],
        ),
        SizedBox(height: 16.h),
        ListView.separated(
          separatorBuilder: (context, index) {
            return SizedBox(height: 16.h);
          },
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: ((context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Helper.widgetBackground,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: ListTile(
                leading: Skeleton(
                  variant: "circular",
                  height: 32.h,
                  width: 32.w,
                ),
                title: Skeleton(
                  variant: "text",
                  height: 10.h,
                  width: 30.w,
                  borderRadius: 15.r,
                ),
                subtitle: Skeleton(
                  variant: "text",
                  height: 10.h,
                  width: 30.w,
                  borderRadius: 15.r,
                ),
              ),
            );
          }),
        )
      ],
    );
  }
}
