import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    print("token passed" + widget.token.toString());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // appBar: AppBar(iconTheme: IconThemeData(color: Helper.secondary)),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 82),
            child: FormBuilder(
              key: _fbKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Stack(
                  //   alignment: Alignment.topLeft,
                  //   children: [
                  //     IconButton(
                  //       padding: EdgeInsets.zero,
                  //       alignment: Alignment.centerLeft,
                  //       icon: Icon(
                  //         Icons.arrow_back,
                  //         size: 24,
                  //       ),
                  //       onPressed: () => context.pop(),
                  //     ),
                  //     const SizedBox(
                  //       height: 38,
                  //     ),
                  //   ],
                  // ),
                  Text(
                    "Choose new password",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Create a new password that is atleast 8 characters long.",
                    style: TextStyle(
                        color: Helper.color128,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),

                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    "New Password",
                    style: TextStyle(
                        color: Helper.textColor700,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  FormBuilderTextField(
                    name: 'newpassword',
                    controller: _newPasswordcontroller,
                    obscureText: _obscurePassword,
                    onChanged: (text) {
                      setState(() {});
                      _changeState = true;
                    },
                    onSubmitted: (text){
                      setState(() {
                        _changeState = true;
                      });
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Email is required';
                      }
                      if (val.length < 5) {
                        return 'Password is short';
                      }
                      return null;
                    },
                    obscuringCharacter: '*',
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.name,
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
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Helper.textColor300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Helper.primary),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(height: 28),
                  Text(
                    "Retype new password",
                    style: TextStyle(
                        color: Helper.textColor700,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  FormBuilderTextField(
                    name: 'retypepassword',
                    controller: _retypePasswordcontroller,
                    obscureText: _obscurePasswordretype,
                    onChanged: (text) {
                      setState(() {});
                      _changeState = true;
                    },
                    onSubmitted: (text){
                      setState(() {
                        _changeState = true;
                      });
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Email is required';
                      }
                      if (val.length < 5) {
                        return 'Password is short';
                      }
                      return null;
                    },
                    obscuringCharacter: '*',
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    textCapitalization: TextCapitalization.sentences,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                      hintText: "Retype Password",
                      hintStyle: TextStyle(
                        color: Helper.textColor500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: InkWell(
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
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Helper.textColor300),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: Helper.primary),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(color: Colors.red),
                      ),
                    ),
                    onTap: () {},
                  ),
                  const SizedBox(height: 28),
                  Container(
                    height: 52,
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
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              // currentIndex == contents.length - 1 ? "Continue" : "Next"
                            ),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(_changeState ? Helper.primary : Helper.blendmode),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
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
                              print(value.toString());

                              context.pushReplacement('/signin');
                              Utils.toastSuccessMessage(
                                  "Password changed Successfully");
                              setState(() {
                                isLoading = false;
                              });
                            });
                          }
                        } else {
                          Utils.flushBarErrorMessage(
                              "Password is not matching", context);
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
        )),
      ),
    );
  }
}
