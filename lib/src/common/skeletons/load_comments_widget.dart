import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadCommentsWidget extends StatefulWidget {
  const LoadCommentsWidget({super.key});

  @override
  State<LoadCommentsWidget> createState() => _LoadCommentsWidgetState();
}

class _LoadCommentsWidgetState extends State<LoadCommentsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
        color: Colors.white,
      ),
      // height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 16.h);
              },
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: ((context, index) {
                return ListTile(
                  horizontalTitleGap: 8.w,
                  dense: true,
                  visualDensity: VisualDensity(horizontal: 0, vertical: -4),
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
      ),
    );
  }
}
