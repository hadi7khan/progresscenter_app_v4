import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
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
                    "Forgot your password?",
                    style: TextStyle(
                        color: Helper.baseBlack,
                        fontWeight: FontWeight.w600,
                        fontSize: 28),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Enter your registered email address. We will send you an OTP for verification.",
                    style: TextStyle(
                        color: Helper.color128,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        color: Helper.textColor700,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
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
                      if (val == null || val.isEmpty) {
                        return 'Email is required';
                      }
                      // if (val.length < 8) {
                      //   return 'Password must be at least 8 characters';
                      // }
                      return null;
                    },
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
                      hintText: "name@companyname.com",
                      hintStyle: TextStyle(
                        color: Helper.textColor500,
                        fontSize: 16,
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
                              "Verify your account",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                              // currentIndex == contents.length - 1 ? "Continue" : "Next"
                            ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              _changeState ? Helper.primary : Helper.blendmode),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      onPressed: () async {
                        if (_fbKey.currentState!.saveAndValidate()) {
                          setState(() {
                            isLoading = true;
                          });
                          Map<String, dynamic> data = {
                            "email": _verifyemailcontroller.text,
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
    );
  }
}
