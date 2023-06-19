import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  TextEditingController _newPasswordcontroller = TextEditingController();
  TextEditingController _retypePasswordcontroller = TextEditingController();
  bool _obscurePassword = true;
  bool _obscurePasswordretype = true;

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
                    child: Text(
                      "Reset Password",
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
