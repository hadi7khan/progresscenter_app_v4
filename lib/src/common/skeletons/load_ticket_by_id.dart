import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class LoadingTicketById extends StatefulWidget {
  const LoadingTicketById({super.key});

  @override
  State<LoadingTicketById> createState() => _LoadingTicketByIdState();
}

class _LoadingTicketByIdState extends State<LoadingTicketById> {
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Skeleton(
                  variant: "text",
                  height: 20.h,
                  width: 70.w,
                  borderRadius: 8.r,
                ),
                SizedBox(height: 12.h),
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    color: Colors.white,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Skeleton(
                          variant: "text",
                          height: 30.h,
                          width: 130.w,
                          borderRadius: 8.r,
                        ),
                        SizedBox(height: 12.h),
                        Skeleton(
                          variant: "text",
                          height: 25.h,
                          width: 180.w,
                          borderRadius: 8.r,
                        ),
                        SizedBox(height: 10.h),
                        Skeleton(
                          variant: "text",
                          height: 10.h,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 8.r,
                        ),
                        SizedBox(height: 5.h),
                        Skeleton(
                          variant: "text",
                          height: 10.h,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 8.r,
                        ),
                        SizedBox(height: 5.h),
                        Skeleton(
                          variant: "text",
                          height: 10.h,
                          width: MediaQuery.of(context).size.width,
                          borderRadius: 8.r,
                        ),
                        ListTile(
                          horizontalTitleGap: 8.w,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: Skeleton(
                            variant: "text",
                            height: 20.h,
                            width: 20.w,
                            borderRadius: 10.r,
                          ),
                          title: Skeleton(
                            variant: "text",
                            height: 20.h,
                            width: 100.w,
                            borderRadius: 8.r,
                          ),
                        ),
                        ListTile(
                          horizontalTitleGap: 8.w,
                          dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.zero,
                          leading: Skeleton(
                            variant: "text",
                            height: 20.h,
                            width: 20.w,
                            borderRadius: 10.r,
                          ),
                          title: Skeleton(
                            variant: "text",
                            height: 20.h,
                            width: 100.w,
                            borderRadius: 8.r,
                          ),
                        ),
                      ]),
                ),
                SizedBox(
                  height: 24.h,
                ),
                Skeleton(
                  variant: "text",
                  height: 20.h,
                  width: 100.w,
                  borderRadius: 8.r,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // Define the list of indices for centerRight alignment
                    List<int> centerRightIndices = [0, 2, 4, 6, 8];
                    return Align(
                      alignment: centerRightIndices.contains(index)
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Helper.widgetBackground,
                          borderRadius: BorderRadius.only(
                            topLeft: centerRightIndices.contains(index)
                                ? Radius.circular(8.r)
                                : Radius.circular(0),
                            topRight: centerRightIndices.contains(index)
                                ? Radius.circular(0)
                                : Radius.circular(8.r),
                            bottomLeft: Radius.circular(8.r),
                            bottomRight: Radius.circular(8.r),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Skeleton(
                                  variant: "text",
                                  height: 10.h,
                                  width: 50.w,
                                  borderRadius: 8.r,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Skeleton(
                              variant: "text",
                              height: 20.h,
                              width: MediaQuery.of(context).size.width,
                              borderRadius: 8.r,
                            ),
                            const SizedBox(height: 4.0),
                            Skeleton(
                              variant: "text",
                              height: 5.h,
                              width: 40.w,
                              borderRadius: 8.r,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
