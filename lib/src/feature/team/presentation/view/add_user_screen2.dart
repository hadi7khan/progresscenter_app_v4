import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_add_user2.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart'
    as model;
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_lean_controller.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/assigned_projects.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/create_user_controller.dart';
import 'package:timezone/timezone.dart' as tz;

class AddUserScreen2 extends ConsumerStatefulWidget {
  final data;
  const AddUserScreen2({super.key, required this.data});

  @override
  ConsumerState<AddUserScreen2> createState() => _AddUserScreen2State();
}

class _AddUserScreen2State extends BaseConsumerState<AddUserScreen2> {
  TextEditingController _teamsController = TextEditingController();

  List<DropdownMenuItem<String>> timezoneList = [];
  String? _selectedTimezone;
  List<String> _teamList = [];
  List<String> _selectedTeams = [];
  ProjectHierarchySelection? projectHierarchySelection;

  Map<String, bool> switchValues = {};
  List<String> selectedIds = [];
  bool isExpanded = false;
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    super.initState();
    populateTimezones();
    Service().fetchTeamList().then((teams) {
      setState(() {
        _teamList = teams;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(projectleanControllerProvider.notifier).getProjectLean();
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
  }

  Widget _buildProjectTree(
      List<model.ProjectModel> projects, String? parentId) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: projects
          .where((project) => project.parentId == parentId)
          .map((project) {
        Widget mainListTile = ListTile(
          horizontalTitleGap: 8.w,
          visualDensity: VisualDensity(horizontal: 0, vertical: -4),
          contentPadding: EdgeInsets.zero,
          leading: project.coverImageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(4.r),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
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
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/error_image.jpeg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
          title: Text(
            project.name!,
            style: TextStyle(
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
          trailing: Switch.adaptive(
              trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
              inactiveTrackColor: Color.fromRGBO(120, 120, 128, 0.16),
              activeTrackColor: Helper.switchActiveColor,
              thumbColor: MaterialStateProperty.all(Colors.white),
              value: selectedIds.contains(project.id),
              onChanged: (value) {
                setState(() {
                  switchValues[project.id] = value;
                });
                var values =
                    projectHierarchySelection!.changeSelected(project, value);
              }),
        );

        Widget children = _buildProjectTree(projects, project.id);

        return Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            backgroundColor:
                isExpanded ? Helper.widgetBackground : Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r)),
            tilePadding: EdgeInsets.zero,
            trailing: projectHierarchySelection!.hasChildren(project.id)
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
              centerTitle: false,
              titleSpacing: 12.0.w,
              leading: InkWell(
                highlightColor: Colors.transparent,
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  'assets/images/close-x.svg',
                ),
              ),
              leadingWidth: 12,
              title: Text(
                "Add new user",
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
            child: FormBuilder(
              key: _fbKey,
              child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
                  child: projectData.when(
                    data: (data) {
                      projectHierarchySelection = ProjectHierarchySelection(
                        projects: data,
                        selectedIds: selectedIds,
                        onSelectedIdsChange: (ids) {
                          setState(() {
                            selectedIds = ids;
                          });
                        },
                      );
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomInputWidget(
                            title: "Team",
                            formField: TypeAheadFormField(
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
                                setState(() {
                                  _selectedTeams.add(team.toString());
                                  _teamsController.clear();
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
                          SizedBox(height: 12.h),
                          CustomInputWidget(
                            title: "Time Zone",
                            formField: FormBuilderDropdown(
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
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  _selectedTimezone = value;
                                });
                              },
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            "Assigned Projects",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor700,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 16.h),
                          // Display the hierarchical structure
                          if (projectHierarchySelection != null)
                            _buildProjectTree(
                                projectHierarchySelection!.projects, null),
                        ],
                      );
                    },
                    error: (err, _) {
                      return const Text("Failed to load Projects",
                          style: TextStyle(
                              letterSpacing: -0.3, color: Helper.errorColor));
                    },
                    loading: () => LoadingAddUser2(),
                  )),
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
                          letterSpacing: -0.3,
                          color: Helper.neutral500,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      Map<String, dynamic> data = {
                        ...widget.data,
                        "tags": _selectedTeams,
                        "projects": selectedIds,
                        "preferences": {"timezone": _selectedTimezone}
                      };
                      if (_fbKey.currentState!.saveAndValidate()) {
                        await ref
                            .watch(createUserProvider.notifier)
                            .createUser(data)
                            .then((value) async {
                          value.fold((failure) {
                            Utils.flushBarErrorMessage(
                                "Something went wrong", context);
                          }, (res) {});
                          Utils.toastSuccessMessage("User created", context);
                        });
                      }
                    },
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 32.w, vertical: 11.h),
                        backgroundColor: ref.watch(primaryColorProvider),
                        side: BorderSide(color: Helper.textColor300),
                        fixedSize: Size.infinite),
                    child: Text(
                      "Finish",
                      style: TextStyle(
                          letterSpacing: -0.3,
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
