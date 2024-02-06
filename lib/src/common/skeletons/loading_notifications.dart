import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingNotification extends StatefulWidget {
  const LoadingNotification({super.key});

  @override
  State<LoadingNotification> createState() => _LoadingTeamListState();
}

class _LoadingTeamListState extends State<LoadingNotification> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
      ),
      child: Expanded(
        child: ListView.separated(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Skeleton(
                  variant: "text",
                  height: 20.h,
                  width: 100.w,
                  borderRadius: 10.r,
                ),
                SizedBox(height: 10.h),
                Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
                    decoration: BoxDecoration(
                        color: Helper.widgetBackground,
                        borderRadius: BorderRadius.circular(16.r)),
                    child: Wrap(
                      children: [
                        Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Skeleton(
                                    variant: "circular",
                                    height: 32.h,
                                    width: 32.w,
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Skeleton(
                                          variant: "text",
                                          height: 20.h,
                                          width: 200.w,
                                          borderRadius: 10.r,
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        Skeleton(
                                          variant: "text",
                                          height: 20.h,
                                          width: 200.w,
                                          borderRadius: 10.r,
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Icon(
                                    Icons.circle,
                                    color: Helper.widgetBackground,
                                    size: 8,
                                  )
                                ],
                              ),
                              Divider(
                                thickness: 1,
                                color: Helper.baseBlack.withOpacity(0.06),
                              )
                            ],
                          ),
                        )
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
          itemCount: 6,
        ),
      ),
    );
  }
}
