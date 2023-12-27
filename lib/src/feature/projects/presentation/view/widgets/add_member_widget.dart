import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';

class AddMemberWidget extends StatefulWidget {
  const AddMemberWidget({super.key});

  @override
  State<AddMemberWidget> createState() => _AddMemberWidgetState();
}

class _AddMemberWidgetState extends State<AddMemberWidget> {
  TextEditingController _emailController = TextEditingController();
  bool _changeState = false;
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  List<UserLeanModel> _myCustomList = [];
  bool _userExists = false;

  @override
  void initState() {
    super.initState();
    Service().fetchUserList().then((users) {
      setState(() {
        _myCustomList = users;
      });
    });
    // Service().fetchTeamList().then((teams) {
    //   setState(() {
    //     _teamList = teams;
    //   });
    // });
    // focusNode.addListener(() {
    //   if (!focusNode.hasFocus) {
    //     setState(() {
    //       _validate = true;
    //     });
    //   }
    // });
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
    return Container(
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Email",
            style: TextStyle(
                letterSpacing: -0.3,
                color: Helper.textColor700,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 6.h),
          TypeAheadFormField<UserLeanModel>(
            textFieldConfiguration: TextFieldConfiguration(
              controller: _emailController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
                hintText: "Enter email address",
                hintStyle: TextStyle(
                  letterSpacing: -0.3,
                  color: Helper.textColor500,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: _emailController.text.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 3.w),
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            size: 18,
                          ),
                          onPressed: () {
                            setState(() {
                              _emailController.clear();
                              _changeState = false;
                            });
                          },
                        ),
                      )
                    : SizedBox(),
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
            ),
            suggestionsCallback: (pattern) async {
              if (pattern != null && pattern.length > 0) {
                _userExists = true;
                return _myCustomList.where((user) => user.email!
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
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(200.r),
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
                                color: _getColor(user.preset!.color!),
                              ),
                              child: Center(
                                child: Text(_getNameInitials(user.name!),
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
            onSuggestionSelected: (UserLeanModel user) {
              // Do something with the selected user
              // print('Selected user: ${user.email}');
              setState(() {
                _emailController.text = user.email!;
              });
            },
            noItemsFoundBuilder: (value) {
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
