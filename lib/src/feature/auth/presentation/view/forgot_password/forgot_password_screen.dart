import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/data/extension.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/forgot_password_controller.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState
    extends BaseConsumerState<ForgotPasswordScreen> {
  TextEditingController _verifyemailcontroller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _changeState = false;
  bool isLoading = false;
  bool _validate = false;
  FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) {
        setState(() {
          _validate = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _verifyemailcontroller.dispose();
    super.dispose();
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
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
                      "Forgot your password?",
                      style: TextStyle(
                          letterSpacing: Platform.isIOS ? -1 : -0.6,
                          color: Helper.baseBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 28),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Enter your registered email address. We will send you an OTP for verification.",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.color128,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      "Email",
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
                      name: 'email',
                      controller: _verifyemailcontroller,
                      onChanged: (text) {
                        setState(() {});
                        _changeState = true;
                      },
                      onSubmitted: (text) {
                        setState(() {
                          _changeState = true;
                        });
                      },
                      validator: (val) {
                        if (_validate && val == null || val!.isEmpty) {
                          return 'Email is required';
                        }
                        if (_validate && !val.isValidEmail)
                          return 'Enter valid email';
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.name,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "name@companyname.com",
                        hintStyle: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: _verifyemailcontroller.text.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _verifyemailcontroller.clear();
                                      _changeState = false;
                                    });
                                  },
                                ),
                              )
                            : SizedBox(),
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
                                "Verify your account",
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
                          if (_fbKey.currentState!.saveAndValidate()) {
                            setState(() {
                              isLoading = true;
                            });
                            Map<String, dynamic> data = {
                              "email":
                                  _verifyemailcontroller.text.toLowerCase(),
                            };
                            await ref
                                .watch(forgotPasswordProvider.notifier)
                                .forgotPass(data)
                                .then((value) async {
                              value.fold((failure) {
                                print("errorrrrrr");
                              }, (data) {
                                final token = data['token'];
                                context.push('/verifyEmail',
                                    extra: {"token": token});
                              });

                              setState(() {
                                isLoading = false;
                              });
                            });
                            // .onError((error, stackTrace) {
                            //   Utils.flushBarErrorMessage(
                            //       "Error", context);
                            //   setState(() {
                            //     isLoading = false;
                            //   });
                            // });
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
