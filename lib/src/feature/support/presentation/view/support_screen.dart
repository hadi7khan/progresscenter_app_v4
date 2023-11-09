import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/widgets/support_widget.dart';

class SupportScreen extends StatefulWidget {
  final label;
  final detailsPath;
  const SupportScreen({super.key, this.label, this.detailsPath});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      SizedBox(width: 12.w),
                      InkWell(
                          onTap: () {
                            // _showUserBottomSheet(context);
                          },
                          child: SvgPicture.asset('assets/images/plus.svg')),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Support",
                    style: TextStyle(
                        color: Helper.textColor700,
                        fontSize: 36.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              SupportWidget(),
            ],
          ),
        ),
      )),
    );
  }
}
