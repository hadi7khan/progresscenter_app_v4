import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/sekeleton.dart';

class LoadingSiteGallery extends StatefulWidget {
  const LoadingSiteGallery({super.key});

  @override
  State<LoadingSiteGallery> createState() => _LoadingSiteGalleryState();
}

class _LoadingSiteGalleryState extends State<LoadingSiteGallery> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width / 3,
            mainAxisSpacing: 1.5.h,
            crossAxisSpacing: 1.5.w,
            childAspectRatio: 1 / 1,
          ),
          itemCount: 50,
          itemBuilder: ((context, index) {
            return AspectRatio(
              aspectRatio: 1 / 1,
              child: Skeleton(
                variant: 'rectangular',
                // width: 30.w,
                // height: 30.h,
              ),
            );
          }),
        ),
      ],
    );
  }
}
