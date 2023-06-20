import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:go_router/go_router.dart';
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
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                    controller: _controller,
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
                      hintText: "Email or username",
                      hintStyle: TextStyle(
                        color: Helper.textColor500,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: _controller.text.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3),
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
                              MaterialStatePropertyAll(_changeState ? Helper.primary : Helper.blendmode),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          )),
                      onPressed: () {
                        if (_fbKey.currentState!.saveAndValidate()) {
                          context.push('/password',
                              extra: {"email": _controller.text});
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
    );
  }
}
