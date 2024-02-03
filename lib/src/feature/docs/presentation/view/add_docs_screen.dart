import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/add_doc_controller.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/provider/docs_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';

class AddDocsScreen extends ConsumerStatefulWidget {
  final category;
  const AddDocsScreen({super.key, this.category});

  @override
  ConsumerState<AddDocsScreen> createState() => _AddDocsScreenState();
}

class _AddDocsScreenState extends BaseConsumerState<AddDocsScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _usersController = TextEditingController();
  List<String> _selectedUsers = [];
  List<String> _selectedUserIds = [];
  List<UserLeanModel> _myCustomList = [];
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  String _categorySelected = "";
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  XFile? _doc;
  String? _docBase64;
  String? fileName;
  String? fileSizeString;
  XFile? pickedFile;

  @override
  void initState() {
    super.initState();
    Service().fetchUserList().then((users) {
      print("users----" + users.toString());
      setState(() {
        _myCustomList = users;
      });
    });
  }

  Future<void> _pickDoc() async {
    pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final file = XFile(pickedFile!.path);
      final bytes = await pickedFile!.readAsBytes();
      setState(() {
        _docBase64 = base64Encode(bytes);
        _doc = file;
      });

      // Get file name
      fileName = _doc!.path.split('/').last;

      // Check file size
      final fileSize = await file.length();
      if (fileSize > 1000000) {
        // The file is too large, show an error message
        return;
      }

      // Convert file size to KB or MB

      if (fileSize < 1024) {
        fileSizeString = '$fileSize bytes';
      } else if (fileSize < 1024 * 1024) {
        fileSizeString = '${(fileSize / 1024).toStringAsFixed(2)} KB';
      } else {
        fileSizeString = '${(fileSize / (1024 * 1024)).toStringAsFixed(2)} MB';
      }

      print("image path" + _doc!.path.toString());
    }
  }

  _getColor(
    String color,
  ) {
    color = "0xFF" + color.replaceAll("#", "");
    return Color(int.parse(color));
  }

  _getNameInitials(String name) {
    var buffer = StringBuffer();
    var split = name.split(' ');
    for (var i = 0; i < 1; i++) {
      buffer.write(split[i][0]);
    }

    return buffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    print("category passed" + widget.category.toString());
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: Padding(
            padding: EdgeInsets.only(right: 20.w, left: 20.w),
            child: AppBar(
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
              centerTitle: false,
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
                "Add document",
                style: TextStyle(
                    letterSpacing: -0.3,
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
            reverse: true,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 126.h,
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
                                          ..onTap = _pickDoc,
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w600,
                                            color: ref
                                                .watch(primaryColorProvider))),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "PDF, PNG or JPG (max size 5 MB)",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: Helper.textColor600),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10.h),
                      pickedFile != null
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 12),
                              height: 72,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Helper.textColor300),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(fileName!,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              letterSpacing: -0.3,
                                              color: Helper.baseBlack,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                    Text(fileSizeString!,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.textColor400,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600)),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            pickedFile == null;
                                          });
                                          setState(() {});
                                        },
                                        child: SvgPicture.asset(
                                            width: 15,
                                            height: 15,
                                            'assets/images/close-x.svg')),
                                  ]),
                            )
                          : const SizedBox(),
                      SizedBox(height: 32.h),
                      CustomInputWidget(
                        title: "Full name",
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
                            letterSpacing: -0.3,
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
                              letterSpacing: -0.3,
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
                              borderSide: BorderSide(
                                  color: ref.watch(primaryColorProvider)),
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
                        title: "Category",
                        formField: FormBuilderDropdown(
                          name: "roles",
                          dropdownColor: Colors.white,
                          icon: SizedBox(),
                          decoration: InputDecoration(
                            // labelText: 'Training',
                            hintText: "Select a category",
                            hintStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 14.w),
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 14.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // Icon(Icons.help_outline, color: Helper.textColor500, size: 18),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Icon(Icons.keyboard_arrow_down_outlined,
                                      color: Helper.textColor500)
                                ],
                              ),
                            ),

                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide:
                                  BorderSide(color: Helper.textColor300),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: BorderSide(
                                  color: ref.watch(primaryColorProvider)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              borderSide: const BorderSide(color: Colors.red),
                            ),
                            // filled: true,
                          ),
                          onChanged: (value) {
                            setState(() {
                              _categorySelected = value!["_id"];
                            });
                            print("roleselected" + _categorySelected);
                          },
                          items: (widget.category as List<Map<String, dynamic>>)
                              .map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(
                                e["name"],
                                style: const TextStyle(
                                    letterSpacing: -0.3, color: Colors.black),
                              ),
                              onTap: () {},
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(height: 12.h),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: CustomInputWidget(
                          title: "Users",
                          formField: TypeAheadFormField<UserLeanModel>(
                            textFieldConfiguration: TextFieldConfiguration(
                              controller: _usersController,
                              onSubmitted: (value) {
                                setState(() {
                                  if (value.isNotEmpty) {
                                    print("value selected" + value.toString());
                                    _selectedUsers.add(value);
                                    _usersController.clear();
                                  }
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 14.w),
                                hintText: "Search or add here",
                                hintStyle: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor500,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      BorderSide(color: Helper.textColor300),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide: BorderSide(
                                      color: ref.watch(primaryColorProvider)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                  borderSide:
                                      const BorderSide(color: Colors.red),
                                ),
                              ),
                            ),
                            suggestionsCallback: (pattern) async {
                              if (pattern != null && pattern.length > 0) {
                                return _myCustomList.where((user) => user.name!
                                    .toLowerCase()
                                    .contains(pattern.trim().toLowerCase()));
                              } else {
                                return [];
                              }
                            },
                            itemBuilder: (context, UserLeanModel user) {
                              return ListTile(
                                leading: ClipRRect(
                                  borderRadius: BorderRadius.circular(200.r),
                                  child: user.dp != null
                                      ? Image.network(
                                          width: 32.w,
                                          height: 32.h,
                                          user.dpUrl!,
                                          gaplessPlayback: true,
                                          fit: BoxFit.cover,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(200.r),
                                              child: Image.asset(
                                                  'assets/images/error_image.jpeg',
                                                  fit: BoxFit.cover),
                                            );
                                          },
                                        )
                                      : Hero(
                                          tag: "profile name",
                                          child: Container(
                                              width: 32.w,
                                              height: 32.h,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: _getColor(
                                                    user.preset!.color!),
                                              ),
                                              child: Center(
                                                child: Text(
                                                    _getNameInitials(
                                                        user.name!),
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color: Colors.white)),
                                              )),
                                        ),
                                ),
                                title: Text(
                                  user.name!,
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: Helper.textColor700,
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(
                                  user.email!,
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: Helper.textColor600,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              );
                            },
                            onSuggestionSelected: (team) {
                              // Do something with the selected user
                              // print('Selected user: ${user.email}');
                              print("value selected" + team.toString());
                              setState(() {
                                _selectedUsers.add(team.email.toString());
                                _selectedUserIds.add(team.id.toString());
                                _usersController.clear();
                              });
                            },
                            noItemsFoundBuilder: (value) {
                              return SizedBox();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Wrap(
                        alignment: WrapAlignment.start,
                        spacing: 5.w,
                        children: _selectedUsers.toSet().map((suggestion) {
                          return Chip(
                            label: Text(suggestion),
                            labelStyle: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor500,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500),
                            onDeleted: () {
                              setState(() {
                                _selectedUsers.remove(suggestion);
                              });
                            },
                            deleteIcon: SvgPicture.asset(
                              'assets/images/close-x.svg',
                              color: Helper.textColor500,
                            ),
                            side: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r)),
                            backgroundColor: Helper.widgetBackground,
                          );
                        }).toList(),
                      ),
                      SizedBox(height: 12.h),
                    ]),
              ),
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
            child: ElevatedButton(
              child: Text(
                "Upload",
                style: TextStyle(
                    letterSpacing: -0.3,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
                // currentIndex == contents.length - 1 ? "Continue" : "Next"
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                      _nameController.text.isNotEmpty &&
                              _doc != null &&
                              _selectedUserIds.isNotEmpty
                          ? ref.watch(primaryColorProvider)
                          : Helper.blendmode),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  )),
              onPressed: () async {
                FormData? formData = FormData.fromMap({
                  "name": _nameController.text,
                });
                if (_fbKey.currentState!.saveAndValidate() &&
                    _selectedUserIds.isNotEmpty &&
                    _nameController.text.isNotEmpty &&
                    _doc != null) {
                  formData.fields
                    ..add(MapEntry(
                        'course_features', jsonEncode(_selectedUserIds)));
                  if (_doc != null) {
                    formData.files.add(MapEntry(
                        "file", await MultipartFile.fromFile(_doc!.path)));
                  }
                  setState(() {
                    _isLoading = true;
                  });
                  await ref
                      .watch(addDocProvider.notifier)
                      .addDocument(_categorySelected, formData)
                      .then((value) async {
                    value.fold((failure) {
                      print("errorrrrrr");
                    }, (data) {
                      context.pop();
                      ref.watch(docsControllerProvider.notifier).getDocs();
                      Utils.toastSuccessMessage("Document Added", context);
                    });

                    setState(() {
                      _isLoading = false;
                    });
                  });
                  // .onError((error, stackTrace) {
                  //   Utils.flushBarErrorMessage(
                  //       "Error", context);
                  //   setState(() {
                  //     isLoading = false;
                  //   });
                  // });
                  // _showBottomSheet(
                  //     context, _emailController.text, selectedTeams);
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
