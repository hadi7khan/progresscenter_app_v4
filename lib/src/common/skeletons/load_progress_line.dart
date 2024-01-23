import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingProgressline extends StatelessWidget {
  const LoadingProgressline({super.key});

  @override
  Widget build(BuildContext context) {
    final height = (MediaQuery.of(context).size.width - (2 * 20)) / 1.5;
    return ListView.separated(
      separatorBuilder: (context, index) {
        return SizedBox(height: 16.h);
      },
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: BouncingScrollPhysics(),
      itemCount: 7,
      itemBuilder: ((context, index) {
        return Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            color: Helper.widgetBackground,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              ListTile(
                horizontalTitleGap: 8.w,
                leading: Skeleton(
                  variant: "text",
                  height: 24.h,
                  width: 24.w,
                  borderRadius: 12.r,
                ),
                title: Skeleton(
                  variant: "text",
                  height: 20.h,
                  width: 150.w,
                  borderRadius: 15.r,
                ),
                trailing: Skeleton(
                  variant: "text",
                  height: 20.h,
                  width: 70.w,
                  borderRadius: 15.r,
                ),
              ),
              Stack(fit: StackFit.loose, children: [
                Positioned(
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                      child: AspectRatio(
                        aspectRatio: 1.5,
                        child: Skeleton(
                          variant: "rectangular",
                        ),
                      )),
                ),
                Container(
                    margin: EdgeInsets.only(top: height - 15),
                    // height: 88.h,
                    width: double.infinity,
                    // margin: EdgeInsets.zero,
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        color: Color.fromRGBO(246, 246, 246, 1)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          horizontalTitleGap: 8.w,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                            padding: EdgeInsets.all(4.w),
                            child: Skeleton(
                              variant: "rectangular",
                              borderRadius: 16.r,
                              width: 24,
                              height: 24,
                            ),
                          ),
                          title: Skeleton(
                            variant: 'text',
                            width: 10.w,
                            height: 10.h,
                            borderRadius: 8.r,
                          ),
                          trailing: Skeleton(
                            variant: 'text',
                            width: 60.w,
                            height: 10.h,
                            borderRadius: 8.r,
                          ),
                        ),
                        ListTile(
                            horizontalTitleGap: 8.w,
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            leading: Skeleton(
                              variant: "text",
                              height: 32.h,
                              width: 32.w,
                              borderRadius: 16.r,
                            ),
                            title: Skeleton(
                              variant: "rectangular",
                              borderRadius: 16.r,
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                            )),
                      ],
                    )),
              ]),
            ],
          ),
        );
      }),
    );
  }
}
