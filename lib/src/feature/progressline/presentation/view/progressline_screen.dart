import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

import 'widgets/feed_widget.dart';

class ProgresslineScreen extends StatefulWidget {
  final String label;
  final String detailsPath;
  const ProgresslineScreen({super.key, required this.label, required this.detailsPath});

  @override
  State<ProgresslineScreen> createState() => _ProgresslineScreenState();
}

class _ProgresslineScreenState extends State<ProgresslineScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset('assets/images/home.svg'),
                    Row(
                      children: [
                        SvgPicture.asset('assets/images/search.svg'),
                        SizedBox(width: 12.w),
                        SvgPicture.asset('assets/images/sort.svg'),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Feed",
                      style: TextStyle(
                          color: Helper.textColor700,
                          fontSize: 36.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(height: 15.h),
                FeedWidget(),
              ],
            ),
          ),
        )),
      ),
    );
  }
}