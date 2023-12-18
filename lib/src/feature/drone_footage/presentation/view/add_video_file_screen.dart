import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class AddFileVideoScreen extends StatefulWidget {
  final String projectId;
  final String projectName;
  const AddFileVideoScreen({
    super.key,
    required this.projectId,
    required this.projectName,
  });

  @override
  State<AddFileVideoScreen> createState() => _AddFileVideoScreenState();
}

class _AddFileVideoScreenState extends State<AddFileVideoScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  FilePickerResult? result;
  bool loader = false;
  PlatformFile? _file;

  String _formatFileSize(int size) {
    // Convert bytes to kilobytes
    double kbSize = size / 1024;

    if (kbSize < 1024) {
      return '${kbSize.toStringAsFixed(2)} KB';
    } else {
      // Convert kilobytes to megabytes
      double mbSize = kbSize / 1024;
      return '${mbSize.toStringAsFixed(2)} MB';
    }
  }

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
                    CustomInputWidget(
                      title: "Video",
                      formField: Container(
                        height: 200.h,
                        padding: EdgeInsets.all(10.h),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Helper.textColor300),
                            borderRadius: BorderRadius.circular(12.r)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.image,
                              color: Colors.grey.shade400,
                              size: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: '',
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'Upload file',
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () async {
                                            result = await FilePicker.platform
                                                .pickFiles(
                                              allowMultiple: false,
                                              type: FileType.custom,
                                              allowedExtensions: ['mp4'],
                                            );
                                            if (result != null) {
                                              _file = result!.files.first;
                                              setState(() {});
                                            }
                                          },
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: Helper.primary)),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "Browse JPG/PNG/MP4",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Helper.textColor600),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    _file != null
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.w, vertical: 8.h),
                            // height: 72.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: Helper.textColor300),
                            ),
                            child: ListTile(
                              horizontalTitleGap: 8.w,
                              // dense: true,
                              // visualDensity: VisualDensity(
                              //     horizontal: 0, vertical: -4.h),
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 6.h),
                                width: 32.w,
                                height: 32.h,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(229, 240, 255, 1),
                                    borderRadius: BorderRadius.circular(32.r),
                                    border: Border.all(
                                        color: Color.fromRGBO(245, 249, 255, 1),
                                        width: 4.w)),
                                child: SvgPicture.asset(
                                  'assets/images/film.svg',
                                ),
                              ),
                              title: Text(_file!.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Helper.baseBlack,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600)),
                              subtitle: Text("${_formatFileSize(_file!.size)}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Helper.textColor400,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600)),
                              // subtitle: file.extension?.toLowerCase() == 'mp4'
                              //     ? SizedBox()
                              //     : Image.file(
                              //         File(file.path!),
                              //         height: 50,
                              //         width: 50,
                              //         fit: BoxFit.cover,
                              //       ),
                              trailing: InkWell(
                                onTap: () {
                                  setState(() {
                                    _file = null;
                                  });
                                },
                                child: SvgPicture.asset(
                                  'assets/images/close-x.svg',
                                ),
                              ),
                            ),
                          )
                        : SizedBox(),
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
