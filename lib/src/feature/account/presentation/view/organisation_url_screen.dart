import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class OrganisationUrlScreen extends StatefulWidget {
  const OrganisationUrlScreen({super.key});

  @override
  State<OrganisationUrlScreen> createState() => _OrganisationUrlScreenState();
}

class _OrganisationUrlScreenState extends State<OrganisationUrlScreen> {
  TextEditingController _urlController = TextEditingController();
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  bool _changeState = false;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Add custom URL",
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: FormBuilder(
            key: _fbKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter URL",
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
                  name: 'url',
                  controller: _urlController,
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Field is required';
                    }
                    // if (val.length < 5) {
                    //   return 'Password is short';
                    // }
                    return null;
                  },
                  onChanged: (text) {
                    setState(() {});
                    _changeState = true;
                  },
                  onSubmitted: (text) {
                    setState(() {
                      _changeState = true;
                    });
                  },
                  textInputAction: TextInputAction.next,
                  style: TextStyle(
                    letterSpacing: -0.3,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                  textCapitalization: TextCapitalization.sentences,
                  keyboardType: TextInputType.name,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                    hintText: "Enter text here",
                    hintStyle: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.textColor500,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
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
                            "Submit request",
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
                      Map<String, dynamic> data = {
                        "domain": _urlController.text,
                      };
                      setState(() {
                        isLoading = true;
                      });
                      if (_fbKey.currentState!.saveAndValidate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await Service().domainChange(data).then((value) {
                          context.pop();
                          Utils.toastSuccessMessage(
                              "Request submitted Successfully");
                          setState(() {
                            isLoading = false;
                          });
                        }).onError((error, stackTrace) {
                          setState(() {
                            isLoading = false;
                          });
                          Utils.flushBarErrorMessage(
                              "Something went wrong", context);
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
      ),
    );
  }
}
