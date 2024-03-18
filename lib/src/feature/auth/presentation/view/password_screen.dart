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
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/signin_controller.dart';
import 'dart:developer';

class PasswordScreen extends ConsumerStatefulWidget {
  final email;
  const PasswordScreen({super.key, this.email});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends BaseConsumerState<PasswordScreen> {
  TextEditingController _passwordcontroller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool isLoading = false;
  bool _obscurePassword = true;
  bool _changeState = false;
  bool invalidUser = false;
  FocusNode _focusNode = FocusNode();
  bool _validate = false;
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

  void togglePassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
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
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          letterSpacing: Platform.isIOS ? -1 : -0.6,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: Helper.baseBlack,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'Enter your \npassword'),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Sign in to start managing your projects and job sites.",
                      style: TextStyle(
                          letterSpacing: Platform.isIOS ? -1 : -0.6,
                          color: Helper.color128,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    Text(
                      "Password",
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
                      controller: _passwordcontroller,
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
                          return 'Password is required';
                        }

                        return null;
                      },
                      obscureText: _obscurePassword,
                      obscuringCharacter: '*',
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                        hintText: "Enter Password",
                        hintStyle: TextStyle(
                          color: Helper.textColor500,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: InkWell(
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
                          borderRadius: BorderRadius.circular(8.r),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      onTap: () {},
                    ),
                    SizedBox(height: invalidUser ? 6.h : 0),
                    invalidUser
                        ? Text(
                            "You’ve entered an incorrect password, try again",
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
                            ? Transform.scale(
                                scale: 0.5,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                "Continue",
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    color: Colors.white,
                                    fontSize: 16,
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
                            "emailOrUsername": widget.email,
                            "password": _passwordcontroller.text
                          };
                          if (_fbKey.currentState!.saveAndValidate()) {
                            setState(() {
                              isLoading = true;
                              invalidUser = false;
                            });
                            await ref
                                .watch(signInProvider.notifier)
                                .signIn(data)
                                .then((value) {
                              log("value" +
                                  value['hasMultipleAccounts'].toString());
                              if (value['hasMultipleAccounts'] == true) {
                                context.push('/clientAccounts');
                                setState(() {
                                  isLoading = false;
                                });
                              } else {
                                context.go('/projects');
                                Utils.toastSuccessMessage(
                                    "Signed in successfully", context);
                                setState(() {
                                  isLoading = false;
                                  invalidUser = false;
                                });
                              }
                            }).onError((error, stackTrace) {
                              log("error" + error.toString());
                              setState(() {
                                isLoading = false;
                                invalidUser = true;
                              });
                            });
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            context.push('/forgotpassword');
                          },
                          child: Text(
                            "Forgot your password?",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.color128,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )),
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
