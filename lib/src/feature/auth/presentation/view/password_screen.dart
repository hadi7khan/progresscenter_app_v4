import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/signin_controller.dart';

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
                    height: 24,
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                      onPressed: () => context.pop(),
                    ),
                  ),
                  const SizedBox(
                    height: 38,
                  ),
                  RichText(
                    text: TextSpan(
                      // Note: Styles for TextSpans must be explicitly defined.
                      // Child text spans will inherit styles from parent
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w600,
                        color: Helper.baseBlack,
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'Sign in to \nget started'),
                        // TextSpan(
                        //     text: 'Center',
                        //     style: TextStyle(color: Helper.primary)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Sign in to start managing your projects and job sites.",
                    style: TextStyle(
                        color: Helper.color128,
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    height: 34,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Helper.textColor700,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 6,
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
                      // if (val.length < 5) {
                      //   return 'Password is short';
                      // }
                      return null;
                    },
                    obscureText: _obscurePassword,
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
                  SizedBox(height:invalidUser
                      ? 6: 0),
                  invalidUser
                      ? Text(
                          "You’ve entered an incorrect password, try again",
                          style: TextStyle(
                              color: Helper.errorColor,
                              fontWeight: FontWeight.w400),
                        )
                      : SizedBox(),
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
                              "Continue",
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
                            print(value.toString());
                            context.push('/verify');
                            Utils.toastSuccessMessage("Signed in successfully");
                            setState(() {
                              isLoading = false;
                              invalidUser = false;
                            });
                          }).onError((error, stackTrace) {
                            setState(() {
                              isLoading = false;
                              invalidUser = true;
                            });
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 16,
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
                              color: Helper.color128,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
