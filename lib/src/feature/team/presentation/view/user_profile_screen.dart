// ignore_for_file: unused_import

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_user_profile.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_lean_controller.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/assigned_projects.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/user_profile_controller.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/widgets/expansion_widget.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';
import 'dart:developer';

class UserProfileScreen extends ConsumerStatefulWidget {
  final userId;
  const UserProfileScreen({super.key, this.userId});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends BaseConsumerState<UserProfileScreen> {
  List<String>? _selectedTeams;
  List<String> _teamList = [];
  bool _status = false;
  List<String> _roles = ["Admin", "Editor", "Viewer"];
  String _roleSelected = "";
  TextEditingController _teamsController = TextEditingController();
  ProjectHierarchySelection? projectHierarchySelection;
  bool isExpanded = false;
  Map<String, bool> switchValues = {};
  List<String> selectedIds = [];
  String? userId;
  String assignedRole = '';
  int _selectedRoleCupertino = 0;
  Map<String, bool> isFirstTapMap = {};
  bool expandFlag = false;
  final _tileKeys = [];
  var _selectedIndex = 0;

  void resetExpansionTileKeysAndSelectedIndex() {
    _tileKeys.clear();
    _selectedIndex = 0;
  }

  @override
  void initState() {
    super.initState();
    initializeTimeZones();
    Service().fetchTeamList().then((teams) {
      setState(() {
        _teamList = teams;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(projectleanControllerProvider.notifier).getProjectLean();
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(userProfileControllerProvider.notifier)
          .getUserProfile(widget.userId)
          .then((value) {
        selectedIds = value.projects;
        _status = value.status == "ENABLED" ? true : false;
        assignedRole = value.role;
        _selectedTeams = value.tags.toList();
        setState(() {});
      });
    });
  }

  String formatTimeDifference(DateTime date,
      {String? timezone, bool showSuffix = true}) {
    Duration difference = DateTime.now().toUtc().difference(date.toUtc());

    if (timezone != null) {
      DateTime convertedDate = TZDateTime.from(date, getLocation(timezone));

      difference = DateTime.now().toUtc().difference(convertedDate.toUtc());
    }
    String timeAgo = DateFormat().add_yMMMMd().add_jm().format(date);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hr ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '$weeks week${weeks == 1 ? '' : 's'} ago';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '$months month${months == 1 ? '' : 's'} ago';
    } else {
      final years = (difference.inDays / 365).floor();
      return '$years year${years == 1 ? '' : 's'} ago';
    }
  }

  void handleRoleSelection(String selectedRole) {
    if (selectedRole != null) {
      _roleSelected = selectedRole;
      assignedRole = selectedRole;
    }
  }

  Widget _buildProjectTree(
      List<model.ProjectModel> projects, String? parentId) {
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

  @override
  Widget build(BuildContext context) {
    final projectData = ref.watch(
        projectleanControllerProvider.select((value) => value.projectlean));
    final userData = ref.watch(
        userProfileControllerProvider.select((value) => value.userProfile));
    return userData.when(
      data: (data) {
        userId = data.id;
        return Scaffold(
          backgroundColor: Helper.screenBackground,
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
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "User details",
                          style: TextStyle(
                              letterSpacing: -0.3,
                              color: Helper.baseBlack,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                      ]),
                  actions: [
                    InkWell(
                      onTap: () {
                        Map<String, dynamic> roleData = {
                          "role": _roleSelected.toUpperCase()
                        };
                        // assignedRole= value;
                        Service().roleChange(data.id, roleData).then((val) {
                          ref
                              .watch(userProfileControllerProvider.notifier)
                              .getUserProfile(widget.userId);
                          Utils.toastSuccessMessage("User updated", context);
                        });

                        Map<String, dynamic> projectData = {
                          "projects": selectedIds
                        };
                        Service()
                            .assignProjectChange(userId, projectData)
                            .then((val) {
                          Utils.toastSuccessMessage(
                              "Projects updated", context);
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
                    .refresh(userProfileControllerProvider.notifier)
                    .getUserProfile(widget.userId);
              },
              child: SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 20.h),
                      child: projectData.when(
                        data: (projectData) {
                          // Update the projects in ProjectHierarchySelection
                          projectHierarchySelection = ProjectHierarchySelection(
                            projects: projectData,
                            selectedIds: selectedIds,
                            onSelectedIdsChange: (ids) {
                              // Handle selected IDs change if needed
                              setState(() {
                                selectedIds = ids;
                              });
                            },
                          );

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
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
                                      dpUrl:
                                          data.dpUrl != null ? data.dpUrl! : "",
                                      name: data.name!,
                                      backgroundColor: data.preset.color!,
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
                                          data.designation!,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Username",
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
                                              data.username!,
                                              style: TextStyle(
                                                  letterSpacing: -0.3,
                                                  color: Helper.textColor900,
                                                  fontSize: 15.sp,
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
                                            "Last Active",
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
                                              data.lastActive != null
                                                  ? formatTimeDifference(
                                                      data.lastActive!,
                                                      timezone:
                                                          'Asia/Kolkata', // Replace with the actual time zone
                                                    )
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
                                    ]),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Text(
                                  "TEAMS & ROLE",
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          context.push('/roles', extra: {
                                            "roles": _roles,
                                            "assignedRole": assignedRole,
                                            "onRoleSelection":
                                                handleRoleSelection
                                          });
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
                                                    _roleSelected.isNotEmpty
                                                        ? '${_roles.firstWhere((role) => role.toLowerCase() == _roleSelected.toLowerCase())}'
                                                        : '${_roles.firstWhere((role) => role.toLowerCase() == assignedRole.toLowerCase())}',
                                                    style: TextStyle(
                                                        letterSpacing: -0.3,
                                                        color:
                                                            Helper.textColor900,
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
                                      Divider(
                                        thickness: 0.1,
                                        color: Helper.textColor700,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          context.push('/selectTeams', extra: {
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
                                                  _selectedTeams!.length > 1
                                                      ? Text(
                                                          "Multiple",
                                                          style: TextStyle(
                                                              letterSpacing:
                                                                  -0.3,
                                                              color: Helper
                                                                  .textColor900,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        )
                                                      : Text(
                                                          _selectedTeams!
                                                                  .isNotEmpty
                                                              ? _selectedTeams!
                                                                  .first
                                                              : "",
                                                          style: TextStyle(
                                                              letterSpacing:
                                                                  -0.3,
                                                              color: Helper
                                                                  .textColor900,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
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
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16.w),
                                child: Text(
                                  "ASSIGNED PROJECTS",
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
                              ),
                            ],
                          );
                        },
                        error: (err, _) {
                          return const Text("Failed to load User Profile",
                              style: TextStyle(
                                  letterSpacing: -0.3,
                                  color: Helper.errorColor));
                        },
                        loading: () => LoadingUserProfile(),
                      ))),
            ),
          ),
        );
      },
      error: (err, _) {
        return const Text("Failed to load Projects",
            style: TextStyle(letterSpacing: -0.3, color: Helper.errorColor));
      },
      loading: () => LoadingUserProfile(),
    );
  }
}
