import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AddUserScreen extends StatefulWidget {
  const AddUserScreen({super.key});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  // TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _designationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70.h),
        child: Padding(
          padding: EdgeInsets.only(right: 20.w, left: 20.w),
          child: AppBar(
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            centerTitle: true,
            titleSpacing: 12.0.w,
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
              "Add new user",
              style: TextStyle(
                  color: Helper.baseBlack,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500),
            ),
            actionsIconTheme: IconThemeData(color: Helper.iconColor),
          ),
        ),
      ),
      body: SafeArea(child: SingleChildScrollView(child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            CustomInputWidget(title: "Full name", 
            formField: FormBuilderTextField(
                          name: '_name',
                          controller: _nameController,
                          // focusNode: focusNode,
                          
                          validator: (val) {
                            if ( val == null || val.isEmpty) {
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
            ),
            SizedBox(height: 12.h),
            CustomInputWidget(title: "Email", 
            formField: FormBuilderTextField(
                          name: 'email',
                          controller: _emailController,
                          // focusNode: focusNode,
                          
                          validator: (val) {
                            if ( val == null || val.isEmpty) {
                              return 'Email is required';
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
            ),
            SizedBox(height: 12.h),
            CustomInputWidget(title: "User name", 
            formField: FormBuilderTextField(
                          name: 'user_name',
                          controller: _nameController,
                          // focusNode: focusNode,
                          
                          validator: (val) {
                            if ( val == null || val.isEmpty) {
                              return 'User name is required';
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
                            hintText: "Enter username",
                            hintStyle: TextStyle(
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
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                          ),
                          onTap: () {},
                        ),
            ),
            SizedBox(height: 12.h),
            CustomInputWidget(title: "Date of birth", 
            formField: Container(
              padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Helper.textColor300),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          dense: true,
                          minVerticalPadding: 0,
                          visualDensity: VisualDensity(vertical: -4),
                          title: Text(
                            "02/01/1997",
                            style: TextStyle(
                                color: Helper.textColor500,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          trailing: SvgPicture.asset(
                            'assets/images/dob.svg',
                            color: Helper.textColor500,
                            width: 24,
                          ),
                        ),
                      ),
            ),
            SizedBox(height: 12.h),
            CustomInputWidget(
                          title: "Mobile number",
                          formField: FormBuilderTextField(
                            controller: _numberController,
                            keyboardType: TextInputType.name,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            decoration: InputDecoration(
                              hintText: 'Enter number',
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: CountryCodePicker(
                                  onChanged: (CountryCode countryCode) {
                                    // countryDialCode = countryCode.dialCode;
                                  },
                                  // initialSelection: countryDialCode,
                                  // favorite: [countryDialCode!],
                                  showDropDownButton: true,
                                  padding: EdgeInsets.zero,
                                  showFlagMain: true,
                                  dialogSize: Size(
                                      MediaQuery.of(context).size.width * 0.3,
                                      MediaQuery.of(context).size.width *
                                          0.3),
                                  dialogBackgroundColor:
                                      Theme.of(context).cardColor,
                                  flagWidth: 32,
                                ),
                              ),
                              // filled: true,
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                              ),
                            ),
                            name: 'phone',
                          ),
                        ),

          ],
        ),
        
      ),),),
    );
  }
}