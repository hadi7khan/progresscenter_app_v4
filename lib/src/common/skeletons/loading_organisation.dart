import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingOrganisation extends StatelessWidget {
  const LoadingOrganisation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
              titleSpacing: 12.0.w,
              leadingWidth: 24,
              title: Skeleton(
                variant: "text",
                height: 20.h,
                width: 72.w,
                borderRadius: 10.r,
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Helper.widgetBackground,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Skeleton(
                        variant: "text",
                        height: 72.h,
                        width: 72.w,
                        borderRadius: 36.r,
                      ),
                      SizedBox(width: 10.h),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Skeleton(
                            variant: "text",
                            height: 30.h,
                            width: 150.w,
                            borderRadius: 15.r,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Skeleton(
                    variant: "text",
                    height: 15.h,
                    width: 100.w,
                    borderRadius: 36.r,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Helper.widgetBackground,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Skeleton(
                              variant: "text",
                              height: 15.h,
                              width: 130.w,
                              borderRadius: 36.r,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 16.w,
                              ),
                              child: Skeleton(
                                variant: "text",
                                height: 15.h,
                                width: 130.w,
                                borderRadius: 36.r,
                              ),
                            )
                          ],
                        ),
                        Divider(
                          thickness: 0.1,
                          color: Helper.textColor700,
                        ),
                        // SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Skeleton(
                              variant: "text",
                              height: 15.h,
                              width: 130.w,
                              borderRadius: 36.r,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 16.w,
                              ),
                              child: Row(
                                children: [
                                  Skeleton(
                                    variant: "text",
                                    height: 15.h,
                                    width: 130.w,
                                    borderRadius: 36.r,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: Skeleton(
                    variant: "text",
                    height: 15.h,
                    width: 120.w,
                    borderRadius: 36.r,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 16.w, top: 12.h, bottom: 12.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Helper.widgetBackground,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Skeleton(
                              variant: "text",
                              height: 15.h,
                              width: 130.w,
                              borderRadius: 36.r,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                right: 16.w,
                              ),
                              child: Skeleton(
                                variant: "text",
                                height: 15.h,
                                width: 130.w,
                                borderRadius: 36.r,
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
