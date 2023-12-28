import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/add_member_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/add_member_widget.dart';

class ViewedByWidget extends StatefulWidget {
  final data;
  final showText;
  final projectId;
  final showExtra;
  const ViewedByWidget(
      {super.key, this.data, this.showText, this.projectId, this.showExtra});

  @override
  State<ViewedByWidget> createState() => _ViewedByWidgetState();
}

class _ViewedByWidgetState extends State<ViewedByWidget> {
  bool showAddMember = false;
  TextEditingController _emailController = TextEditingController();
  bool _changeState = false;
  GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  List<UserLeanModel> _myCustomList = [];
  bool _userExists = false;
  TextEditingController _teamsController = TextEditingController();
  List<String> _teamList = [];
  List<String> _selectedTeams = [];
  List<String> _roles = ["Admin", "Editor", "Viewer"];
  String _roleSelected = "";

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
    print("project user data " + widget.data.toString());
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r)),
            color: Colors.white,
          ),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      showAddMember
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  showAddMember = false;
                                });
                              },
                              child: Transform.rotate(
                                angle: 180 * (3.1415926535 / 180),
                                child: SvgPicture.asset(
                                    'assets/images/chevron-right.svg',
                                    color: Helper.iconColor,
                                    fit: BoxFit.contain),
                              ),
                            )
                          : SizedBox(),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              showAddMember ? "Add Member" : widget.showText,
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.baseBlack,
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  if (!showAddMember && widget.showExtra)
                    InkWell(
                      onTap: () {
                        setState(() {
                          showAddMember = true;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 15.h),
                        height: 44.h,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Container(
                              decoration: BoxDecoration(
                                color: Helper.bottomIconBack,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              padding: EdgeInsets.all(8.w),
                              child: SvgPicture.asset('assets/images/plus.svg',
                                  // width: 44.w,
                                  // height: 44.h,
                                  fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                      Helper.primary, BlendMode.srcIn))),
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

                      // Padding(
                      //   padding:
                      //       EdgeInsets.symmetric(horizontal: 5.w, vertical: 22.h),
                      //   child:
                      // Row(children: [
                      //   SvgPicture.asset('assets/images/plus.svg',
                      //       color: Helper.primary),
                      //   SizedBox(width: 5.h),
                      //   Padding(
                      //     padding: EdgeInsets.symmetric(
                      //       horizontal: 5.w,
                      //     ),
                      //     child: Text(
                      //       "Add member",
                      //       style: TextStyle(
                      //           letterSpacing: -0.3,
                      //           color: Helper.baseBlack,
                      //           fontSize: 18.sp,
                      //           fontWeight: FontWeight.w500),
                      //     ),
                      //   ),
                      // ]),
                      // ),
                    )
                  else
                    widget.showExtra
                        ? Container(
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
                                  textFieldConfiguration:
                                      TextFieldConfiguration(
                                    controller: _emailController,
                                    onChanged: (text) {
                                      setState(() {
                                        _userExists = _myCustomList.any(
                                            (user) =>
                                                user.email!.toLowerCase() ==
                                                text.trim().toLowerCase());
                                      });
                                    },
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

                                      suffixIcon: _userExists
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 14.w,
                                                  vertical: 20.h),
                                              child: Text(
                                                "Existing User",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Helper.successColor),
                                              ),
                                            )
                                          : SizedBox(),
                                      // hintText: widget.control.label,
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        borderSide: BorderSide(
                                            color: Helper.textColor300),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        borderSide:
                                            BorderSide(color: Helper.primary),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        borderSide:
                                            const BorderSide(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  suggestionsCallback: (pattern) async {
                                    if (pattern != null && pattern.length > 0) {
                                      return _myCustomList.where((user) =>
                                          user.email!.toLowerCase().contains(
                                              pattern.trim().toLowerCase()));
                                    } else {
                                      return [];
                                    }
                                  },
                                  itemBuilder: (context, UserLeanModel user) {
                                    return ListTile(
                                      leading: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(200.r),
                                        child: user.dp != null
                                            ? Image.network(
                                                width: 32.w,
                                                height: 32.h,
                                                user.dpUrl!,
                                                fit: BoxFit.cover,
                                                errorBuilder: (BuildContext
                                                        context,
                                                    Object exception,
                                                    StackTrace? stackTrace) {
                                                  return ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            200.r),
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
                                                              letterSpacing:
                                                                  -0.3,
                                                              color: Colors
                                                                  .white)),
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
                                      _userExists = true;
                                    });
                                  },
                                  noItemsFoundBuilder: (value) {
                                    return SizedBox();
                                  },
                                ),
                                SizedBox(height: 24.h),
                                !_userExists
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
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
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      vertical: 10.h,
                                                      horizontal: 14.w),
                                              suffixIcon: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 14.w),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(Icons.help_outline,
                                                        color:
                                                            Helper.textColor500,
                                                        size: 18),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    Icon(
                                                        Icons
                                                            .keyboard_arrow_down_outlined,
                                                        color:
                                                            Helper.textColor500)
                                                  ],
                                                ),
                                              ),

                                              enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide: BorderSide(
                                                    color: Helper.textColor300),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide: BorderSide(
                                                    color: Helper.primary),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide: const BorderSide(
                                                    color: Colors.red),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8.r),
                                                borderSide: const BorderSide(
                                                    color: Colors.red),
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
                                                      letterSpacing: -0.3,
                                                      color: Colors.black),
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
                                            textFieldConfiguration:
                                                TextFieldConfiguration(
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
                                                contentPadding:
                                                    EdgeInsets.symmetric(
                                                        vertical: 10.h,
                                                        horizontal: 14.w),
                                                hintText: "Search or add here",
                                                hintStyle: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.textColor500,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  borderSide: BorderSide(
                                                      color:
                                                          Helper.textColor300),
                                                ),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  borderSide: BorderSide(
                                                      color: Helper.primary),
                                                ),
                                                focusedErrorBorder:
                                                    OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  borderSide: const BorderSide(
                                                      color: Colors.red),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.r),
                                                  borderSide: const BorderSide(
                                                      color: Colors.red),
                                                ),
                                              ),
                                            ),
                                            suggestionsCallback:
                                                (pattern) async {
                                              if (pattern != null &&
                                                  pattern.length > 0) {
                                                return _teamList.where((name) =>
                                                    name.toLowerCase().contains(
                                                        pattern
                                                            .trim()
                                                            .toLowerCase()));
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
                                                        color:
                                                            Helper.textColor700,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ));
                                            },
                                            onSuggestionSelected: (team) {
                                              // Do something with the selected user
                                              // print('Selected user: ${user.email}');
                                              setState(() {
                                                _selectedTeams
                                                    .add(team.toString());
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
                                            children: _selectedTeams
                                                .toSet()
                                                .map((suggestion) {
                                              return Chip(
                                                label: Text(suggestion),
                                                labelStyle: TextStyle(
                                                    letterSpacing: -0.3,
                                                    color: Helper.textColor500,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                onDeleted: () {
                                                  setState(() {
                                                    _selectedTeams
                                                        .remove(suggestion);
                                                  });
                                                },
                                                deleteIcon: SvgPicture.asset(
                                                  'assets/images/close-x.svg',
                                                  color: Helper.textColor500,
                                                ),
                                                side: BorderSide.none,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r)),
                                                backgroundColor:
                                                    Helper.widgetBackground,
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      )
                                    : SizedBox()
                              ],
                            ),
                          )
                        : SizedBox(),
                  if (!showAddMember)
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return ListTile(
                          horizontalTitleGap: 12.w,
                          // dense: true,
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          contentPadding: EdgeInsets.only(bottom: 10.h),
                          leading: AvatarWidget(
                            dpUrl: widget.data[index].dp != null
                                ? widget.data[index].dpUrl!
                                : "",
                            name: widget.data[index].name!,
                            backgroundColor: widget.data[index].preset!.color!,
                            size: 35.h,
                          ),
                          title: Text(
                            widget.data[index].name!,
                            style: TextStyle(
                                color: Helper.textColor700,
                                letterSpacing: -0.3,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: widget.showExtra
                              ? Text(
                                  widget.data[index].email!,
                                  style: TextStyle(
                                      color: Helper.textColor600,
                                      letterSpacing: -0.3,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400),
                                )
                              : SizedBox(),
                          trailing: widget.showExtra
                              ? InkWell(
                                  radius: 40,
                                  excludeFromSemantics: true,
                                  onTap: () {
                                    Platform.isIOS
                                        ? showCupertinoDialog(
                                            context: context,
                                            builder: (context) =>
                                                CupertinoAlertDialog(
                                              title: Text(
                                                "Are you sure you want to remove " +
                                                    '\"' +
                                                    widget.data[index].name! +
                                                    '\"',
                                              ),
                                              content: Text(
                                                "You cannot undo this action ",
                                              ),
                                              actions: <Widget>[
                                                // if (cancelActionText != null)

                                                CupertinoDialogAction(
                                                  child: Text(
                                                    "Cancel",
                                                    style: TextStyle(
                                                        color: Colors.blue,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  onPressed: () =>
                                                      Navigator.of(context)
                                                          .pop(true),
                                                ),
                                                CupertinoDialogAction(
                                                    child: Text(
                                                      "Remove",
                                                      style: TextStyle(
                                                        color:
                                                            Helper.errorColor,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Service()
                                                          .revokeMember(
                                                        widget.projectId,
                                                        widget.data.userId,
                                                      )
                                                          .then((value) {
                                                        context.pop();
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(const SnackBar(
                                                                backgroundColor:
                                                                    Colors.red,
                                                                content: Text(
                                                                    "Member Revoked")));
                                                      });
                                                      setState(() {});
                                                    }),
                                              ],
                                            ),
                                          )
                                        : showDialog(
                                            context: context,
                                            builder: ((context) {
                                              return FormBuilder(
                                                child: AlertDialog(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.r),
                                                  ),
                                                  content: StatefulBuilder(
                                                      builder:
                                                          (BuildContext context,
                                                              StateSetter
                                                                  setState) {
                                                    return SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          RichText(
                                                            text: TextSpan(
                                                              text:
                                                                  "Are you sure you want to remove ",
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: Helper
                                                                      .textColor500),
                                                              children: [
                                                                TextSpan(
                                                                  text: '\"' +
                                                                      widget
                                                                          .data[
                                                                              index]
                                                                          .name! +
                                                                      '\"',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Helper
                                                                          .baseBlack),
                                                                ),
                                                                TextSpan(
                                                                  text:
                                                                      ' from this project?',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          14.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: Helper
                                                                          .textColor500),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                  actionsPadding:
                                                      const EdgeInsets.only(
                                                          left: 32,
                                                          bottom: 32,
                                                          right: 32),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () async {
                                                        print(
                                                            "project user data " +
                                                                widget.data.id
                                                                    .toString());
                                                        Service()
                                                            .revokeMember(
                                                                widget
                                                                    .projectId,
                                                                widget.data
                                                                    .userId)
                                                            .then((value) {
                                                          context.pop();
                                                          ScaffoldMessenger
                                                                  .of(context)
                                                              .showSnackBar(const SnackBar(
                                                                  backgroundColor:
                                                                      Colors
                                                                          .red,
                                                                  content: Text(
                                                                      "Access Revoked")));
                                                        });
                                                        setState(() {});
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          11),
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.r),
                                                              ),
                                                              backgroundColor:
                                                                  Helper
                                                                      .errorColor,
                                                              fixedSize: Size
                                                                  .infinite),
                                                      child: const Text(
                                                        "Remove",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        context.pop();
                                                      },
                                                      style:
                                                          TextButton.styleFrom(
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.r),
                                                              ),
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          16,
                                                                      vertical:
                                                                          11),
                                                              backgroundColor:
                                                                  Colors.white,
                                                              side: BorderSide(
                                                                  color: Helper
                                                                      .textColor300),
                                                              fixedSize: Size
                                                                  .infinite),
                                                      child: Text(
                                                        "Cancel",
                                                        style: TextStyle(
                                                            color: Helper
                                                                .textColor500,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ),
                                                  ],
                                                  actionsAlignment:
                                                      MainAxisAlignment.center,
                                                ),
                                              );
                                            }),
                                          );
                                  },
                                  child: SvgPicture.asset(
                                      width: 15,
                                      height: 15,
                                      'assets/images/close-x.svg',
                                      color: Helper.errorColor))
                              : SizedBox(),
                        );
                      },
                    ),
                ]),
          ),
        ),
        if (showAddMember)
          Positioned(
            bottom: 0,
            child: Container(
              height: 52.h,
              margin: EdgeInsets.all(20.w),
              width: MediaQuery.of(context).size.width - 2 * 20.w,
              child: ElevatedButton(
                child: Text(
                  _userExists ? "Add to project" : "Send invite",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  // currentIndex == contents.length - 1 ? "Continue" : "Next"
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Helper.primary),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    )),
                onPressed: () async {
                  Map<String, dynamic> data = {
                    "email": _emailController.text,
                    "role": _userExists
                        ? "ADMIN"
                        : _roleSelected.toUpperCase().toString(),
                    "tags": _selectedTeams
                  };
                  Service().projectInvite(widget.projectId, data).then((value) {
                    Service().fetchUserList();
                    context.pop();
                    Utils.toastSuccessMessage("User Added");
                    _emailController.clear();
                  }).onError((error, stackTrace) {
                    // print(error.toString());
                    var errorMessage = _userExists
                        ? "User already added to project"
                        : "An invitation request has already been sent to this user.";
                    Utils.flushBarErrorMessage(
                        errorMessage.toString(), context);
                  });
                },
              ),
            ),
            //  InkWell(
            //   onTap: () {
            //     Map<String, dynamic> data = {
            //       "email": _emailController.text,
            //       "role": _userExists
            //           ? "ADMIN"
            //           : _roleSelected.toUpperCase().toString(),
            //       "tags": _selectedTeams
            //     };
            //     Service().projectInvite(widget.projectId, data).then((value) {
            //       context.pop();
            //       Utils.toastSuccessMessage("User Added");
            //       _emailController.clear();
            //     }).onError((error, stackTrace) {
            //       // print(error.toString());
            //       var errorMessage = _userExists
            //           ? "User already added to project"
            //           : "An invitation request has already been sent to this user.";
            //       Utils.flushBarErrorMessage(
            //           errorMessage.toString(), context);
            //     });
            //   },
            //   child: Padding(
            //     padding:
            //         EdgeInsets.symmetric(horizontal: 5.w, vertical: 22.h),
            //     child: Row(children: [
            //       SvgPicture.asset('assets/images/plus.svg',
            //           color: Helper.primary),
            //       SizedBox(width: 5.h),
            //       Padding(
            //         padding: EdgeInsets.symmetric(
            //           horizontal: 5.w,
            //         ),
            //         child: Text(
            //           _userExists ? "Add to project" : "Send invite",
            //           style: TextStyle(
            //               letterSpacing: -0.3,
            //               color: Helper.primary,
            //               fontSize: 18.sp,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ),
            //     ]),
            //   ),
            // )
          ),
      ],
    );
  }
}
