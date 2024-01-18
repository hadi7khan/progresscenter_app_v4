import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingUserProfile extends StatefulWidget {
  const LoadingUserProfile({super.key});

  @override
  State<LoadingUserProfile> createState() => _LoadingUserProfileState();
}

class _LoadingUserProfileState extends State<LoadingUserProfile> {
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
                width: 90.w,
                borderRadius: 5.r,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
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
                        SizedBox(
                          height: 5.h,
                        ),
                        Skeleton(
                          variant: "text",
                          height: 20.h,
                          width: 130.w,
                          borderRadius: 15.r,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Skeleton(
                  variant: "text",
                  height: 15.h,
                  width: 100.w,
                  borderRadius: 36.r,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                ),
                child: Column(children: [
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
                          width: 60.w,
                          borderRadius: 36.r,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h),
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
                          width: 60.w,
                          borderRadius: 36.r,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h),
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
                          width: 60.w,
                          borderRadius: 36.r,
                        ),
                      )
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 12.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 16.w),
                child: Skeleton(
                  variant: "text",
                  height: 15.h,
                  width: 100.w,
                  borderRadius: 36.r,
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                ),
                child: Column(children: [
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Skeleton(
                        variant: "text",
                        height: 15.h,
                        width: 100.w,
                        borderRadius: 36.r,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 16.w,
                        ),
                        child: Skeleton(
                          variant: "text",
                          height: 15.h,
                          width: 50.w,
                          borderRadius: 36.r,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Skeleton(
                        variant: "text",
                        height: 15.h,
                        width: 100.w,
                        borderRadius: 36.r,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: 16.w,
                        ),
                        child: Skeleton(
                          variant: "text",
                          height: 15.h,
                          width: 50.w,
                          borderRadius: 36.r,
                        ),
                      )
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Skeleton(
                        variant: "text",
                        height: 15.h,
                        width: 100.w,
                        borderRadius: 36.r,
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
                          return ListTile(
                            leading: Skeleton(
                              variant: "rectangular",
                              height: 40.h,
                              width: 40.w,
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
                              width: 40.w,
                              borderRadius: 15.r,
                            ),
                            trailing: Skeleton(
                              variant: "text",
                              height: 20.h,
                              width: 40.w,
                              borderRadius: 10.r,
                            ),
                          );
                        }),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
