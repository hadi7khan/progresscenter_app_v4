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
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/resend_otp_controller.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/verify_email_controller.dart';

class VerifyEmailScreen extends ConsumerStatefulWidget {
  final token;
  const VerifyEmailScreen({super.key, this.token});

  @override
  ConsumerState<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends BaseConsumerState<VerifyEmailScreen> {
  TextEditingController _codecontroller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  bool _changeState = false;
  bool invalidCode = false;
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
                      "Verify your email",
                      style: TextStyle(
                          letterSpacing: Platform.isIOS ? -1 : -0.6,
                          color: Helper.baseBlack,
                          fontWeight: FontWeight.w600,
                          fontSize: 28.sp),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          letterSpacing: Platform.isIOS ? -1 : -0.6,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Helper.color128,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                                'We’ve sent you a confirmation code on your email, ',
                          ),
                          TextSpan(
                              text: 'mjonmark29@gmail.com',
                              style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      "Enter code",
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
                      name: 'password',
                      controller: _codecontroller,
                      validator: (val) {
                        if (_validate && val == null || val!.isEmpty) {
                          return 'Code is required';
                        }

                        return null;
                      },
                      onChanged: (text) {
                        setState(() {});
                        _changeState = true;
                      },
                      onSubmitted: (text) {
                        setState(() {
                          _changeState = true;
                        });
                      },
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        letterSpacing: -0.3,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      textCapitalization: TextCapitalization.sentences,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "Enter code",
                        hintStyle: TextStyle(
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
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: invalidCode ? 6.h : 0),
                    invalidCode
                        ? Text(
                            "You’ve entered incorrect code",
                            style: TextStyle(
                                color: Helper.errorColor,
                                fontWeight: FontWeight.w400),
                          )
                        : SizedBox(),
                    SizedBox(height: invalidCode ? 16.h : 6.h),
                    InkWell(
                      onTap: () async {
                        await ref
                            .watch(resendOTPProvider.notifier)
                            .resendOTP(widget.token)
                            .then((value) {
                          Utils.toastSuccessMessage("OTP sent", context);
                          setState(() {
                            isLoading = false;
                            invalidCode = false;
                            _codecontroller.clear();
                          });
                        });
                      },
                      child: RichText(
                        text: TextSpan(
                          // Note: Styles for TextSpans must be explicitly defined.
                          // Child text spans will inherit styles from parent
                          style: TextStyle(
                            letterSpacing: -0.3,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: Helper.textColor500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Didn’t receive code? ',
                            ),
                            TextSpan(
                                text: 'Resend',
                                style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.primary,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 28.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Verify your account",
                          style: TextStyle(
                              letterSpacing: -0.3,
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
                          Map<String, dynamic> data = {
                            "otp": _codecontroller.text
                          };
                          if (_fbKey.currentState!.saveAndValidate()) {
                            setState(() {
                              isLoading = true;
                              invalidCode = false;
                            });
                            await ref
                                .watch(verifyEmailProvider.notifier)
                                .verifyEmail(data, widget.token)
                                .then((value) {
                              print(value.toString());
                              context.push('/changePassword',
                                  extra: {"token": widget.token});

                              setState(() {
                                isLoading = false;
                                invalidCode = false;
                              });
                            }).onError((error, stackTrace) {
                              setState(() {
                                isLoading = false;
                                invalidCode = true;
                              });
                            });
                          }
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
