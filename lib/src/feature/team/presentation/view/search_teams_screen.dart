import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_team_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/debouncer_delay.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_card.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/model/user_model.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/provider/user_controller.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/widgets/team_widget.dart';
import 'dart:developer';

class SearchTeamScreen extends ConsumerStatefulWidget {
  final List<UserModel> data;
  const SearchTeamScreen({super.key, required this.data});

  @override
  ConsumerState<SearchTeamScreen> createState() => _SearchProjectScreenState();
}

class _SearchProjectScreenState extends BaseConsumerState<SearchTeamScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _changeState = false;
  String searchText = '';
  final _debouncer = Debouncer(milliseconds: 700);
  FocusNode _searchFocusNode = FocusNode();
  List<String> _teamList = ['All'];
  String? _selectedTeam;

  @override
  void initState() {
    // _searchController.addListener(_addressControllerListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
    super.initState();
  }

  // void _addressControllerListener() {
  //   print(_searchController.text);
  // }

  @override
  void dispose() {
    // _searchController.removeListener(_addressControllerListener);
    // ref.invalidate(teamControllerProvider);
    // ref.read(teamControllerProvider.notifier).getUser();
    super.dispose();
  }

  List<UserModel> filterTeams(List<UserModel> teams, String query) {
    return teams
        .where((team) => team.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    log("widget.data passed" + widget.data.toString());
    // final teamData =
    //     ref.watch(teamControllerProvider.select((value) => value.users));
    // Extract the list of users from AsyncValue
    // List<UserModel> teams = teamData.when(
    //     loading: () =>
    //         [], // Return an empty list or loading indicator as needed
    //     error: (error, stackTrace) =>
    //         [], // Handle error state, return an empty list or show an error message
    //     data: (teams) {
    //       log("teams in search" + teams.toString());
    //       log("teams in search length" + teams.length.toString());
    //       return teams ?? [];
    //     } // Use the projects or return an empty list if null
    //     );
    List<UserModel> filteredSearchTeams =
        filterTeams(widget.data, _searchController.text);
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
              centerTitle: true,
              titleSpacing: 12.0.w,
              leading: InkWell(
                onTap: () {
                  context.pop();
                },
                child: SvgPicture.asset(
                  'assets/images/close-x.svg',
                ),
              ),
              leadingWidth: 12,
              title: Text(
                "Search",
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
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'search_project',
                    controller: _searchController,
                    // initialValue: widget.data.projectName,
                    focusNode: _searchFocusNode,
                    onChanged: (text) {
                      setState(() {});
                      _changeState = true;
                      _debouncer.run(() {
                        setState(() {
                          searchText = text!;
                        });
                        // ref
                        //     .read(teamControllerProvider.notifier)
                        //     .getUser(searchText: searchText);
                        List<UserModel> _filteredUsers =
                            filterTeams(widget.data, searchText);

                        // Update the UI with the filtered projects
                        setState(() {
                          filteredSearchTeams = _filteredUsers;
                        });
                      });
                    },
                    onSubmitted: (text) {
                      setState(() {
                        _changeState = true;
                      });
                    },
                    // validator: (val) {
                    //   if ( val == null || val!.isEmpty) {
                    //     return 'Project name is required';
                    //   }
                    //   return null;
                    // },
                    textInputAction: TextInputAction.done,
                    style: TextStyle(
                      fontSize: 16.sp,
                      letterSpacing: -0.3,
                      fontWeight: FontWeight.w400,
                    ),
                    textCapitalization: TextCapitalization.none,
                    keyboardType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.h, horizontal: 14.w),
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Helper.textColor500,
                        letterSpacing: -0.3,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SvgPicture.asset(
                          'assets/images/search.svg',
                          width: 12,
                          height: 12,
                        ),
                      ),
                      suffixIcon: _searchController.text.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 3.w),
                              child: IconButton(
                                icon: Icon(
                                  Icons.clear,
                                  size: 18,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _searchController.clear();
                                    _changeState = false;
                                  });
                                },
                              ),
                            )
                          : SizedBox(),
                      // hintText: widget.control.label,
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
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  if (filteredSearchTeams.isNotEmpty)
                    ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 30.h);
                      },
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredSearchTeams.length,
                      itemBuilder: ((context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TeamWidget(teamData: filteredSearchTeams),
                          ],
                        );
                      }),
                    ),
                  if (filteredSearchTeams.isEmpty)
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.6.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/images/illustration.svg'),
                          SizedBox(height: 16.h),
                          Text(
                            "Oops, we couldn’t find that",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor900,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Please try searching for something else.",
                            style: TextStyle(
                                letterSpacing: -0.3,
                                color: Helper.textColor600,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  // teamData.when(
                  //   data: (data) {
                  // if (data.isEmpty) {
                  //   return Container(
                  //     alignment: Alignment.center,
                  //     height: MediaQuery.of(context).size.height * 0.6.h,
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         SvgPicture.asset(
                  //             'assets/images/illustration.svg'),
                  //         SizedBox(height: 16.h),
                  //         Text(
                  //           "Oops, we couldn’t find that",
                  //           style: TextStyle(
                  //               letterSpacing: -0.3,
                  //               color: Helper.textColor900,
                  //               fontSize: 16.sp,
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //         Text(
                  //           "Please try searching for something else.",
                  //           style: TextStyle(
                  //               letterSpacing: -0.3,
                  //               color: Helper.textColor600,
                  //               fontSize: 14.sp,
                  //               fontWeight: FontWeight.w400),
                  //         ),
                  //       ],
                  //     ),
                  //   );
                  // }
                  //     final _filteredUserList = _selectedTeam == null
                  //         ? data
                  //         : data
                  //             .where(
                  //                 (item) => item.tags!.contains(_selectedTeam))
                  //             .toList();
                  //     print("_filteredUserList: $_filteredUserList");

                  //     return Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         // Row(
                  //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         //   children: [
                  //         //     InkWell(
                  //         //         onTap: () {
                  //         //           context.push('/notifications');
                  //         //         },
                  //         //         child:
                  //         //             SvgPicture.asset('assets/images/home.svg')),
                  //         //     Row(
                  //         //       children: [
                  //         //         SvgPicture.asset('assets/images/search.svg'),
                  //         //         SizedBox(width: 12.w),
                  //         //         ConstrainedBox(
                  //         //           constraints: new BoxConstraints(
                  //         //             maxHeight: 30.h,
                  //         //             maxWidth: 30.w,
                  //         //           ),
                  //         //           child: PopupMenuButton(
                  //         //             padding: EdgeInsets.zero,
                  //         //             icon: SvgPicture.asset(
                  //         //                 'assets/images/sort.svg'),
                  //         //             position: PopupMenuPosition.under,
                  //         //             itemBuilder: (BuildContext context) {
                  //         //               return _teamList.map((team) {
                  //         //                 return PopupMenuItem(
                  //         //                     value:
                  //         //                         team, // Use a unique identifier for each item
                  //         //                     child: ListTile(
                  //         //                       horizontalTitleGap: 8.w,
                  //         //                       dense: true,
                  //         //                       visualDensity: VisualDensity(
                  //         //                           horizontal: 0, vertical: -4),
                  //         //                       contentPadding: EdgeInsets.zero,
                  //         //                       title: Text(
                  //         //                         team,
                  //         //                         style: TextStyle(
                  //         //                             letterSpacing: -0.3,
                  //         //                             color: Helper.baseBlack,
                  //         //                             fontSize: 14.sp,
                  //         //                             fontWeight: FontWeight.w500),
                  //         //                       ),
                  //         //                     ));
                  //         //               }).toList();
                  //         //             },
                  //         //             onSelected: (value) {
                  //         //               print(value.toString());
                  //         //               setState(() {
                  //         //                 _selectedTeam =
                  //         //                     value == 'All' ? null : value;
                  //         //                 print("selectedTeam: $_selectedTeam");
                  //         //               });
                  //         //             },
                  //         //           ),
                  //         //         ),
                  //         //         SizedBox(width: 12.w),

                  //         //       ],
                  //         //     ),
                  //         //   ],
                  //         // ),
                  //         // SizedBox(height: 14.h),
                  //         // Row(
                  //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         //   children: [
                  //         //     Text(
                  //         //       "Team",
                  //         //       style: TextStyle(
                  //         //           letterSpacing: -1,
                  //         //           color: Helper.textColor700,
                  //         //           fontSize: 36.sp,
                  //         //           fontWeight: FontWeight.w600),
                  //         //     ),
                  //         //   ],
                  //         // ),
                  //         // SizedBox(height: 16.h),
                  //         TeamWidget(teamData: _filteredUserList),
                  //       ],
                  //     );
                  //   },
                  //   error: (err, _) {
                  //     return const Text("Failed to load teams",
                  //         style: TextStyle(
                  //             letterSpacing: -0.3, color: Helper.errorColor));
                  //   },
                  //   loading: () => LoadingTeamList(),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
