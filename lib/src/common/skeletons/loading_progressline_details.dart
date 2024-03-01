import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingProgresslineDetails extends StatelessWidget {
  const LoadingProgresslineDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          AspectRatio(
              aspectRatio: 16 / 9, child: Skeleton(variant: "rectangular")),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r)),
                  color: Colors.white,
                ),
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Skeleton(
                          variant: 'text',
                          width: 100,
                        )
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4.h,
                          child: ListView.separated(
                            separatorBuilder: (context, index) {
                              return SizedBox(height: 16.h);
                            },
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: ((context, index) {
                              return ListTile(
                                horizontalTitleGap: 8.w,
                                dense: true,
                                visualDensity:
                                    VisualDensity(horizontal: 0, vertical: -4),
                                contentPadding: EdgeInsets.zero,
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(32.r),
                                  child: Skeleton(
                                    variant: "rectangular",
                                    height: 32.h,
                                    width: 32.w,
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
                                  width: 70.w,
                                  borderRadius: 10.r,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                top: 10,
                left: 20,
                child: Row(
                  children: [
                    Skeleton(
                      variant: 'text',
                      width: 20,
                      borderRadius: 40,
                    ),
                    SizedBox(width: 10.w),
                    Skeleton(
                      variant: 'text',
                      width: 20,
                      height: 10,
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
