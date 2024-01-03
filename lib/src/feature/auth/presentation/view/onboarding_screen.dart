import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/models/content_model.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});
  @override
  _OnBordingScreenState createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                // fit: FlexFit.loose,
                // flex: 6,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: contents.length,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, i) {
                    return Stack(
                        alignment: AlignmentDirectional.topCenter,
                        fit: StackFit.loose,
                        children: [
                          SvgPicture.asset(
                            contents[i].image!,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.6,
                          ),
                          Positioned(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            bottom: 0,
                            child: Container(
                              margin: EdgeInsets.zero,
                              padding: EdgeInsets.only(
                                  top: 40.h, left: 20.w, right: 20.w),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30.r),
                                  topRight: Radius.circular(30.r),
                                ),
                              ),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      contents[i].title!,
                                      style: TextStyle(
                                        letterSpacing: -1,
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Helper.textColor800,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      contents[i].discription!,
                                      style: TextStyle(
                                        letterSpacing: -0.3,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Helper.textColor600,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ]);
                  },
                ),
              ),
              Container(
                color: Colors.white,
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 30.h),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(
                          contents.length,
                          (index) => buildDot(index, context),
                        ),
                      ),
                    ),
                    SizedBox(height: 34.h),
                    Column(
                      children: [
                        Container(
                          height: 52.h,
                          width: double.infinity,
                          margin: EdgeInsets.all(20.w),
                          child: ElevatedButton(
                            child: Text(
                              "Sign in",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                              // currentIndex == contents.length - 1 ? "Continue" : "Next"
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Helper.primary),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                )),
                            onPressed: () {
                              context.pushReplacement('/signin');
                              // if (currentIndex == contents.length - 1) {
                              //   Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (_) => Home(),
                              //     ),
                              //   );
                              // }
                              // _controller!.nextPage(
                              //   duration: Duration(milliseconds: 100),
                              //   curve: Curves.bounceIn,
                              // );
                            },
                          ),
                        ),
                        Text(
                          "Get in touch",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                          // currentIndex == contents.length - 1 ? "Continue" : "Next"
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 6.h,
      width: currentIndex == index ? 24.w : 13.w,
      margin: EdgeInsets.only(right: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: currentIndex == index ? Helper.primary : Helper.textColor300,
      ),
    );
  }
}
