import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final locator = getIt.get<SharedPreferenceHelper>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        color: Helper.primary,
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          return null;
        },
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
                      InkWell(
                          onTap: () {
                            context.push('/notifications');
                          },
                          child: SvgPicture.asset('assets/images/home.svg')),
                      // Row(
                      //   children: [
                      //     SvgPicture.asset('assets/images/search.svg'),
                      //     SizedBox(width: 12.w),
                      //     InkWell(
                      //         onTap: () {
                      //           context.push('/createTicket');
                      //         },
                      //         child: SvgPicture.asset(
                      //             'assets/images/plus.svg')),
                      //   ],
                      // ),
                    ],
                  ),
                  SizedBox(height: 14.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account",
                        style: TextStyle(
                            letterSpacing: -1,
                            color: Helper.textColor700,
                            fontSize: 36.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(16.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      color: Helper.screenBackground,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          minRadius: 30,
                          child: Text("Y"),
                        ),
                        // AvatarWidget(
                        //   dpUrl: data.dp != null ? data.dpUrl : "",
                        //   name: data.name,
                        //   backgroundColor: data.preset.color,
                        //   size: 50,
                        //   fontSize: 24,
                        // ),
                        SizedBox(width: 10.h),
                        Wrap(
                          direction: Axis.vertical,

                          // mainAxisSize: MainAxisSize.min,
                          // crossAxisAlignment:
                          //     CrossAxisAlignment.start,
                          // mainAxisAlignment:
                          //     MainAxisAlignment.start,
                          children: [
                            Text(
                              "Yafer Nazir",
                              style: TextStyle(
                                  height: 1.1,
                                  letterSpacing: -0.3,
                                  color: Helper.baseBlack,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                            // SizedBox(
                            //   height: -0.5,
                            // ),
                            Text(
                              "developer",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.baseBlack.withOpacity(0.5),
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  // Center(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     mainAxisSize: MainAxisSize.max,
                  //     children: [
                  //       // AvatarWidget(
                  //       //     dpUrl:
                  //       //         data.dp != null ? data.dpUrl : "",
                  //       //     name: data.name,
                  //       //     backgroundColor: data.preset.color,
                  //       //     size: 72),
                  //       CircleAvatar(
                  //         backgroundColor: Helper.widgetBackground,
                  //         minRadius: 36,
                  //         child: Text("H"),
                  //       ),
                  //       SizedBox(height: 16.h),
                  //       Text(
                  //         "Mahesh Jethani",
                  //         style: TextStyle(
                  //             letterSpacing: -0.3,
                  //             color: Helper.baseBlack,
                  //             fontSize: 16.sp,
                  //             fontWeight: FontWeight.w500),
                  //       ),
                  //       Text(
                  //         "View Profile",
                  //         style: TextStyle(
                  //             letterSpacing: -0.3,
                  //             color: Helper.textColor600,
                  //             fontSize: 12.sp,
                  //             fontWeight: FontWeight.w400),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Helper.widgetBackground),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: SvgPicture.asset('assets/images/profile.svg'),
                      title: Text(
                        "Organisation Profil",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Helper.widgetBackground),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: SvgPicture.asset('assets/images/profile.svg'),
                      title: Text(
                        "Notification Settings",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Helper.widgetBackground),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: SvgPicture.asset('assets/images/profile.svg'),
                      title: Text(
                        "Privacy Policy",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.r),
                        color: Helper.widgetBackground),
                    child: ListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                      leading: SvgPicture.asset('assets/images/profile.svg'),
                      title: Text(
                        "Terms of service",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor700,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/support');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Helper.primary.withOpacity(0.07)),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: SvgPicture.asset(
                          'assets/images/headphones.svg',
                          color: Helper.primary,
                        ),
                        title: Text(
                          "Support & Feedback",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.primary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "Please allow us to assist you",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.primary,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 32.h,
                  ),
                  InkWell(
                    onTap: () {
                      locator.logout().then((value) {
                        context.pushReplacement("/signin");
                      });
                    },
                    child: Center(
                      child: Text(
                        "Sign out from my account",
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.errorColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  )
                ],
              )),
        ),
      )),
    );
  }
}
