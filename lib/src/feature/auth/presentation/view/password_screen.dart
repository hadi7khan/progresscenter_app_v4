import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  TextEditingController _passwordcontroller = TextEditingController();
  bool _obscurePassword = true;

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 82),
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
                RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Helper.baseBlack,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Welcome to \nProgress'),
                      TextSpan(
                          text: 'Center',
                          style: TextStyle(color: Helper.primary)),
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
                const SizedBox(height: 28),
                Container(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.primary),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    onPressed: () {
                      context.push('/verify');
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Align(
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: (){
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
        )),
      ),
    );
  }
}
