import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_user_profile.dart';
import 'package:progresscenter_app_v4/src/core/utils/flush_message.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart'
    as service;
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/user_profile_controller.dart';

class SelectTeamsScreen extends ConsumerStatefulWidget {
  final List<String>? teamsList;
  final List<String>? selectedTeams;
  final String? userId;
  const SelectTeamsScreen(
      {super.key, this.teamsList, this.selectedTeams, this.userId});

  @override
  ConsumerState<SelectTeamsScreen> createState() => _SelectTeamsScreenState();
}

class _SelectTeamsScreenState extends BaseConsumerState<SelectTeamsScreen> {
  TextEditingController _teamsController = TextEditingController();
  List<String>? _selectedTeams;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref
          .read(userProfileControllerProvider.notifier)
          .getUserProfile(widget.userId)
          .then((value) {
        _selectedTeams = value.tags.toList();
        setState(() {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedTeams == null) {
      return LoadingUserProfile();
    }
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
                highlightColor: Colors.transparent,
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
                      "Teams",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
              actions: [
                InkWell(
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Map<String, dynamic> teamData = {"tags": _selectedTeams};
                    service.Service()
                        .teamChange(widget.userId, teamData)
                        .then((val) {
                      Utils.toastSuccessMessage("Teams updated", context);
                    });
                  },
                  child: Text(
                    "Save",
                    style: TextStyle(
                        color: ref.watch(primaryColorProvider),
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding:
              EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h, right: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Wrap(
            children: [
              TypeAheadFormField(
                textFieldConfiguration: TextFieldConfiguration(
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
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 14.w),
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
                      borderSide:
                          BorderSide(color: ref.watch(primaryColorProvider)),
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
                    return widget.teamsList!.where((name) => name
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
                    _selectedTeams!.add(team.toString());
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
                children: _selectedTeams!.toSet().map((suggestion) {
                  return Chip(
                    label: Text(suggestion),
                    labelStyle: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor500,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    onDeleted: () {
                      setState(() {
                        _selectedTeams!.remove(suggestion);
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
            ],
          ),
        ),
      )),
    );
  }
}
