import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AddVimeoVideoScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const AddVimeoVideoScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  State<AddVimeoVideoScreen> createState() => _AddVimeoVideoScreenState();
}

class _AddVimeoVideoScreenState extends State<AddVimeoVideoScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _urlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: AppBar(
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: true,
              titleSpacing: 12.w,
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  'assets/images/close-x.svg',
                ),
              ),
              leadingWidth: 12,
              title: Text(
                "Add Drone Footage",
                style: TextStyle(
                    color: Helper.baseBlack,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500),
              ),
              actionsIconTheme: IconThemeData(color: Helper.iconColor),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You can add one drone video at a time from here",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: Helper.textColor600),
                    ),
                    SizedBox(height: 20.h),
                    CustomInputWidget(
                            title: "Name",
                            formField: FormBuilderTextField(
                              name: '_name',
                              controller: _nameController,
                              // focusNode: focusNode,
          
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Name is required';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.name,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 14.w),
                                hintText: "Enter name",
                                hintStyle: TextStyle(
                                  color: Helper.textColor500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                // hintText: widget.control.label,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Helper.textColor300),
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
                          ),
                          SizedBox(height: 12.h),
                          CustomInputWidget(
                            title: "Location",
                            formField: FormBuilderTextField(
                              name: '_location',
                              controller: _locationController,
                              // focusNode: focusNode,
          
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Location is required';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.name,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 14.w),
                                hintText: "Enter location",
                                hintStyle: TextStyle(
                                  color: Helper.textColor500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                // hintText: widget.control.label,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Helper.textColor300),
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
                          ),
                          SizedBox(height: 12.h),
                          CustomInputWidget(
                            title: "Vimeo Url",
                            formField: FormBuilderTextField(
                              name: '_url',
                              controller: _urlController,
                              // focusNode: focusNode,
          
                              validator: (val) {
                                if (val == null || val.isEmpty) {
                                  return 'Url is required';
                                }
                                return null;
                              },
                              textInputAction: TextInputAction.done,
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              textCapitalization: TextCapitalization.none,
                              keyboardType: TextInputType.name,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 14.w),
                                hintText: "Enter url",
                                hintStyle: TextStyle(
                                  color: Helper.textColor500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                // hintText: widget.control.label,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Helper.textColor300),
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
                          ),
                          SizedBox(height: 12.h),
                  ]),
            ),
          ),
        ),
       bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          color: Colors.white,
          alignment: Alignment.center,
          height: 76.h,
          child: Container(
            height: 52.h,
            width: double.infinity,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () async {
                      context.pop();
                    },
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 11.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        backgroundColor: Colors.white,
                        fixedSize: Size.infinite),
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          color: Helper.neutral500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      // Map<String, dynamic> data = {
                      //   "name": _nameController.text,
                      //   "email": _emailController.text,
                      //   "username": _userNameController.text,
                      //   "role": _roleSelected.toUpperCase(),
                      //   "designation": _designationController.text,
                      //   "phone": {
                      //     "countryCode": _countryCode.toLowerCase(),
                      //     "dialCode": _countryDialCode,
                      //     "number": _numberController.text
                      //   },
                      //   "dob": _selectedDate
                      // };
                      // if (_fbKey.currentState!.saveAndValidate()) {
                      //   context.push('/addUser2', extra: data);
                      //   print("data passed to screen 2" + data.toString());
                      // }
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 11.h),
                        backgroundColor: Helper.primary,
                        side: BorderSide(color: Helper.textColor300),
                        fixedSize: Size.infinite),
                    child: Text(
                      "Upload",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
