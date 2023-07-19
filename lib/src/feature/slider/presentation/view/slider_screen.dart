import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SliderScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const SliderScreen(
      {super.key, required this.projectId, required this.projectName});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.only(right: 16.w, left: 16.w),
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              leading: SvgPicture.asset(
                'assets/images/arrow-left.svg',
              ),
              leadingWidth: 24,
              title: Text(
                "Progress Slider",
                style: TextStyle(
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actions: [
                SvgPicture.asset('assets/images/dots-vertical.svg'),
              ],
              actionsIconTheme: IconThemeData(color: Helper.iconColor),
            ),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: EdgeInsets.symmetric(vertical: 164.h),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.network(
                  "https://dzcod3r4qkmhl.cloudfront.net/6699/previews/20191224145446.jpg",
                  width: double.infinity,
                  // height: 210.h,
                  fit: BoxFit.fill,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return ClipRRect(
                      child: Image.asset(
                        'assets/images/error_image.jpeg',
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              Slider.adaptive(
                activeColor: Helper.primary,
                thumbColor: Colors.white,
                max: 100,

                value: _currentSliderValue, onChanged: (value){
                  setState((){
                    _currentSliderValue = value;
                  });
                })
            ],
          ),
        ))));
  }
}
