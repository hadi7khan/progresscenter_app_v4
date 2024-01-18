import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';

class LoadingAddUser2 extends StatelessWidget {
  const LoadingAddUser2({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomInputWidget(
          title: "  ",
          formField: Skeleton(
            variant: "text",
            height: 40.h,
            width: MediaQuery.of(context).size.width,
            borderRadius: 8.r,
          ),
        ),
        SizedBox(height: 12.h),
        CustomInputWidget(
          title: " ",
          formField: Skeleton(
            variant: "text",
            height: 40.h,
            width: MediaQuery.of(context).size.width,
            borderRadius: 8.r,
          ),
        ),
        SizedBox(height: 16.h),
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
      ],
    );
  }
}
