import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ChangePasswordProfileScreen extends StatefulWidget {
  const ChangePasswordProfileScreen({super.key});

  @override
  State<ChangePasswordProfileScreen> createState() =>
      _ChangePasswordProfileScreenState();
}

class _ChangePasswordProfileScreenState
    extends State<ChangePasswordProfileScreen> {
  TextEditingController _currentPasswordcontroller = TextEditingController();
  TextEditingController _newPasswordcontroller = TextEditingController();
  TextEditingController _confirmPasswordcontroller = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _obscurePassword = true;
  bool _obscureNewPassword = true;
  bool _obscureConfirmPassword = true;
  bool passwordNotMatched = false;
  bool _changeState = false;
  bool isLoading = false;

  void toggleCurrentPassword() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  void toggleNewPassword() {
    setState(() {
      _obscureNewPassword = !_obscureNewPassword;
    });
  }

  void toggleConfirmPassword() {
    setState(() {
      _obscureConfirmPassword = !_obscureConfirmPassword;
    });
  }

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
                  "Change Password",
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Current Password",
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
                  controller: _currentPasswordcontroller,
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
                      return 'Field is required';
                    }
                    // if (val.length < 5) {
                    //   return 'Password is short';
                    // }
                    return null;
                  },
                  obscuringCharacter: '*',
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    letterSpacing: -0.3,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                    hintText: "Enter Password",
                    hintStyle: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.textColor500,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: InkWell(
                      onTap: toggleCurrentPassword,
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
                  name: 'newPassword',
                  controller: _newPasswordcontroller,
                  obscureText: _obscureNewPassword,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Field is required';
                    }
                    if (val.length < 5) {
                      return 'Password is short';
                    }
                    return null;
                  },
                  obscuringCharacter: '*',
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    letterSpacing: -0.3,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.emailAddress,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                    hintText: "Enter new Password",
                    hintStyle: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.textColor500,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: InkWell(
                      onTap: toggleNewPassword,
                      child: Icon(
                          _obscureNewPassword
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
                  "Confirm Password",
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
                  name: 'confirmPassword',
                  controller: _confirmPasswordcontroller,
                  obscureText: _obscureConfirmPassword,
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
                      return 'Field is required';
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                    hintText: "Confirm Password",
                    hintStyle: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.textColor500,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                    suffixIcon: InkWell(
                      onTap: toggleConfirmPassword,
                      child: Icon(
                          _obscureConfirmPassword
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
                            "Reset Password",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                            // currentIndex == contents.length - 1 ? "Continue" : "Next"
                          ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            _changeState ? Helper.primary : Helper.blendmode),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        )),
                    onPressed: () async {
                      // context.push('/forgotpassword');
                      if (_newPasswordcontroller.text ==
                          _confirmPasswordcontroller.text) {
                        Map<String, dynamic> data = {
                          "currentPassword": _currentPasswordcontroller.text,
                          "password": _newPasswordcontroller.text,
                          "confirmPassword": _confirmPasswordcontroller.text,
                        };
                        setState(() {
                          isLoading = true;
                        });
                        if (_fbKey.currentState!.saveAndValidate()) {
                          setState(() {
                            isLoading = true;
                          });
                          await Service().changePassword(data).then((value) {
                            context.pushReplacement('/signin');
                            Utils.toastSuccessMessage(
                                "Password changed Successfully", context);
                            setState(() {
                              isLoading = false;
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              isLoading = false;
                            });
                            Utils.flushBarErrorMessage(
                                "Wrong password", context);
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
        ))),
      ),
    );
  }
}
