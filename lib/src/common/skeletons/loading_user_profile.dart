import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';

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
              titleSpacing: 12.0.w,
              // leading: InkWell(
              //   onTap: () {
              //     context.pop();
              //   },
              //   child: SvgPicture.asset(
              //     'assets/images/arrow-left.svg',
              //   ),
              // ),
              leadingWidth: 24,
              title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Skeleton(
                      variant: "text",
                      height: 20.h,
                      width: 90.w,
                      borderRadius: 5.r,
                    ),
                    SizedBox(height: 5.h),
                    Skeleton(
                      variant: "text",
                      height: 10.h,
                      width: 90.w,
                      borderRadius: 5.r,
                    ),
                  ]),
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
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Skeleton(
                      variant: "text",
                      height: 72.h,
                      width: 72.w,
                      borderRadius: 36.r,
                    ),
                    SizedBox(height: 16.h),
                    Skeleton(
                      variant: "text",
                      height: 20.h,
                      width: 90.w,
                      borderRadius: 10.r,
                    ),
                    SizedBox(height: 5.h),
                    Skeleton(
                      variant: "text",
                      height: 15.h,
                      width: 100.w,
                      borderRadius: 10.r,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
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
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: Skeleton(
                              variant: "text",
                              height: 15.h,
                              width: 60,
                              borderRadius: 8.r,
                            ),
                          ),
                          Skeleton(
                            variant: "text",
                            height: 15.h,
                            width: 40,
                            borderRadius: 6.r,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: Skeleton(
                              variant: "text",
                              height: 15.h,
                              width: 60,
                              borderRadius: 8.r,
                            ),
                          ),
                          Skeleton(
                            variant: "text",
                            height: 15.h,
                            width: 40,
                            borderRadius: 6.r,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: Skeleton(
                              variant: "text",
                              height: 15.h,
                              width: 60,
                              borderRadius: 8.r,
                            ),
                          ),
                          Skeleton(
                            variant: "text",
                            height: 15.h,
                            width: 40,
                            borderRadius: 6.r,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(bottom: 6.h),
                            child: Skeleton(
                              variant: "text",
                              height: 15.h,
                              width: 60,
                              borderRadius: 8.r,
                            ),
                          ),
                          Skeleton(
                            variant: "text",
                            height: 20.h,
                            width: 40.w,
                            borderRadius: 10.r,
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: Colors.white,
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInputWidget(
                        title: " ",
                        formField: Skeleton(
                          variant: "text",
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 8.r,
                        ),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      CustomInputWidget(
                        title: " ",
                        formField: Skeleton(
                          variant: "text",
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 8.r,
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 12.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.w),
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
                        height: 20.h,
                        width: 80.w,
                        borderRadius: 15.r,
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
                              // color: Helper.widgetBackground,
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: ListTile(
                              leading: Container(
                                child: Skeleton(
                                  variant: "rectangular",
                                  height: 40.h,
                                  width: 80.w,
                                ),
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
