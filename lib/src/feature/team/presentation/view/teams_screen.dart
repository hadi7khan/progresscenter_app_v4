import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/user_controller.dart';

import 'widgets/team_widget.dart';

class TeamsScreen extends ConsumerStatefulWidget {
  final label;
  final detailsPath;
  const TeamsScreen({super.key, this.label, this.detailsPath});

  @override
  ConsumerState<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends BaseConsumerState<TeamsScreen> {
  List<String> _teamList = ['All'];
  String? _selectedTeam;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(teamControllerProvider.notifier).getUser();
      });
      Service().fetchTeamList().then((value) {
        _teamList.addAll(value);
        print(_teamList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final teamData =
        ref.watch(teamControllerProvider.select((value) => value.users));
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
            child: teamData.when(
              data: (data) {
                final _filteredUserList = _selectedTeam == null
                    ? data
                    : data
                        .where((item) => item.tags!.contains(_selectedTeam))
                        .toList();
                print("_filteredUserList: $_filteredUserList");

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/images/home.svg'),
                        Row(
                          children: [
                            SvgPicture.asset('assets/images/search.svg'),
                            SizedBox(width: 12.w),
                            ConstrainedBox(
                              constraints: new BoxConstraints(
                                maxHeight: 30.h,
                                maxWidth: 30.w,
                              ),
                              child: PopupMenuButton(
                                padding: EdgeInsets.zero,
                                icon:
                                    SvgPicture.asset('assets/images/sort.svg'),
                                position: PopupMenuPosition.under,
                                itemBuilder: (BuildContext context) {
                                  return _teamList.map((team) {
                                    return PopupMenuItem(
                                        value:
                                            team, // Use a unique identifier for each item
                                        child: ListTile(
                                          horizontalTitleGap: 8.w,
                                          dense: true,
                                          visualDensity: VisualDensity(
                                              horizontal: 0, vertical: -4),
                                          contentPadding: EdgeInsets.zero,
                                          title: Text(
                                            team,
                                            style: TextStyle(
                                                letterSpacing: -0.3,
                                                color: Helper.baseBlack,
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                        ));
                                  }).toList();
                                },
                                onSelected: (value) {
                                  print(value.toString());
                                  setState(() {
                                    _selectedTeam =
                                        value == 'All' ? null : value;
                                    print("selectedTeam: $_selectedTeam");
                                  });
                                },
                              ),
                            ),
                            SizedBox(width: 12.w),
                            InkWell(
                                onTap: () {
                                  _showUserBottomSheet(context);
                                },
                                child:
                                    SvgPicture.asset('assets/images/plus.svg')),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 14.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Team",
                          style: TextStyle(
                              letterSpacing: -1,
                              color: Helper.textColor700,
                              fontSize: 36.sp,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.h),
                    TeamWidget(teamData: _filteredUserList),
                  ],
                );
              },
              error: (err, _) {
                return const Text("Failed to load teams",
                    style: TextStyle(
                        letterSpacing: -0.3, color: Helper.errorColor));
              },
              loading: () => LoadingTeamList(),
            )),
      )),
    );
  }

  _showUserBottomSheet(context) {
    return showModalBottomSheet(
      context: context,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 28.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r), topRight: Radius.circular(16.r)),
          color: Colors.white,
        ),
        height: 216.h,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Create User',
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
                InkWell(
                  onTap: () async {
                    context.push('/addUser');
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Add new user',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    context.push('/inviteByMail');
                    context.pop();
                  },
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.white),
                    child: Text(
                      'Invite by email',
                      style: TextStyle(
                          letterSpacing: -0.3,
                          color: Helper.baseBlack,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
