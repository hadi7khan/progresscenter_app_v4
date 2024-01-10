import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/provider/accounts_controller.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseConsumerState<ProfileScreen> {
  List<String> _roles = ["Admin", "Editor", "Viewer"];
  String _roleSelected = "";
  String assignedRole = '';
  List<String>? _selectedTeams;
  bool _isNameEditing = false;
  bool _isDesignationEditing = false;
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _designationEditingController = TextEditingController();
  FocusNode _nameNode = FocusNode();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(accountsControllerProvider.notifier).getProfile().then((value) {
        assignedRole = value.role;
        _selectedTeams = value.tags.toList();
        _nameEditingController.text = value.name;
        _designationEditingController.text = value.designation;
      });
      if (mounted) {
        setState(() {}); // Trigger a rebuild after setting the text
      }
    });
  }

  void handleRoleSelection(String selectedRole) {
    // Handle the result returned from RolesScreen
    if (selectedRole != null) {
      _roleSelected = selectedRole;
      assignedRole = selectedRole;
    }
  }

  showDate(date, dateFormat) {
    // Parse the installationDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat(dateFormat).format(parsedDate);
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    final accountData =
        ref.watch(accountsControllerProvider.select((value) => value.account));
    return GestureDetector(
      onTap: () {
        setState(() {
          _isNameEditing = false;
          _isDesignationEditing = false;
        });
      },
      child: Scaffold(
        backgroundColor: Helper.widgetBackground,
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
                  "Profile",
                  style: TextStyle(
                      letterSpacing: -0.3,
                      color: Helper.baseBlack,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500),
                ),
                actions: [
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Save",
                      style: TextStyle(
                          color: Helper.primary,
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: accountData.when(
                data: (data) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            AvatarWidget(
                              dpUrl: data.dp != null ? data.dpUrl! : "",
                              name: data.name!,
                              backgroundColor: data.preset!.color!,
                              size: 50,
                              fontSize: 24,
                            ),
                            SizedBox(width: 10.h),
                            Wrap(
                              direction: Axis.vertical,
                              children: [
                                Text(
                                  data.name!,
                                  style: TextStyle(
                                      height: 1.1,
                                      letterSpacing: -0.3,
                                      color: Helper.baseBlack,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  data.designation != null
                                      ? data.designation!
                                      : "-",
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: Helper.baseBlack.withOpacity(0.5),
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Text(
                          "BASIC DETAILS",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 16.w, top: 12.h, bottom: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isNameEditing = true;
                                    _nameNode.requestFocus();
                                  });
                                },
                                child: !_isNameEditing
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Name",
                                            style: TextStyle(
                                                fontSize: 14,
                                                letterSpacing: -0.3,
                                                color: Helper.textColor700,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 16.w,
                                            ),
                                            child: Text(
                                              _nameEditingController
                                                      .text.isNotEmpty
                                                  ? _nameEditingController.text
                                                  : data.name!,
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.textColor900,
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      )
                                    : FormBuilderTextField(
                                        name: 'nameEdit',
                                        controller: _nameEditingController,
                                        focusNode: _nameNode,
                                        // onChanged: (text) {
                                        //   setState(() {});
                                        //   _changeState = true;
                                        // },
                                        // onSubmitted: (text){
                                        //   setState(() {
                                        //     _changeState = true;
                                        //   });
                                        // },

                                        textInputAction: TextInputAction.done,
                                        style: TextStyle(
                                          letterSpacing: -0.3,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        keyboardType: TextInputType.name,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 14.w),
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.textColor500,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),

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
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                              ),
                              Divider(
                                thickness: 0.1,
                                color: Helper.textColor700,
                              ),
                              // SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: -0.3,
                                        color: Helper.textColor700,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 16.w,
                                    ),
                                    child: Text(
                                      data.email!,
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.textColor900,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 0.1,
                                color: Helper.textColor700,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Timezone",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: -0.3,
                                        color: Helper.textColor700,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 16.w,
                                    ),
                                    child: Text(
                                      data.preferences!.timezone!,
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.textColor900,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 0.1,
                                color: Helper.textColor700,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Mobile",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: -0.3,
                                        color: Helper.textColor700,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 16.w,
                                    ),
                                    child: Text(
                                      data.phone!.number.toString(),
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.textColor900,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                thickness: 0.1,
                                color: Helper.textColor700,
                              ),

                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isDesignationEditing = true;
                                  });
                                },
                                child: !_isDesignationEditing
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Designation",
                                            style: TextStyle(
                                                fontSize: 14,
                                                letterSpacing: -0.3,
                                                color: Helper.textColor700,
                                                fontWeight: FontWeight.w400),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 16.w,
                                            ),
                                            child: Text(
                                              _designationEditingController
                                                      .text.isNotEmpty
                                                  ? _designationEditingController
                                                      .text
                                                  : data.designation != null
                                                      ? data.designation!
                                                      : "-",
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.textColor900,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ],
                                      )
                                    : FormBuilderTextField(
                                        name: 'designationEdit',
                                        controller:
                                            _designationEditingController,
                                        // onChanged: (text) {
                                        //   setState(() {});
                                        //   _changeState = true;
                                        // },
                                        // onSubmitted: (text){
                                        //   setState(() {
                                        //     _changeState = true;
                                        //   });
                                        // },

                                        textInputAction: TextInputAction.done,
                                        style: TextStyle(
                                          letterSpacing: -0.3,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textCapitalization:
                                            TextCapitalization.sentences,
                                        keyboardType: TextInputType.name,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 8.h, horizontal: 14.w),
                                          hintText: "",
                                          hintStyle: TextStyle(
                                            letterSpacing: -0.3,
                                            color: Helper.textColor500,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),

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
                                                BorderRadius.circular(8),
                                            borderSide: const BorderSide(
                                                color: Colors.red),
                                          ),
                                        ),
                                        onTap: () {},
                                      ),
                              ),
                              Divider(
                                thickness: 0.1,
                                color: Helper.textColor700,
                              ),

                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Date of Birth",
                                    style: TextStyle(
                                        fontSize: 14,
                                        letterSpacing: -0.3,
                                        color: Helper.textColor700,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      right: 16.w,
                                    ),
                                    child: Text(
                                      showDate(data.dob, "dd MMM, yyyy "),
                                      style: TextStyle(
                                          letterSpacing: -0.3,
                                          color: Helper.textColor900,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ],
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 16.w),
                        child: Text(
                          "YOUR TEAMS & ROLE",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.textColor500,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(
                            left: 16.w, top: 12.h, bottom: 12.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Colors.white,
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  // context.push('/roles', extra: {
                                  //   "roles": _roles,
                                  //   "assignedRole": assignedRole,
                                  //   "onRoleSelection":
                                  //       handleRoleSelection
                                  // });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Role",
                                      style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: -0.3,
                                          color: Helper.textColor700,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Padding(
                                        padding: EdgeInsets.only(
                                          right: 16.w,
                                        ),
                                        child: Row(
                                          children: [
                                            Text(
                                              assignedRole,
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.textColor900,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(width: 5.w),
                                            SvgPicture.asset(
                                              'assets/images/chevron-right.svg',
                                              color: Helper.iconColor,
                                              fit: BoxFit.contain,
                                              height: 16,
                                            ),
                                          ],
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 0.1,
                                color: Helper.textColor700,
                              ),
                              InkWell(
                                onTap: () {
                                  // context.push('/selectTeams', extra: {
                                  //   "teamsList": _teamList,
                                  //   "selectedTeams": _selectedTeams,
                                  //   "userId": data.id
                                  // });
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Teams",
                                      style: TextStyle(
                                          fontSize: 14,
                                          letterSpacing: -0.3,
                                          color: Helper.textColor700,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 16.w,
                                      ),
                                      child: Row(
                                        children: [
                                          // _selectedTeams!.length > 1
                                          //     ? Text(
                                          //         "Multiple",
                                          //         style: TextStyle(
                                          //             letterSpacing: -0.3,
                                          //             color: Helper.textColor900,
                                          //             fontSize: 14.sp,
                                          //             fontWeight:
                                          //                 FontWeight.w500),
                                          //       )
                                          //     : Text(
                                          //         _selectedTeams!.isNotEmpty
                                          //             ? _selectedTeams!.first
                                          //             : "",
                                          //         style: TextStyle(
                                          //             letterSpacing: -0.3,
                                          //             color: Helper.textColor900,
                                          //             fontSize: 14.sp,
                                          //             fontWeight:
                                          //                 FontWeight.w500),
                                          //       ),
                                          SizedBox(width: 5.w),
                                          SvgPicture.asset(
                                            'assets/images/chevron-right.svg',
                                            color: Helper.iconColor,
                                            fit: BoxFit.contain,
                                            height: 16,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                    ],
                  );
                },
                error: (err, _) {
                  return const Text("Failed to load profile",
                      style: TextStyle(
                          letterSpacing: -0.3, color: Helper.errorColor));
                },
                loading: () => LoadingTeamList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
