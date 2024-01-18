import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingProjectDetails extends StatefulWidget {
  const LoadingProjectDetails({super.key});

  @override
  State<LoadingProjectDetails> createState() => _LoadingProjectDetailsState();
}

class _LoadingProjectDetailsState extends State<LoadingProjectDetails> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      // Container(
      //   height: 45,

      //   child: AvatarGroupWidget(
      //     avatars:
      //         (data.users as List<User>).map((user) {
      //       return {
      //         'dpUrl':
      //             user.dp != null ? user.dpUrl : "",
      //         'name': user.name,
      //         'backgroundColor': user.preset!.color,
      //       };
      //     }).toList(),
      //     size: 40.h,
      //     max: 3,
      //   ),
      // ),
      SizedBox(
        height: 20.h,
      ),

      SizedBox(
        height: 58.h,
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(
                    246,
                    246,
                    246,
                    1,
                  ),
                  borderRadius: BorderRadius.circular(12.r)),
              child: Row(
                children: [
                  Skeleton(
                    variant: 'rectangular',
                    borderRadius: 12.r,
                    width: 30.w,
                    height: 30.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(
                        variant: 'text',
                        borderRadius: 8.r,
                        width: 20.w,
                        height: 10.h,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Skeleton(
                        variant: 'text',
                        borderRadius: 8.r,
                        width: 50.w,
                        height: 10.h,
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(width: 12.w);
          },
        ),
      ),
      SizedBox(
        height: 24.h,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 5.h),
        decoration: BoxDecoration(
            color: Color.fromRGBO(
              246,
              246,
              246,
              1,
            ),
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(children: [
          ...[1, 2, 3, 4, 5].map((e) {
            return Column(
              children: [
                ListTile(
                  dense: true,
                  minVerticalPadding: 0,
                  // visualDensity: VisualDensity(vertical: ,),
                  contentPadding: EdgeInsets.zero,
                  leading: Skeleton(
                    variant: 'rectangular',
                    borderRadius: 8.r,
                    width: 20.w,
                    height: 20.h,
                  ),
                  title: Skeleton(
                    variant: 'text',
                    borderRadius: 8.r,
                    width: 40.w,
                    height: 10.h,
                  ),
                  subtitle: Skeleton(
                    variant: 'text',
                    borderRadius: 8.r,
                    width: 50.w,
                    height: 10.h,
                  ),
                  trailing: Skeleton(
                    variant: 'rectangular',
                    borderRadius: 8.r,
                    width: 20.w,
                    height: 20.h,
                  ),
                ),
                Divider(
                  thickness: 1,
                  color: Helper.baseBlack.withOpacity(0.04),
                )
              ],
            );
          }).toList(),
        ]),
      ),
    ]);
  }
}
