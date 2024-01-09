import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/widgets/custom_input_widget.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class SelectTeamsScreen extends StatefulWidget {
  final List<String>? teamsList;
  final List<String>? selectedTeams;
  const SelectTeamsScreen({super.key, this.teamsList, this.selectedTeams});

  @override
  State<SelectTeamsScreen> createState() => _SelectTeamsScreenState();
}

class _SelectTeamsScreenState extends State<SelectTeamsScreen> {
  TextEditingController _teamsController = TextEditingController();
  List<String>? _selectedTeams;
  List<String> _teamList = [];
  @override
  Widget build(BuildContext context) {
    log("selectedteams passed" + widget.selectedTeams.toString());
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
                      "Teams",
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ]),
              actions: [
                //  Text(
                //     "Save",
                //     style: TextStyle(
                //         color: Helper.primary,
                //         fontWeight: FontWeight.w500,
                //         fontSize: 16.sp),
                //   ),
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
          padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: Colors.white,
          ),
          child: Wrap(
            children: [
              CustomInputWidget(
                title: "Teams",
                formField: TypeAheadFormField(
                  textFieldConfiguration: TextFieldConfiguration(
                    controller: _teamsController,
                    onSubmitted: (value) {
                      setState(() {
                        if (value.isNotEmpty) {
                          widget.selectedTeams!.add(value);
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
                    // Do something with the selected user
                    // print('Selected user: ${user.email}');
                    setState(() {
                      widget.selectedTeams!.add(team.toString());
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
                children: widget.selectedTeams!.toSet().map((suggestion) {
                  return Chip(
                    label: Text(suggestion),
                    labelStyle: TextStyle(
                        letterSpacing: -0.3,
                        color: Helper.textColor500,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500),
                    onDeleted: () {
                      setState(() {
                        widget.selectedTeams!.remove(suggestion);
                        print(widget.selectedTeams);
                      });
                      // Map<String, dynamic> teamData = {
                      //   "tags": _selectedTeams
                      // };
                      // Service()
                      //     .teamChange(data.id, teamData)
                      //     .then((val) {
                      //   Utils.toastSuccessMessage(
                      //       "Team updated");
                      // });
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
