import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/sign_in_screen.dart';

class DeleteAccountScreen extends StatefulWidget {
  const DeleteAccountScreen({super.key});

  @override
  State<DeleteAccountScreen> createState() => _DeleteAccountScreenState();
}

class _DeleteAccountScreenState extends State<DeleteAccountScreen> {
  TextEditingController _deleteController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  bool _changeState = false;
  final locator = getIt.get<SharedPreferenceHelper>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                centerTitle: false,
                titleSpacing: 12.0.w,
                leading: InkWell(
                  onTap: () {
                    context.pop();
                  },
                  child: Transform.rotate(
                    angle: 180 * (3.1415926535 / 180),
                    child: SvgPicture.asset('assets/images/chevron-right.svg',
                        color: Helper.iconColor, fit: BoxFit.contain),
                  ),
                ),
                leadingWidth: 24,
                title: Text(
                  "Delete Account",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'To confirm, type "delete account" in the box below',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    FormBuilderTextField(
                      name: 'currentPassword',
                      controller: _deleteController,
                      onChanged: (text) {
                        setState(() {
                          if (_deleteController.text == "delete account") {
                            _changeState = true;
                          } else {
                            _changeState = false;
                          }
                        });
                      },
                      onSubmitted: (text) {
                        setState(() {
                          if (_deleteController.text == "delete account") {
                            _changeState = true;
                          } else {
                            _changeState = false;
                          }
                        });
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Field is required';
                        }
                        // if (val.length < 5) {
                        //   return 'Password is short';
                        // }
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.streetAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "Enter text",
                        hintStyle: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Helper.textColor300),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: BorderSide(color: Helper.primary),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: 48.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Delete Account",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                                // currentIndex == contents.length - 1 ? "Continue" : "Next"
                              ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                _changeState
                                    ? Helper.errorColor
                                    : Helper.blendmode),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            )),
                        onPressed: () async {
                          if (_deleteController.text == "delete account") {
                            setState(() {
                              isLoading = true;
                            });
                            if (_fbKey.currentState!.saveAndValidate()) {
                              setState(() {
                                isLoading = true;
                              });

                              // WidgetsBinding.instance.addPostFrameCallback((_) {
                              //   Navigator.pushReplacement(
                              //     context,
                              //     MaterialPageRoute<void>(
                              //       builder: (BuildContext context) =>
                              //           const SignInScreen(),
                              //     ),
                              //   );
                              // });

                              Platform.isIOS
                                  ? showCupertinoDialog(
                                      context: context,
                                      builder: (context) =>
                                          CupertinoAlertDialog(
                                        title: Text(
                                          "Are you sure you want to delete this account ",
                                        ),
                                        content: Text(
                                          "You cannot undo this action ",
                                        ),
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
                                              isDestructiveAction: true,
                                              child: Text(
                                                "Delete",
                                                style: TextStyle(
                                                  color: Helper.errorColor,
                                                ),
                                              ),
                                              onPressed: () async {
                                                await Service()
                                                    .deleteAccount()
                                                    .then((value) {
                                                  locator
                                                      .logout()
                                                      .then((value) {
                                                    context.go('/signin');
                                                  });

                                                  Utils.toastSuccessMessage(
                                                      "Account deleted");
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                }).onError((error, stackTrace) {
                                                  setState(() {
                                                    isLoading = false;
                                                  });
                                                  Utils.flushBarErrorMessage(
                                                      "Something went wrong",
                                                      context);
                                                });
                                                setState(() {});
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
                                              borderRadius:
                                                  BorderRadius.circular(14.r),
                                            ),
                                            content: StatefulBuilder(builder:
                                                (BuildContext context,
                                                    StateSetter setState) {
                                              return SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(
                                                        text:
                                                            "Are you sure you want to delete this ",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Helper
                                                                .textColor500),
                                                        children: [
                                                          TextSpan(
                                                            text: "account",
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Helper
                                                                    .baseBlack),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }),
                                            actionsPadding:
                                                const EdgeInsets.only(
                                                    left: 32,
                                                    bottom: 32,
                                                    right: 32),
                                            actions: [
                                              TextButton(
                                                onPressed: () async {
                                                  await Service()
                                                      .deleteAccount()
                                                      .then((value) {
                                                    locator
                                                        .logout()
                                                        .then((value) {
                                                      context.go('/signin');
                                                    });
                                                    Utils.toastSuccessMessage(
                                                        "Account deleted");
                                                    setState(() {
                                                      isLoading = false;
                                                    });
                                                  }).onError(
                                                          (error, stackTrace) {
                                                    setState(() {
                                                      isLoading = false;
                                                    });
                                                    Utils.flushBarErrorMessage(
                                                        "Something went wrong",
                                                        context);
                                                  });
                                                  setState(() {});
                                                },
                                                style: TextButton.styleFrom(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16,
                                                        vertical: 11),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                    ),
                                                    backgroundColor:
                                                        Helper.errorColor,
                                                    fixedSize: Size.infinite),
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  context.pop();
                                                },
                                                style: TextButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                    ),
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 16,
                                                        vertical: 11),
                                                    backgroundColor:
                                                        Colors.white,
                                                    side: BorderSide(
                                                        color: Helper
                                                            .textColor300),
                                                    fixedSize: Size.infinite),
                                                child: Text(
                                                  "Cancel",
                                                  style: TextStyle(
                                                      color:
                                                          Helper.textColor500,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ],
                                            actionsAlignment:
                                                MainAxisAlignment.center,
                                          ),
                                        );
                                      }),
                                    );
                            }
                          } else {
                            setState(() {
                              isLoading = false;
                            });
                          }
                          setState(() {
                            isLoading = false;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
