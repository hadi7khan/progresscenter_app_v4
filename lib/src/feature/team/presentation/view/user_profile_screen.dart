import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/common/widgets/avatar_widget.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_lean_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_lean_controller.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/assigned_projects.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/user_profile_controller.dart';
import 'package:timezone/data/latest.dart';
import 'package:timezone/timezone.dart';

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
  String? _userStatus;
  List<String> _roles = ["Admin", "Editor", "Viewer"];
  String _roleSelected = "";
  TextEditingController _teamsController = TextEditingController();
  ProjectHierarchySelection? projectHierarchySelection;
  bool isExpanded = false;
  Map<String, bool> switchValues = {};
  List<String> selectedIds = [];
  String? userId;
  String assignedRole = '';

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
        print("user value" + value.toString());
        selectedIds = value.projects;
        _status = value.status == "ENABLED" ? true : false;
        assignedRole = value.role;
        _selectedTeams = value.tags.toList();
        print("role " + assignedRole.toString());
        setState(() {});
      });
    });
  }

  String formatTimeDifference(DateTime date,
      {String? timezone, bool showSuffix = true}) {
    Duration difference = DateTime.now().toUtc().difference(date.toUtc());

    if (timezone != null) {
      // You may need to use a different time zone package depending on your requirements
      // This example assumes you're using the 'timezone' package.
      // Ensure you add the 'timezone' package to your pubspec.yaml file.
      // Also, make sure to initialize the time zone database using initializeTimeZones().

      // For example:
      // initializeTimeZones();
      // setLocalLocation(getLocation(timezone));

      // Convert the date to the specified time zone
      DateTime convertedDate = TZDateTime.from(date, getLocation(timezone));

      // Uncomment the lines above and modify them according to your project's requirements.

      // Update the 'difference' variable with the converted date
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

  Widget _buildProjectTree(
      List<model.ProjectLeanModel> projects, String? parentId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: projects
          .where((project) => project.parentId == parentId)
          .map((project) {
        Widget mainListTile = ListTile(
          horizontalTitleGap: 8.w,
          // dense: true,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          leading: project.coverImageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.network(
                      project.coverImageUrl!,
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
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/error_image.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          title: Text(
            project.name,
            style: TextStyle(
                color: Helper.baseBlack,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            project.location.name,
            style: TextStyle(
                color: Helper.baseBlack.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.w400),
          ),
          trailing: Switch.adaptive(
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              inactiveTrackColor: Color.fromRGBO(120, 120, 128, 0.16),
              activeTrackColor: Helper.switchActiveColor,
              thumbColor: MaterialStateProperty.all(Colors.white),
              value: selectedIds.contains(project.projectId),
              onChanged: (value) {
                setState(() {
                  switchValues[project.projectId] = value;
                });
                var values =
                    projectHierarchySelection!.changeSelected(project, value);
                print("valueeeeee" + values.toString());
                Map<String, dynamic> projectData = {"projects": selectedIds};
                Service().assignProjectChange(userId, projectData).then((val) {
                  Utils.toastSuccessMessage("Projects updated");
                });
              }),
        );

        Widget children = _buildProjectTree(projects, project.projectId);

        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor:
                isExpanded ? Helper.widgetBackground : Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            tilePadding: EdgeInsets.zero,
            trailing: projectHierarchySelection!.hasChildren(project.projectId)
                ? SvgPicture.asset(
                    'assets/images/chevron-down.svg',
                    color: Helper.baseBlack.withOpacity(0.2),
                    width: 24.w,
                  )
                : SizedBox(
                    width: 24.w,
                  ),
            title: mainListTile,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 8.0.w),
                child: children,
              ),
            ],
            onExpansionChanged: (bool expanding) =>
                setState(() => this.isExpanded = expanding),
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
                  titleSpacing: 12.0.w,
                  leading: InkWell(
                    onTap: () {
                      context.pop();
                    },
                    child: SvgPicture.asset(
                      'assets/images/arrow-left.svg',
                    ),
                  ),
                  leadingWidth: 24,
                  title: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          data.name,
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          data.designation,
                          style: TextStyle(
                              color: Helper.baseBlack,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ]),
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
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
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  AvatarWidget(
                                      dpUrl: data.dp != null ? data.dpUrl : "",
                                      name: data.name,
                                      backgroundColor: data.preset.color,
                                      size: 72),
                                  SizedBox(height: 16.h),
                                  Text(
                                    data.name,
                                    style: TextStyle(
                                        color: Helper.baseBlack,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    data.email,
                                    style: TextStyle(
                                        color: Helper.textColor600,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomInputWidget(
                                      title: "Username",
                                      formField: Text(
                                        data.username,
                                        style: TextStyle(
                                            color: Helper.textColor900,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    CustomInputWidget(
                                      title: "Last Active",
                                      formField: Text(
                                        data.lastActive != null
                                            ? formatTimeDifference(
                                                data.lastActive!,
                                                timezone:
                                                    'Asia/Kolkata', // Replace with the actual time zone
                                              )
                                            : "-",
                                        style: TextStyle(
                                            color: Helper.textColor900,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomInputWidget(
                                      title: "Email",
                                      formField: Text(
                                        data.email,
                                        style: TextStyle(
                                            color: Helper.textColor900,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                    CustomInputWidget(
                                      title: "Status",
                                      formField: Switch.adaptive(
                                          trackOutlineColor:
                                              MaterialStateProperty.all(
                                                  Colors.transparent),
                                          inactiveTrackColor: Color.fromRGBO(
                                              120, 120, 128, 0.16),
                                          activeTrackColor:
                                              Helper.switchActiveColor,
                                          thumbColor: MaterialStateProperty.all(
                                              Colors.white),
                                          value: _status,
                                          onChanged: (value) {
                                            setState(() {
                                              _status = value;
                                              if (value) {
                                                _userStatus = "ENABLED";
                                              } else {
                                                _userStatus = "DISABLED";
                                              }
                                            });

                                            Map<String, dynamic> statusData = {
                                              "status": _userStatus
                                            };
                                            Service()
                                                .statusChange(
                                                    data.id, statusData)
                                                .then((val) {
                                              Utils.toastSuccessMessage(
                                                  "Status updated");
                                            });
                                          }),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomInputWidget(
                                      title: "Assigned Roles",
                                      formField: FormBuilderDropdown(
                                        name: "roles",
                                        dropdownColor: Colors.white,
                                        icon: SizedBox(),
                                        decoration: InputDecoration(
                                          // labelText: 'Training',
                                          hintText: "Select roles",
                                          hintStyle: TextStyle(
                                            color: Helper.textColor500,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10.h, horizontal: 14.w),
                                          suffixIcon: Padding(
                                            padding:
                                                EdgeInsets.only(right: 14.w),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                Icon(
                                                    Icons
                                                        .keyboard_arrow_down_outlined,
                                                    color: Helper.textColor500)
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
                                        initialValue: _roles.firstWhere(
                                          (role) =>
                                              role.toLowerCase() ==
                                              assignedRole.toLowerCase(),
                                          orElse: () => _roles.first,
                                        ),
                                        onChanged: (value) {
                                          Map<String, dynamic> roleData = {
                                            "role": value!.toUpperCase()
                                          };
                                          // assignedRole= value;
                                          Service()
                                              .roleChange(data.id, roleData)
                                              .then((val) {
                                            Utils.toastSuccessMessage(
                                                "Role updated");
                                          });
                                        },
                                        items: _roles.map((e) {
                                          return DropdownMenuItem<String>(
                                            value: e,
                                            child: Text(
                                              e,
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            onTap: () {},
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12.h,
                                    ),
                                    CustomInputWidget(
                                      title: "Team",
                                      formField: TypeAheadFormField(
                                        textFieldConfiguration:
                                            TextFieldConfiguration(
                                          controller: _teamsController,
                                          onSubmitted: (value) {
                                            setState(() {
                                              if (value.isNotEmpty) {
                                                _selectedTeams!.add(value);
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
                                              color: Helper.textColor500,
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w400,
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
                                          ),
                                        ),
                                        suggestionsCallback: (pattern) async {
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
                                                    color: Helper.textColor700,
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ));
                                        },
                                        onSuggestionSelected: (team) {
                                          // Do something with the selected user
                                          // print('Selected user: ${user.email}');
                                          setState(() {
                                            _selectedTeams!
                                                .add(team.toString());
                                            _teamsController.clear();
                                          });
                                          Map<String, dynamic> teamData = {
                                            "tags": _selectedTeams
                                          };
                                          Service()
                                              .teamChange(data.id, teamData)
                                              .then((val) {
                                            Utils.toastSuccessMessage(
                                                "Team updated");
                                          });
                                        },
                                        noItemsFoundBuilder: (value) {
                                          return SizedBox();
                                        },
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Wrap(
                                      spacing: 5.w,
                                      children: _selectedTeams!
                                          .toSet()
                                          .map((suggestion) {
                                        return Chip(
                                          label: Text(suggestion),
                                          labelStyle: TextStyle(
                                              color: Helper.textColor500,
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500),
                                          onDeleted: () {
                                            setState(() {
                                              _selectedTeams!
                                                  .remove(suggestion);
                                              print(_selectedTeams);
                                            });
                                            Map<String, dynamic> teamData = {
                                              "tags": _selectedTeams
                                            };
                                            Service()
                                                .teamChange(data.id, teamData)
                                                .then((val) {
                                              Utils.toastSuccessMessage(
                                                  "Team updated");
                                            });
                                          },
                                          deleteIcon: SvgPicture.asset(
                                            'assets/images/close-x.svg',
                                            color: Helper.textColor500,
                                          ),
                                          side: BorderSide.none,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.r)),
                                          backgroundColor:
                                              Helper.widgetBackground,
                                        );
                                      }).toList(),
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.r),
                                color: Colors.white,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomInputWidget(
                                      title: "Assigned Projects",
                                      formField: // Display the hierarchical structure

                                          _buildProjectTree(
                                              projectHierarchySelection!
                                                  .projects,
                                              null),
                                    ),
                                  ]),
                            ),
                          ],
                        );
                      },
                      error: (err, _) {
                        return const Text("Failed to load User Profile",
                            style: TextStyle(color: Helper.errorColor));
                      },
                      loading: () => SizedBox(),
                    ))),
          ),
        );
      },
      error: (err, _) {
        return const Text("Failed to load Projects",
            style: TextStyle(color: Helper.errorColor));
      },
      loading: () => LoadingCardListScreen(),
    );
  }
}
