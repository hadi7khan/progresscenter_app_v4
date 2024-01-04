import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/invite_members_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/userlean_controller.dart';

class AddMemberScreen extends ConsumerStatefulWidget {
  final String projectId;
  const AddMemberScreen({super.key, required this.projectId});

  @override
  ConsumerState<AddMemberScreen> createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends BaseConsumerState<AddMemberScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _teamsController = TextEditingController();
  bool _changeState = false;
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  FocusNode focusNode = FocusNode();
  FocusNode dropdownNode = FocusNode();
  bool _validate = false;
  bool _isSelected = false;
  List<UserLeanModel> _myCustomList = [];
  List<String> _teamList = [];
  List<String> _selectedTeams = [];
  List<String> _roles = ["Admin", "Editor", "Viewer"];
  String _roleSelected = "";
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    Service().fetchUserList().then((users) {
      setState(() {
        _myCustomList = users;
      });
    });
    Service().fetchTeamList().then((teams) {
      setState(() {
        _teamList = teams;
      });
    });
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        setState(() {
          _validate = true;
        });
      }
    });
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
    final userleanData =
        ref.watch(userleanControllerProvider.select((value) => value.userlean));

    return GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
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
                    "Add member",
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
              child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              child: FormBuilder(
                key: _fbKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   mainAxisSize: MainAxisSize.max,
                    //   children: [
                    //     Container(
                    //       height: 24.h,
                    //       child: IconButton(
                    //         padding: EdgeInsets.zero,
                    //         alignment: Alignment.centerLeft,
                    //         icon: Icon(
                    //           Icons.arrow_back,
                    //         ),
                    //         onPressed: () => context.pop(),
                    //       ),
                    //     ),
                    //     SizedBox(width: 8.w),
                    //     Center(
                    //       child: Text(
                    //         "Add member",
                    //         style: TextStyle(
                    //             color: Helper.baseBlack,
                    //             fontSize: 18.sp,
                    //             fontWeight: FontWeight.w500),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // SizedBox(height: 24.h),
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
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 14.w),
                          hintText: "Enter email address",
                          hintStyle: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.textColor500,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixIcon: _emailController.text.isNotEmpty
                              ? Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 3.w),
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
                                    gaplessPlayback: true,
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
                                          color: _getColor(user.preset!.color!),
                                        ),
                                        child: Center(
                                          child: Text(
                                              _getNameInitials(user.name!),
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
                    SizedBox(height: 24.h),
                    Text(
                      "Type",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 6.h),

                    FormBuilderDropdown(
                      name: "roles",
                      dropdownColor: Colors.white,
                      icon: SizedBox(),
                      decoration: InputDecoration(
                        // labelText: 'Training',
                        hintText: "Select roles",
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
                              Icon(Icons.help_outline,
                                  color: Helper.textColor500, size: 18),
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
                        // filled: true,
                      ),
                      onChanged: (value) {
                        setState(() {
                          _roleSelected = value!;
                        });
                      },
                      items: _roles.map((e) {
                        return DropdownMenuItem<String>(
                          value: e,
                          child: Text(
                            e,
                            style: const TextStyle(
                                letterSpacing: -0.3, color: Colors.black),
                          ),
                          onTap: () {},
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "Team",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.textColor700,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 6.h),
                    TypeAheadFormField(
                      textFieldConfiguration: TextFieldConfiguration(
                        controller: _teamsController,
                        onSubmitted: (value) {
                          setState(() {
                            if (value.isNotEmpty) {
                              _selectedTeams.add(value);
                              _teamsController.clear();
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
                          return _teamList.where((name) => name
                              .toLowerCase()
                              .contains(pattern.trim().toLowerCase()));
                        } else {
                          return [];
                        }
                      },
                      itemBuilder: (context, team) {
                        return ListTile(
                            minVerticalPadding: 0,
                            dense: true,
                            title: Text(
                              team.toString(),
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.textColor700,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600),
                            ));
                      },
                      onSuggestionSelected: (team) {
                        // Do something with the selected user
                        // print('Selected user: ${user.email}');
                        setState(() {
                          _selectedTeams.add(team.toString());
                          _teamsController.clear();
                        });
                      },
                      noItemsFoundBuilder: (value) {
                        return SizedBox();
                      },
                    ),
                    SizedBox(height: 10.h),
                    Wrap(
                      spacing: 5.w,
                      children: _selectedTeams.toSet().map((suggestion) {
                        return Chip(
                          label: Text(suggestion),
                          labelStyle: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                          onDeleted: () {
                            setState(() {
                              _selectedTeams.remove(suggestion);
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
                    SizedBox(height: 28.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          // currentIndex == contents.length - 1 ? "Continue" : "Next"
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                                _emailController.text.isNotEmpty &&
                                        _selectedTeams.isNotEmpty
                                    ? Helper.primary
                                    : Helper.blendmode),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            )),
                        onPressed: () async {
                          if (_fbKey.currentState!.saveAndValidate() &&
                              _selectedTeams.isNotEmpty &&
                              _emailController.text.isNotEmpty) {
                            // context.push('/password', extra: {
                            //   "email": _controller.text.trim().toLowerCase()
                            // });
                            setState(() {
                              _isLoading = true;
                            });
                            Map<String, dynamic> data = {
                              "email": _emailController.text.toLowerCase(),
                              "role": _roleSelected.toUpperCase().toString(),
                              "tags": _selectedTeams
                            };
                            print(data.toString());
                            await ref
                                .watch(inviteMembersProvider.notifier)
                                .inviteMember(data, widget.projectId)
                                .then((value) async {
                              value.fold((failure) {
                                print("errorrrrrr");
                              }, (data) {
                                // final token = data['token'];
                                // context.push('/verifyEmail',
                                //     extra: {"token": token});
                                context.pop();
                                Utils.toastSuccessMessage(
                                  "Member Added",
                                );
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
                  ],
                ),
              ),
            ),
          )),
        ));
  }

  _showBottomSheet(context, email, teams) {
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r)),
                color: Colors.white,
              ),
              height: 340.h,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Upload Media',
                        style: TextStyle(
                            letterSpacing: -0.3,
                            color: Helper.baseBlack,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: _isSelected
                                ? Helper.widgetBackground
                                : Colors.white),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () {
                            setState(() {
                              _isSelected = true;
                            });
                          },
                          leading: Text(
                            'Admin',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset('assets/images/check.svg'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: _isSelected
                                ? Helper.widgetBackground
                                : Colors.white),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          selectedTileColor: Helper.widgetBackground,
                          tileColor: Colors.white,
                          onTap: () {
                            setState(() {
                              _isSelected = true;
                            });
                          },
                          leading: Text(
                            'Viewer',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset('assets/images/check.svg'),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: _isSelected
                                ? Helper.widgetBackground
                                : Colors.white),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          selectedTileColor: Helper.widgetBackground,
                          tileColor: Colors.white,
                          onTap: () {
                            setState(() {
                              _isSelected = true;
                            });
                          },
                          leading: Text(
                            'Editor',
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.baseBlack,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500),
                          ),
                          trailing: SvgPicture.asset('assets/images/check.svg'),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        height: 52.h,
                        width: double.infinity,
                        child: ElevatedButton(
                          child: Text(
                            "Invite",
                            style: TextStyle(
                                letterSpacing: -0.3,
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
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              )),
                          onPressed: () {
                            context.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
