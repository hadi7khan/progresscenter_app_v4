import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/add_member_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/add_member_widget.dart';
import 'dart:developer';

class ViewedByWidget extends ConsumerStatefulWidget {
  final data;
  final showText;
  final projectId;
  final showExtra;
  const ViewedByWidget(
      {super.key, this.data, this.showText, this.projectId, this.showExtra});

  @override
  ConsumerState<ViewedByWidget> createState() => _ViewedByWidgetState();
}

class _ViewedByWidgetState extends BaseConsumerState<ViewedByWidget> {
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
  String _roleSelected = "Admin";
  int _selectedRoleCupertino = 0;
  String _userRole = "";
  bool showAdminOnlyText = false;

  @override
  void initState() {
    super.initState();
    Service().fetchUserList().then((users) {
      setState(() {
        _myCustomList = users;
      });
    });
    Service().fetchUser().then((user) {
      setState(() {
        _userRole = user.role!;
      });
    });
    Service().fetchTeamList().then((teams) {
      setState(() {
        _teamList = teams;
      });
    });
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        alignment: Alignment.center,
        height: 216,
        // padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system navigation bar.
        // margin: EdgeInsets.only(
        //   bottom: MediaQuery.of(context).viewInsets.bottom,
        // ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: Center(child: child),
        ),
      ),
    );
  }

  void _showPicker(BuildContext ctx) {
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => SizedBox(
              width: 300,
              height: 250,
              child: CupertinoPicker(
                backgroundColor: Colors.white,
                itemExtent: 30,
                scrollController: FixedExtentScrollController(initialItem: 1),
                children: _roles.map((e) {
                  return Text(
                    e,
                    style: const TextStyle(
                        letterSpacing: -0.3, color: Colors.black),
                  );
                }).toList(),
                onSelectedItemChanged: (value) {
                  setState(() {
                    // _selectedValue = value;
                  });
                },
              ),
            ));
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
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              showAddMember =
                                  _userRole == "ADMIN" ? true : false;
                              showAdminOnlyText =
                                  _userRole == "ADMIN" ? false : true;
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
                                  child: SvgPicture.asset(
                                      'assets/images/plus.svg',
                                      // width: 44.w,
                                      // height: 44.h,
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          ref.watch(primaryColorProvider),
                                          BlendMode.srcIn))),
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
                        showAdminOnlyText
                            ? Text(
                                "Only Admins are allowed to  manage users and permissions",
                                style: TextStyle(color: Helper.errorColor),
                              )
                            : SizedBox()
                      ],
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
                                        borderSide: BorderSide(
                                            color: ref
                                                .watch(primaryColorProvider)),
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
                                        child: user.dpUrl != null
                                            ? Image.network(
                                                width: 32.w,
                                                height: 32.h,
                                                user.dpUrl!,
                                                fit: BoxFit.cover,
                                                gaplessPlayback: true,
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
                                          Platform.isIOS
                                              ? InkWell(
                                                  onTap: () {
                                                    _showDialog(
                                                      CupertinoPicker(
                                                        magnification: 1.22,
                                                        squeeze: 1.2,
                                                        useMagnifier: true,
                                                        itemExtent: 30.0,
                                                        // This sets the initial item.
                                                        scrollController:
                                                            FixedExtentScrollController(
                                                          initialItem:
                                                              _selectedRoleCupertino,
                                                        ),
                                                        // This is called when selected item is changed.
                                                        onSelectedItemChanged:
                                                            (int selectedItem) {
                                                          setState(() {
                                                            _selectedRoleCupertino =
                                                                selectedItem;
                                                            log(_selectedRoleCupertino
                                                                .toString());
                                                            _roleSelected =
                                                                _selectedRoleCupertino ==
                                                                        0
                                                                    ? "Admin"
                                                                    : _selectedRoleCupertino ==
                                                                            1
                                                                        ? "Editor"
                                                                        : "Viewer";
                                                            log(_roleSelected
                                                                .toString());
                                                          });
                                                        },
                                                        children:
                                                            _roles.map((e) {
                                                          return Text(
                                                            e,
                                                            style: const TextStyle(
                                                                letterSpacing:
                                                                    -0.3,
                                                                color: Colors
                                                                    .black),
                                                          );
                                                        }).toList(),
                                                        //     List<Widget>.generate(_fruitNames.length, (int index) {
                                                        //   return Center(child: Text(_fruitNames[index]));
                                                        // }),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: 10.h,
                                                        bottom: 10.h,
                                                        left: 14.w),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.r),
                                                      border: Border.all(
                                                          color: Helper
                                                              .textColor300),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          _roleSelected,
                                                          style: TextStyle(
                                                            letterSpacing: -0.3,
                                                            color: Helper
                                                                .textColor500,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 14.w),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .help_outline,
                                                                  color: Helper
                                                                      .textColor500,
                                                                  size: 18),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              Icon(
                                                                  Icons
                                                                      .keyboard_arrow_down_outlined,
                                                                  color: Helper
                                                                      .textColor500)
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              : ButtonTheme(
                                                  alignedDropdown: true,
                                                  child: FormBuilderDropdown(
                                                    name: "roles",
                                                    dropdownColor: Colors.white,
                                                    icon: SizedBox(),
                                                    decoration: InputDecoration(
                                                      // labelText: 'Training',
                                                      hintText: "Select roles",
                                                      hintStyle: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor500,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      constraints: BoxConstraints(
                                                          maxWidth: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.9),
                                                      isDense: true,

                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h,
                                                              horizontal: 14.w),
                                                      suffixIcon: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                right: 14.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                                Icons
                                                                    .help_outline,
                                                                color: Helper
                                                                    .textColor500,
                                                                size: 18),
                                                            SizedBox(
                                                              width: 5.w,
                                                            ),
                                                            Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_outlined,
                                                                color: Helper
                                                                    .textColor500)
                                                          ],
                                                        ),
                                                      ),

                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: Helper
                                                                .textColor300),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: ref.watch(
                                                                primaryColorProvider)),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                      // filled: true,
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        _roleSelected = value!;
                                                      });
                                                    },
                                                    items: _roles.map((e) {
                                                      return DropdownMenuItem<
                                                          String>(
                                                        value: e,
                                                        child: Text(
                                                          e,
                                                          style:
                                                              const TextStyle(
                                                                  letterSpacing:
                                                                      -0.3,
                                                                  color: Colors
                                                                      .black),
                                                        ),
                                                        onTap: () {},
                                                      );
                                                    }).toList(),
                                                  ),
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
                                                      color: ref.watch(
                                                          primaryColorProvider)),
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
                            dpUrl: widget.data[index].dpUrl != null
                                ? widget.data[index].dpUrl!
                                : "",
                            name: widget.data[index].name!,
                            backgroundColor: widget.data[index].preset!.color!,
                            size: 35.h,
                            fontSize: 14,
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
                          trailing: widget.showExtra && _userRole == "ADMIN"
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
                                                    '\"' +
                                                    "from this project",
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
                                                    onPressed: () async {
                                                      await Service()
                                                          .revokeMember(
                                                              widget.projectId,
                                                              widget.data[index]
                                                                  .userId)
                                                          .then((value) {
                                                        context.pop();
                                                        context.pop();
                                                        ref
                                                            .read(
                                                                projectByIdControllerProvider
                                                                    .notifier)
                                                            .getProjectById(
                                                                widget
                                                                    .projectId,
                                                                false);
                                                        Utils.flushBarErrorMessage(
                                                            "Access Revoked",
                                                            context);
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
                                                        log("project user data " +
                                                            widget.data[index]
                                                                .userId
                                                                .toString());
                                                        Service()
                                                            .revokeMember(
                                                                widget
                                                                    .projectId,
                                                                widget
                                                                    .data[index]
                                                                    .userId)
                                                            .then((value) {
                                                          context.pop();
                                                          context.pop();
                                                          ref
                                                              .read(
                                                                  projectByIdControllerProvider
                                                                      .notifier)
                                                              .getProjectById(
                                                                  widget
                                                                      .projectId,
                                                                  false);
                                                          Utils.flushBarErrorMessage(
                                                              "Access Revoked",
                                                              context);
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
                    backgroundColor: MaterialStatePropertyAll(
                        ref.watch(primaryColorProvider)),
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
                    ref
                        .read(projectByIdControllerProvider.notifier)
                        .getProjectById(widget.projectId, false);
                    context.pop();
                    Utils.toastSuccessMessage("User Added", context);
                    _emailController.clear();
                  }).onError((error, stackTrace) {
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
            //           color: ref.watch(primaryColorProvider)),
            //       SizedBox(width: 5.h),
            //       Padding(
            //         padding: EdgeInsets.symmetric(
            //           horizontal: 5.w,
            //         ),
            //         child: Text(
            //           _userExists ? "Add to project" : "Send invite",
            //           style: TextStyle(
            //               letterSpacing: -0.3,
            //               color: ref.watch(primaryColorProvider),
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
