import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/change_password_controller.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  final token;
  const ChangePasswordScreen({super.key, this.token});

  @override
  ConsumerState<ChangePasswordScreen> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState
    extends BaseConsumerState<ChangePasswordScreen> {
  TextEditingController _newPasswordcontroller = TextEditingController();
  TextEditingController _retypePasswordcontroller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  bool _obscurePasswordretype = true;
  bool isLoading = false;
  bool _changeState = false;
  bool passwordNotMatched = false;

  void togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void retypetogglePassword() {
    setState(() {
      _obscurePasswordretype = !_obscurePasswordretype;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          // appBar: AppBar(iconTheme: IconThemeData(color: Helper.secondary)),
          body: SafeArea(
              child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 24.h,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        icon: Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: () => context.pop(),
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    SvgPicture.asset("assets/images/progress_tick.svg"),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      "Choose new password",
                      style: TextStyle(
                          letterSpacing: Platform.isIOS ? -1 : -0.6,
                          color: Helper.baseBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 28.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Create a new password that is atleast 8 characters long.",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.color128,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      "New Password",
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
                      name: 'newpassword',
                      controller: _newPasswordcontroller,
                      obscureText: _obscurePassword,
                      // onChanged: (text) {
                      //   setState(() {});
                      //   _changeState = true;
                      // },
                      // onSubmitted: (text){
                      //   setState(() {
                      //     _changeState = true;
                      //   });
                      // },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Password is required';
                        }
                        if (val.length < 5) {
                          return 'Password is short';
                        }
                        return null;
                      },
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: togglePassword,
                          child: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: Helper.textColor400,
                              size: 16),
                        ),
                        // hintText: widget.control.label,
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
                    SizedBox(height: 28.h),
                    Text(
                      "Retype new password",
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
                      name: 'retypepassword',
                      controller: _retypePasswordcontroller,
                      obscureText: _obscurePasswordretype,
                      onChanged: (text) {
                        setState(() {});
                        _changeState = true;
                        passwordNotMatched = false;
                      },
                      onSubmitted: (text) {
                        setState(() {
                          _changeState = true;
                          passwordNotMatched = false;
                        });
                      },
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Password is required';
                        }
                        if (val.length < 5) {
                          return 'Password is short';
                        }
                        return null;
                      },
                      obscuringCharacter: '*',
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "Retype Password",
                        hintStyle: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: retypetogglePassword,
                          child: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility,
                              color: Helper.textColor400,
                              size: 16),
                        ),
                        // hintText: widget.control.label,
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
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: passwordNotMatched ? 6.h : 0),
                    passwordNotMatched
                        ? Text(
                            "Password not matching",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.errorColor,
                                fontWeight: FontWeight.w400),
                          )
                        : SizedBox(),
                    SizedBox(height: 28.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: isLoading
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Reset Password",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                                // currentIndex == contents.length - 1 ? "Continue" : "Next"
                              ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                _changeState
                                    ? Helper.primary
                                    : Helper.blendmode),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            )),
                        onPressed: () async {
                          // context.push('/forgotpassword');
                          if (_newPasswordcontroller.text ==
                              _retypePasswordcontroller.text) {
                            Map<String, dynamic> data = {
                              "password": _newPasswordcontroller.text,
                            };
                            setState(() {
                              isLoading = true;
                            });
                            if (_fbKey.currentState!.saveAndValidate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await ref
                                  .watch(changePasswordProvider.notifier)
                                  .changePass(data, widget.token)
                                  .then((value) {
                                context.pushReplacement('/signin');
                                Utils.toastSuccessMessage(
                                    "Password changed Successfully", context);
                                setState(() {
                                  isLoading = false;
                                });
                              });
                            }
                          } else {
                            setState(() {
                              isLoading = false;
                              passwordNotMatched = true;
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
          )),
        ),
      ),
    );
  }
}
