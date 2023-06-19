import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  TextEditingController _codecontroller = TextEditingController();
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
                Text(
                  "Verify your email",
                  style: TextStyle(
                      color: Helper.baseBlack,
                      fontWeight: FontWeight.w600,
                      fontSize: 28),
                ),
                const SizedBox(
                  height: 12,
                ),
                RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Helper.color128,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'We’ve sent you a confirmation code on your email, ',),
                      TextSpan(
                          text: 'mjonmark29@gmail.com',
                          style: TextStyle(color: Helper.baseBlack,)),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                Text(
                  "Enter code",
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
                  controller: _codecontroller,
                  textInputAction: TextInputAction.done,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                    hintText: "Enter code",
                    hintStyle: TextStyle(
                      color: Helper.textColor500,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
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
                const SizedBox(height: 6),
                RichText(
                  text: TextSpan(
                    // Note: Styles for TextSpans must be explicitly defined.
                    // Child text spans will inherit styles from parent
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Helper.textColor500,
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'Didn’t receive code? ',),
                      TextSpan(
                          text: 'Resend',
                          style: TextStyle(color: Helper.primary, fontWeight: FontWeight.w600,)),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  height: 52,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      "Verify your account",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      // currentIndex == contents.length - 1 ? "Continue" : "Next"
                    ),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Helper.blendmode),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        )),
                    onPressed: () {
                      // context.push('/forgotpassword');
                    },
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}