import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/data/extension.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _changeState = false;

  FocusNode focusNode = FocusNode();
  bool _validate = false;
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
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
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    RichText(
                      text: TextSpan(
                        // Note: Styles for TextSpans must be explicitly defined.
                        // Child text spans will inherit styles from parent
                        style: TextStyle(
                          letterSpacing: -0.3,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: Helper.baseBlack,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign in to \nget started',
                            style: TextStyle(
                              letterSpacing: -0.3,
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                              color: Helper.baseBlack,
                            ),
                          ),
                          // TextSpan(
                          //     text: 'Center',
                          //     style: TextStyle(color: Helper.primary)),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Text(
                      "Sign in to start managing your projects and job sites.",
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
                      controller: _controller,
                      focusNode: focusNode,
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
                        // if (_validate && !val.isValidEmail)
                        //   return 'Enter valid email';
                        return null;
                      },
                      textInputAction: TextInputAction.done,
                      style: TextStyle(
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      textCapitalization: TextCapitalization.none,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 14.w),
                        hintText: "Email or username",
                        hintStyle: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        suffixIcon: _controller.text.isNotEmpty
                            ? Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    size: 18,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controller.clear();
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
                        child: Text(
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
                        onPressed: () {
                          if (_fbKey.currentState!.saveAndValidate()) {
                            context.push('/password', extra: {
                              "email": _controller.text.trim().toLowerCase()
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
