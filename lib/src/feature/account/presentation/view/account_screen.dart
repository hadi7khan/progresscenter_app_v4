import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/provider/accounts_controller.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class AccountScreen extends ConsumerStatefulWidget {
  const AccountScreen({super.key});

  @override
  ConsumerState<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends BaseConsumerState<AccountScreen> {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  Map<String, dynamic>? user;

  @override
  void initState() {
    super.initState();
    fetchUser();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref.read(accountsControllerProvider.notifier).getProfile();
    // });
  }

  fetchUser() {
    user = _prefsLocator.getUser();
  }

  @override
  void dispose() {
    // ref.invalidate(accountsControllerProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final accountData =
    //     ref.watch(accountsControllerProvider.select((value) => value.account));
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        displacement: 10.0,
        color: ref.watch(primaryColorProvider),
        onRefresh: () async {
          HapticFeedback.mediumImpact();
          return await ref
              .refresh(accountsControllerProvider.notifier)
              .getProfile();
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
                  InkWell(
                    onTap: () {
                      context.push("/profile");
                    },
                    child: Container(
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
                          // CircleAvatar(
                          //   backgroundColor: Colors.white,
                          //   minRadius: 30,
                          //   child: Text("Y"),
                          // ),
                          AvatarWidget(
                            dpUrl: user!['dpUrl'] != null ? user!['dpUrl'] : "",
                            name: user!['name'],
                            backgroundColor: user!['preset']['color'],
                            size: 50,
                            fontSize: 24,
                          ),
                          SizedBox(width: 10.h),
                          Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text(
                                user!['name'],
                                style: TextStyle(
                                    height: 1.1,
                                    letterSpacing: -0.3,
                                    color: Helper.baseBlack,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                user!['designation'] != null
                                    ? user!['designation']
                                    : "-",
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
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/organisation');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 10.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Helper.widgetBackground),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: SvgPicture.asset('assets/images/profile.svg'),
                        title: Text(
                          "Organisation Profile",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor700,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
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
                          color: ref
                              .watch(primaryColorProvider)
                              .withOpacity(0.07)),
                      child: ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4),
                        leading: SvgPicture.asset(
                          'assets/images/headphones.svg',
                          color: ref.watch(primaryColorProvider),
                        ),
                        title: Text(
                          "Support & Feedback",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: ref.watch(primaryColorProvider),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          "Please allow us to assist you",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: ref.watch(primaryColorProvider),
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
                      Platform.isIOS
                          ? showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: Text(
                                  "Are you sure you want to sign out ",
                                ),
                                // content: Text(
                                //   "You cannot undo this action ",
                                // ),
                                actions: <Widget>[
                                  // if (cancelActionText != null)

                                  CupertinoDialogAction(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                  ),
                                  CupertinoDialogAction(
                                      child: Text(
                                        "Sign out",
                                        style: TextStyle(
                                          color: Helper.errorColor,
                                        ),
                                      ),
                                      onPressed: () async {
                                        _prefsLocator.logout().then((value) {
                                          context.pushReplacement("/signin");
                                        });
                                      }),
                                ],
                              ),
                            )
                          : showDialog(
                              context: context,
                              builder: ((context) {
                                return FormBuilder(
                                  child: AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.r),
                                    ),
                                    content: StatefulBuilder(builder:
                                        (BuildContext context,
                                            StateSetter setState) {
                                      return SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            RichText(
                                              text: TextSpan(
                                                text:
                                                    "Are you sure you want to sign out ",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w500,
                                                    color: Helper.textColor500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    actionsPadding: const EdgeInsets.only(
                                        left: 32, bottom: 32, right: 32),
                                    actions: [
                                      TextButton(
                                        onPressed: () async {
                                          _prefsLocator.logout().then((value) {
                                            context.pushReplacement("/signin");
                                          });
                                        },
                                        style: TextButton.styleFrom(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 11),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            backgroundColor: Helper.errorColor,
                                            fixedSize: Size.infinite),
                                        child: const Text(
                                          "Sign Out",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          context.pop();
                                        },
                                        style: TextButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.r),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 11),
                                            backgroundColor: Colors.white,
                                            side: BorderSide(
                                                color: Helper.textColor300),
                                            fixedSize: Size.infinite),
                                        child: Text(
                                          "Cancel",
                                          style: TextStyle(
                                              color: Helper.textColor500,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                    actionsAlignment: MainAxisAlignment.center,
                                  ),
                                );
                              }),
                            );
                    },
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Sign out from my account",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.errorColor,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          "Version 4.0.0",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor400,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        ),
      )),
    );
  }
}
