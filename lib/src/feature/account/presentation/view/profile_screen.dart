import 'dart:io';
import 'dart:ui';

import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_user_profile.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/provider/accounts_controller.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_lean_controller.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/assigned_projects.dart';
import 'dart:developer';

import 'package:progresscenter_app_v4/src/feature/team/presentation/view/widgets/expansion_widget.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart'
    as service;
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/create_user_controller.dart';
import 'package:timezone/timezone.dart' as tz;

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends BaseConsumerState<ProfileScreen> {
  ProjectHierarchySelection? projectHierarchySelection;
  List<String> selectedIds = [];
  List<String> _teamList = [];
  Map<String, bool> switchValues = {};
  List<String> _roles = ["Admin", "Editor", "Viewer"];
  String _selectedDate = '';
  String _roleSelected = "";
  String assignedRole = '';
  List<String> _selectedTeams = [];
  String _countryDialCode = "+91";
  String _countryCode = "af";
  bool _isNameEditing = false;
  bool _isDesignationEditing = false;
  bool _isMobileEditing = false;
  TextEditingController _nameEditingController = TextEditingController();
  TextEditingController _designationEditingController = TextEditingController();
  TextEditingController _mobileEditingController = TextEditingController();
  TextEditingController _emailEditingController = TextEditingController();
  FocusNode _nameNode = FocusNode();
  FocusNode _designationNode = FocusNode();
  FocusNode _mobileNode = FocusNode();
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  var colorToPass;
  var onChangePass;
  Color? valueToPass;
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  List<DropdownMenuItem<String>> timezoneList = [];
  String? _selectedTimezone;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      final file = XFile(pickedFile.path);
      if (await file.length() > 1000000) {
        // The file is too large, show an error message
        return;
      }
      setState(() {
        _image = file;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    populateTimezones();
    service.Service().fetchTeamList().then((teams) {
      setState(() {
        _teamList = teams;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(projectleanControllerProvider.notifier).getProjectLean();
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(accountsControllerProvider.notifier).getProfile().then((value) {
        colorToPass = value.preferences.primaryColor;
        assignedRole = _roles.firstWhere(
            (role) => role.toLowerCase() == value.role.toLowerCase());
        _selectedTeams = value.tags.toList();
        _nameEditingController.text = value.name;
        _emailEditingController.text = value.email;
        _designationEditingController.text =
            value.designation != null ? value.designation : "-";
        _mobileEditingController.text = value.phone.number.toString();

        log("number" + value.phone.number.toString());
        List<String> allProjects = value.projects.map<String>((project) {
          return project.id.toString();
        }).toList();
        log("all projects" + allProjects.toString());
        List<String> visibleProjects = allProjects
            .filter((id) => !value.hiddenProjects.contains(id))
            .toList();

        setState(() {
          selectedIds = visibleProjects;
          _countryCode = value.phone.countryCode;
          _countryDialCode = value.phone.dialCode;
          _selectedDate = value.dob;
        });
        log("_countryDialCode" + _countryDialCode.toString());
      });
      if (mounted) {
        setState(() {}); // Trigger a rebuild after setting the text
      }
    });
  }

  void populateTimezones() {
    for (String timezoneName in tz.timeZoneDatabase.locations.keys) {
      timezoneList.add(
        DropdownMenuItem(
          value: timezoneName,
          child: Text(timezoneName),
        ),
      );
    }
    log("timezone" + timezoneList.toString());
  }

  showDate(date, dateFormat) {
    log("called" + date);
    setState(() {});
    // Parse the installationDate string into a DateTime object
    DateTime parsedDate = DateTime.parse(date);

    // Format the DateTime object into the desired format
    String formattedDate = DateFormat(dateFormat).format(parsedDate);
    return formattedDate;
  }

  Widget _buildProjectTree(
      List<model.ProjectModel> projects, String? parentId) {
    log("projects passed" + projects.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: projects
          .where((project) => project.parentId == parentId)
          .map((project) {
        ExpansionTileController controller = ExpansionTileController();
        int index = projects.indexOf(project);
        bool hasChildren = projects.any((p) => p.parentId == project.id);
        Widget mainListTile = ListTile(
          horizontalTitleGap: 8.w,
          // dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          leading: project.coverImageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      project.coverImageUrl!,
                      gaplessPlayback: true,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return ClipRRect(
                          child: Image.asset(
                            'assets/images/error_image.jpeg',
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ))
              : ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.asset(
                      'assets/images/error_image.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          title: Text(
            project.name!,
            style: TextStyle(
                height: 1.1,
                letterSpacing: -0.3,
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            project.location!.name!,
            style: TextStyle(
                letterSpacing: -0.3,
                color: Helper.baseBlack.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
        );

        Widget children = _buildProjectTree(projects, project.id);

        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionWidget(
            mainListTile: mainListTile,
            children: children,
            index: index,
            selected: selectedIds.contains(project.id),
            hasChildren: hasChildren,
            onSelectedChange: (value) {
              setState(() {
                switchValues[project.id] = value;
              });

              var values =
                  projectHierarchySelection!.changeSelected(project, value);
            },
          ),
        );
      }).toList(),
    );
  }

  _getColor(String hex) {
    String formattedHex = "FF" + hex.toUpperCase().replaceAll("#", "");
    return int.parse(formattedHex, radix: 16);
  }

  void _showTimezonePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: FormBuilderDropdown(
            name: 'timezone',
            items: timezoneList,
            validator: (val) {
              if (val == null || _selectedTimezone == '') {
                return 'Timezone is required';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Select Timezone",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
            onChanged: (value) {
              setState(() {
                _selectedTimezone = value;
              });
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }

  void _toggleOverlay() {
    if (_overlayEntry == null) {
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)?.insert(_overlayEntry!);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  OverlayEntry _createOverlayEntry() {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: MediaQuery.of(context).size.width,
        child: CompositedTransformFollower(
          link: LayerLink(),
          showWhenUnlinked: false,
          child: Material(
            child: Container(
              height: timezoneList.length * 50.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListView.builder(
                itemCount: timezoneList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(timezoneList[index].toString()),
                    onTap: () {
                      selectedTimezone(timezoneList[index].toString());
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
    return overlayEntry;
  }

  OverlayEntry? _overlayEntry;

  void selectedTimezone(String selectedTimezone) {
    setState(() {
      _overlayEntry?.remove();
      _overlayEntry = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final accountData =
        ref.watch(accountsControllerProvider.select((value) => value.account));
    final projectData = ref.watch(
        projectleanControllerProvider.select((value) => value.projectlean));

    return GestureDetector(
        onTap: () {
          setState(() {
            _isNameEditing = false;
            _isDesignationEditing = false;
            _isMobileEditing = false;
          });
        },
        child: accountData.when(
          data: (data) {
            return Scaffold(
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
                        highlightColor: Colors.transparent,
                        onTap: () {
                          context.pop();
                        },
                        child: Transform.rotate(
                          angle: 180 * (3.1415926535 / 180),
                          child: SvgPicture.asset(
                              'assets/images/chevron-right.svg',
                              color: Helper.iconColor,
                              fit: BoxFit.contain),
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
                          highlightColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              _isNameEditing = false;
                              _isDesignationEditing = false;
                              _isMobileEditing = false;
                            });
                            Map<String, dynamic> profile = {
                              "name": _nameEditingController.text,
                              "designation": _designationEditingController.text,
                              "phone": {
                                "countryCode": _countryCode.toLowerCase(),
                                "dialCode": _countryDialCode,
                                "number": _mobileEditingController.text
                              },
                              "dob": _selectedDate,
                              "email": _emailEditingController.text,
                              "preferences": {"timezone": "Asia/Kolkata"}
                            };

                            service.Service()
                                .changeProfile(profile)
                                .then((val) {
                              ref
                                  .watch(accountsControllerProvider.notifier)
                                  .getProfile();
                              Utils.toastSuccessMessage(
                                  "Profile updated", context);
                            });
                            List<String> hiddenProjects = data.projects!
                                .map<String>((project) {
                                  return project.id.toString();
                                })
                                .filter((id) => !selectedIds.contains(id))
                                .toList();

                            Map<String, dynamic> project = {
                              "hiddenProjects": hiddenProjects
                            };
                            service.Service().hideProjects(project).then((val) {
                              Utils.toastSuccessMessage(
                                  "Projects updated", context);
                            });
                            Map<String, dynamic> color = {
                              "primaryColor": colorToPass
                            };
                            service.Service()
                                .changePrimarycolor(color)
                                .then((val) {
                              _prefsLocator.setPrimaryColor(color: colorToPass);
                              ref.read(primaryColorProvider.notifier).state =
                                  valueToPass!;
                              Utils.toastSuccessMessage(
                                  "primary color updated", context);
                            });
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: ref.watch(primaryColorProvider),
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
                child: RefreshIndicator(
                  displacement: 10.0,
                  color: ref.watch(primaryColorProvider),
                  onRefresh: () async {
                    HapticFeedback.mediumImpact();
                    return await ref
                        .refresh(accountsControllerProvider.notifier)
                        .getProfile();
                  },
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              _showBottomSheet(context);
                            },
                            onLongPress: () {
                              _showDeleteBottomSheet(context);
                            },
                            child: Container(
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
                                            color: Helper.baseBlack
                                                .withOpacity(0.5),
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
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
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          _isNameEditing = true;
                                          _isDesignationEditing = false;
                                          _isMobileEditing = false;
                                          _nameNode.requestFocus();
                                        });
                                      },
                                      child: Row(
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
                                          !_isNameEditing
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 16.w,
                                                  ),
                                                  child: Text(
                                                    _nameEditingController
                                                            .text.isNotEmpty
                                                        ? _nameEditingController
                                                            .text
                                                        : data.name!,
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor900,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: 35.h,
                                                  child: FormBuilderTextField(
                                                    name: 'nameEdit',
                                                    controller:
                                                        _nameEditingController,
                                                    focusNode: _nameNode,
                                                    textAlign: TextAlign.end,
                                                    // onChanged: (text) {
                                                    //   setState(() {});
                                                    //   _changeState = true;
                                                    // },
                                                    // onSubmitted: (text){
                                                    //   setState(() {
                                                    //     _changeState = true;
                                                    //   });
                                                    // },

                                                    textInputAction:
                                                        TextInputAction.done,
                                                    style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8.h,
                                                              horizontal: 14.w),
                                                      hintText: "",
                                                      hintStyle: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor500,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
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
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                ),
                                        ],
                                      )),
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

                                  InkWell(
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      _isNameEditing = false;
                                      _isDesignationEditing = false;
                                      _isMobileEditing = false;
                                      _toggleOverlay();
                                    },
                                    child: Row(
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
                                        // SizedBox(
                                        //   width: MediaQuery.of(context)
                                        //           .size
                                        //           .width *
                                        //       0.6,
                                        //   height: 20.h,
                                        //   child:
                                        // Padding(
                                        //   padding: EdgeInsets.only(right: 16),
                                        //   child:
                                        //     DropdownButtonFormField<String>(
                                        //   decoration: InputDecoration(
                                        //     hintText: "Select Timezone",
                                        //     enabledBorder: InputBorder.none,
                                        //     focusedBorder: InputBorder.none,
                                        //     contentPadding: EdgeInsets.zero,
                                        //   ),
                                        //   items: timezoneList,
                                        //   onChanged: (value) {
                                        //     setState(() {
                                        //       _selectedTimezone = value!;

                                        //     });
                                        //   },
                                        //   onSaved: (value) {
                                        //     setState(() {
                                        //       _selectedTimezone = value!;
                                        //     });
                                        //   },
                                        //   value: _selectedTimezone != ""
                                        //       ? _selectedTimezone
                                        //       : null,
                                        //   isExpanded: true,
                                        //   dropdownColor: Colors.white,
                                        //   icon: SizedBox(),
                                        //   style: TextStyle(
                                        //       letterSpacing: -0.3,
                                        //       color: Helper.textColor900,
                                        //       fontSize: 14.sp,
                                        //       fontWeight: FontWeight.w500),
                                        //   selectedItemBuilder:
                                        //       (BuildContext context) {
                                        //     return timezoneList.map<Widget>(
                                        //         (DropdownMenuItem<String>
                                        //             item) {
                                        //       return Align(
                                        //         alignment:
                                        //             Alignment.centerRight,
                                        //         child: Text(
                                        //           item.value!,
                                        //           style: TextStyle(
                                        //             fontSize: 14,
                                        //             color: Colors
                                        //                 .black, // Change to your desired color
                                        //             fontWeight:
                                        //                 FontWeight.w500,
                                        //           ),
                                        //         ),
                                        //       );
                                        //     }).toList();
                                        //   },
                                        // ),
                                        // ),
                                        // ),
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
                                        if (_overlayEntry != null)
                                          Positioned(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: CompositedTransformFollower(
                                              link: LayerLink(),
                                              showWhenUnlinked: false,
                                              child: Material(
                                                child: Container(
                                                  height: timezoneList.length *
                                                      50.0,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                  child: ListView.builder(
                                                    itemCount:
                                                        timezoneList.length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return ListTile(
                                                        title: Text(
                                                            timezoneList[index]
                                                                .toString()),
                                                        onTap: () {
                                                          selectedTimezone(
                                                              timezoneList[
                                                                      index]
                                                                  .toString());
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                  Divider(
                                    thickness: 0.1,
                                    color: Helper.textColor700,
                                  ),

                                  InkWell(
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          _isMobileEditing = true;
                                          _isNameEditing = false;
                                          _isDesignationEditing = false;
                                          _mobileNode.requestFocus();
                                        });
                                      },
                                      child: Row(
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
                                          !_isMobileEditing
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 16.w,
                                                  ),
                                                  child: Text(
                                                    _mobileEditingController
                                                            .text.isNotEmpty
                                                        ? _mobileEditingController
                                                            .text
                                                        : data.phone!.number
                                                            .toString(),
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor900,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  height: 35.h,
                                                  child: FormBuilderTextField(
                                                    controller:
                                                        _mobileEditingController,
                                                    keyboardType:
                                                        TextInputType.number,
                                                    textAlign: TextAlign.end,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    focusNode: _mobileNode,
                                                    decoration: InputDecoration(
                                                      hintText: 'Enter number',
                                                      prefixIcon: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 10),
                                                        child:
                                                            CountryCodePicker(
                                                          onChanged:
                                                              (CountryCode
                                                                  countryCode) {
                                                            _countryDialCode =
                                                                countryCode
                                                                    .dialCode!;
                                                            _countryCode =
                                                                countryCode
                                                                    .code!;
                                                          },
                                                          // initialSelection: countryDialCode,
                                                          // favorite: [countryDialCode!],
                                                          showDropDownButton:
                                                              true,
                                                          padding:
                                                              EdgeInsets.zero,
                                                          showFlagMain: true,
                                                          hideMainText: true,
                                                          dialogSize: Size(
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.3,
                                                              MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.5),
                                                          dialogBackgroundColor:
                                                              Theme.of(context)
                                                                  .cardColor,
                                                          flagWidth: 22,
                                                        ),
                                                      ),
                                                      // filled: true,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 16,
                                                      ),
                                                    ),
                                                    name: 'phone',
                                                  ),
                                                ),
                                        ],
                                      )),
                                  Divider(
                                    thickness: 0.1,
                                    color: Helper.textColor700,
                                  ),

                                  InkWell(
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        setState(() {
                                          _isDesignationEditing = true;
                                          _isMobileEditing = false;
                                          _isNameEditing = false;
                                          _designationNode.requestFocus();
                                        });
                                      },
                                      child: Row(
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
                                          !_isDesignationEditing
                                              ? Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 16.w,
                                                  ),
                                                  child: Text(
                                                    _designationEditingController
                                                            .text.isNotEmpty
                                                        ? _designationEditingController
                                                            .text
                                                        : data.designation !=
                                                                null
                                                            ? data.designation!
                                                            : "-",
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor900,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              : SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  height: 35.h,
                                                  child: FormBuilderTextField(
                                                    name: 'designationEdit',
                                                    controller:
                                                        _designationEditingController,
                                                    focusNode: _designationNode,
                                                    textAlign: TextAlign.end,
                                                    // onChanged: (text) {
                                                    //   setState(() {});
                                                    //   _changeState = true;
                                                    // },
                                                    // onSubmitted: (text){
                                                    //   setState(() {
                                                    //     _changeState = true;
                                                    //   });
                                                    // },

                                                    textInputAction:
                                                        TextInputAction.done,
                                                    style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                    textCapitalization:
                                                        TextCapitalization
                                                            .sentences,
                                                    keyboardType:
                                                        TextInputType.name,
                                                    autovalidateMode:
                                                        AutovalidateMode
                                                            .onUserInteraction,
                                                    decoration: InputDecoration(
                                                      contentPadding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 8.h,
                                                              horizontal: 14.w),
                                                      hintText: "",
                                                      hintStyle: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor500,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),

                                                      // hintText: widget.control.label,
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
                                                      ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.r),
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .transparent),
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
                                                                .circular(8),
                                                        borderSide:
                                                            const BorderSide(
                                                                color:
                                                                    Colors.red),
                                                      ),
                                                    ),
                                                    onTap: () {},
                                                  ),
                                                ),
                                        ],
                                      )),
                                  Divider(
                                    thickness: 0.1,
                                    color: Helper.textColor700,
                                  ),

                                  InkWell(
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      _isNameEditing = false;
                                      _isDesignationEditing = false;
                                      _isMobileEditing = false;
                                      _showStartDateBottomSheet(
                                          context, data.dob!);
                                    },
                                    child: Row(
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
                                            data.dob != ""
                                                ? showDate(
                                                    data.dob, "dd MMM, yyyy ")
                                                : "",
                                            style: TextStyle(
                                                letterSpacing: -0.3,
                                                color: Helper.textColor900,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
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
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      // context.push('/roles', extra: {
                                      //   "roles": _roles,
                                      //   "assignedRole": assignedRole,
                                      //   "onRoleSelection": handleRoleSelection
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
                                                      color:
                                                          Helper.textColor900,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                // SizedBox(width: 5.w),
                                                // SvgPicture.asset(
                                                //   'assets/images/chevron-right.svg',
                                                //   color: Helper.iconColor,
                                                //   fit: BoxFit.contain,
                                                //   height: 16,
                                                // ),
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
                                    highlightColor: Colors.transparent,
                                    onTap: () {
                                      context.push('/profileTeam', extra: {
                                        "teamsList": _teamList,
                                        "selectedTeams": _selectedTeams,
                                        "userId": data.id
                                      });
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
                                              _selectedTeams.length > 1
                                                  ? Text(
                                                      "Multiple",
                                                      style: TextStyle(
                                                          letterSpacing: -0.3,
                                                          color: Helper
                                                              .textColor900,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    )
                                                  : Text(
                                                      _selectedTeams!.isNotEmpty
                                                          ? _selectedTeams!
                                                              .first
                                                          : "",
                                                      style: TextStyle(
                                                          letterSpacing: -0.3,
                                                          color: Helper
                                                              .textColor900,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
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
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              "COLOR CONFIGURATION",
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
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                                alignment: Alignment.center,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.zero),
                                                titlePadding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0),
                                                contentPadding:
                                                    const EdgeInsets.all(0),
                                                content: SingleChildScrollView(
                                                  child: ColorPicker(
                                                    pickerColor: ref.watch(
                                                        primaryColorProvider),
                                                    onColorChanged: (color) {
                                                      setState(() {
                                                        onChangePass = "#" +
                                                            color.value
                                                                .toRadixString(
                                                                    16)
                                                                .substring(
                                                                    2, 8);
                                                        valueToPass = color;
                                                      });
                                                      log(colorToPass
                                                          .toString());
                                                    },
                                                    colorPickerWidth: 300,
                                                    pickerAreaHeightPercent:
                                                        0.7,
                                                    enableAlpha: true,
                                                    labelTypes: [
                                                      ColorLabelType.rgb,
                                                      ColorLabelType.hsv,
                                                      ColorLabelType.hsl
                                                    ],
                                                    displayThumbColor: true,
                                                    // paletteType: _paletteType,
                                                    pickerAreaBorderRadius:
                                                        const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(2),
                                                      topRight:
                                                          Radius.circular(2),
                                                    ),
                                                    hexInputBar: true,
                                                    // colorHistory:
                                                    //     false,
                                                    // onHistoryChanged:
                                                    //     widget.onHistoryChanged,
                                                  ),
                                                ),
                                                actions: [
                                                  Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          TextButton(
                                                            child: Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: Helper
                                                                      .baseBlack),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {});
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                          ),
                                                          TextButton(
                                                            child: Text(
                                                              'Save',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  color: Helper
                                                                      .primary),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                colorToPass =
                                                                    onChangePass;
                                                              });
                                                              context.pop();
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      TextButton(
                                                        child: Text(
                                                          'Reset to default',
                                                          style: TextStyle(
                                                              fontSize: 14.sp,
                                                              color: Helper
                                                                  .errorColor),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            colorToPass =
                                                                "#0052CC";
                                                            Map<String, dynamic>
                                                                color = {
                                                              "primaryColor":
                                                                  colorToPass
                                                            };
                                                            service.Service()
                                                                .changePrimarycolor(
                                                                    color)
                                                                .then((val) {
                                                              _prefsLocator
                                                                  .setPrimaryColor(
                                                                      color:
                                                                          "#0052CC");
                                                              ref
                                                                      .read(primaryColorProvider
                                                                          .notifier)
                                                                      .state =
                                                                  Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          82,
                                                                          204,
                                                                          1);
                                                              Utils.toastSuccessMessage(
                                                                  "primary color updated",
                                                                  context);
                                                            });

                                                            context.pop();
                                                          });
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ]);
                                          },
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Current Theme",
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
                                                CircleAvatar(
                                                  backgroundColor:
                                                      Color(_getColor(
                                                    colorToPass != null
                                                        ? colorToPass
                                                        : data.preferences!
                                                            .primaryColor!,
                                                  )),
                                                  maxRadius: 5,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  colorToPass != null
                                                      ? colorToPass
                                                      : data.preferences!
                                                          .primaryColor!,
                                                  style: TextStyle(
                                                      letterSpacing: -0.3,
                                                      color:
                                                          Helper.textColor900,
                                                      fontSize: 14.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      )),
                                ]),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16.w),
                            child: Text(
                              "ACCESSIBLE PROJECTS",
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
                          projectData.when(
                            data: (projectdata) {
                              log("projects" + projectdata.toString());
                              // Update the projects in ProjectHierarchySelection
                              projectHierarchySelection =
                                  ProjectHierarchySelection(
                                projects: data.projects!,
                                selectedIds: selectedIds,
                                onSelectedIdsChange: (ids) {
                                  // Handle selected IDs change if needed
                                  setState(() {
                                    selectedIds = ids;
                                  });
                                },
                              );
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(
                                    left: 16.w,
                                    top: 2.h,
                                    bottom: 2.h,
                                    right: 16.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  color: Colors.white,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildProjectTree(
                                          projectHierarchySelection!.projects,
                                          null),
                                    ]),
                              );
                            },
                            error: (err, _) {
                              return const Text("Failed to load profile",
                                  style: TextStyle(
                                      letterSpacing: -0.3,
                                      color: Helper.errorColor));
                            },
                            loading: () => LoadingTeamList(),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              context.push("/changePasswordProfile");
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                  left: 16.w,
                                  top: 16.h,
                                  bottom: 16.h,
                                  right: 16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Text(
                                "Change password",
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    color: ref.watch(primaryColorProvider),
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            onTap: () {
                              context.push("/deleteAccount");
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.only(
                                  left: 16.w,
                                  top: 16.h,
                                  bottom: 16.h,
                                  right: 16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Text(
                                "Delete account",
                                style: TextStyle(
                                    letterSpacing: -0.3,
                                    color: Helper.errorColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
          error: (err, _) {
            return const Text("Failed to load profile",
                style:
                    TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
          },
          loading: () => LoadingUserProfile(),
        ));
  }

  _showDeleteBottomSheet(context) {
    // todo : showDialog for ios

    if (!Platform.isIOS) {
      return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 28.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            height: 200.h,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Delete',
                      style: TextStyle(
                          color: Helper.errorColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Are you sure you want to delete this image? ",
                      style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Helper.textColor500),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () async {
                              service.Service().deleteProfileDp().then((value) {
                                ref
                                    .read(accountsControllerProvider.notifier)
                                    .getProfile();
                                context.pop();
                                Utils.flushBarErrorMessage(
                                    "Image Deleted", context);
                              });
                              setState(() {});
                            },
                            style: TextButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 11),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                backgroundColor: Helper.errorColor,
                                fixedSize: Size.infinite),
                            child: const Text(
                              "Delete",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              context.pop();
                            },
                            style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 11),
                                backgroundColor: Colors.white,
                                side: BorderSide(color: Helper.textColor300),
                                fixedSize: Size.infinite),
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  color: Helper.textColor500,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ]),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
    return showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          'Do you want to delete this image?',
        ),
        content: Text(
          "You cannot undo this action ",
        ),
        actions: <Widget>[
          // if (cancelActionText != null)

          CupertinoDialogAction(
            child: Text(
              "Cancel",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
            ),
            onPressed: () => Navigator.of(context).pop(true),
          ),
          CupertinoDialogAction(
              child: Text(
                "Delete",
                style: TextStyle(
                  color: Helper.errorColor,
                ),
              ),
              onPressed: () {
                service.Service().deleteProfileDp().then((value) {
                  ref.read(accountsControllerProvider.notifier).getProfile();
                  context.pop();
                  Utils.flushBarErrorMessage("Image Deleted", context);
                });
                setState(() {});
              }),
        ],
      ),
    );
  }

  _showStartDateBottomSheet(context, String dob) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Wrap(children: [
        StatefulBuilder(builder: (context, setState) {
          return Container(
            padding: EdgeInsets.only(top: 28.h, left: 20.w, right: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r)),
              color: Colors.white,
            ),
            // height: MediaQuery.of(context).size.height * 1.6,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Select Date',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                CalendarDatePicker2(
                  config: CalendarDatePicker2Config(
                    selectedDayHighlightColor: ref.watch(primaryColorProvider),
                    currentDate:
                        dob != "" ? DateTime.parse(dob) : DateTime.now(),
                    lastDate: dob != "" ? DateTime.parse(dob) : DateTime.now(),
                  ),
                  value: [],
                  onValueChanged: (value) {
                    DateTime date = DateTime.parse(value[0].toString());
                    dob = DateFormat("yyyyMMdd").format(date);
                    // _showDate = DateFormat('dd MMM yyyy').format(date);
                  },
                ),
                Divider(
                  thickness: 0.5,
                ),
                Container(
                  height: 52.h,
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 10.h),
                  child: ElevatedButton(
                    child: Text(
                      "Done",
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
                    onPressed: () {
                      setState(
                        () {
                          _selectedDate = dob;
                        },
                      );
                      (_selectedDate, "dd MMM, yyyy ");
                      log(_selectedDate.toString());
                      context.pop();
                    },
                  ),
                ),
              ],
            ),
          );
        }),
      ]),
    );
  }

  _showBottomSheet(context) {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          title: const Text('Upload Media'),
          // message: const Text('Message'),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              child: Row(children: [
                Icon(
                  CupertinoIcons.camera,
                  color: Helper.primary,
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  'Camera',
                  style: TextStyle(color: Helper.primary),
                ),
              ]),
              onPressed: () {
                _pickImage(ImageSource.camera).then((value) async {
                  await service.Service()
                      .uploadImageForProfile(_image!.path)
                      .then((value) {
                    ref.read(accountsControllerProvider.notifier).getProfile();
                    context.pop();
                    Utils.toastSuccessMessage("Image Uploaded", context);
                  });
                });
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.photo,
                    color: Helper.primary,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Choose Photo',
                    style: TextStyle(color: Helper.primary),
                  ),
                ],
              ),
              onPressed: () {
                _pickImage(ImageSource.gallery).then((value) async {
                  await await service.Service()
                      .uploadImageForProfile(_image!.path)
                      .then((value) {
                    ref.read(accountsControllerProvider.notifier).getProfile();
                    context.pop();
                    Utils.toastSuccessMessage("Image Uploaded", context);
                  });
                });
              },
            ),
            CupertinoActionSheetAction(
              child: Row(
                children: [
                  Icon(
                    CupertinoIcons.doc,
                    color: Helper.primary,
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Text(
                    'Browse from files',
                    style: TextStyle(color: Helper.primary),
                  ),
                ],
              ),
              onPressed: () {
                _pickImage(ImageSource.gallery).then((value) async {
                  await service.Service()
                      .uploadImageForProfile(_image!.path)
                      .then((value) {
                    ref.read(accountsControllerProvider.notifier).getProfile();
                    context.pop();
                    Utils.toastSuccessMessage("Image Uploaded", context);
                  });
                });
              },
            ),
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text(
              'Cancel',
              style: TextStyle(color: Helper.errorColor),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      );
    }
    return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: StatefulBuilder(builder: (context, setState) {
          return Container(
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
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        _pickImage(ImageSource.camera).then((value) async {
                          await service.Service()
                              .uploadImageForProfile(_image!.path)
                              .then((value) {
                            ref
                                .read(accountsControllerProvider.notifier)
                                .getProfile();
                            context.pop();
                            Utils.toastSuccessMessage(
                                "Image Uploaded", context);
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Text(
                          'Take Photo',
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        context.pop();
                        _pickImage(ImageSource.gallery).then((value) async {
                          await await service.Service()
                              .uploadImageForProfile(_image!.path)
                              .then((value) {
                            ref
                                .read(accountsControllerProvider.notifier)
                                .getProfile();
                            context.pop();
                            Utils.toastSuccessMessage(
                                "Image Uploaded", context);
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Text(
                          'Choose Photo',
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _pickImage(ImageSource.gallery).then((value) async {
                          await service.Service()
                              .uploadImageForProfile(
                            _image!.path,
                          )
                              .then((value) {
                            ref
                                .read(accountsControllerProvider.notifier)
                                .getProfile();
                            context.pop();
                            Utils.toastSuccessMessage(
                                "Image Uploaded", context);
                          });
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 16.h),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.white),
                        child: Text(
                          'Browse from files',
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 52.h,
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                          // currentIndex == contents.length - 1 ? "Continue" : "Next"
                        ),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Helper.baseBlack),
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
          );
        }),
      ),
    );
  }
}
