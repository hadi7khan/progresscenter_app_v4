import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/debouncer_delay.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_card.dart';

class SearchProjectScreen extends ConsumerStatefulWidget {
  const SearchProjectScreen({super.key});

  @override
  ConsumerState<SearchProjectScreen> createState() =>
      _SearchProjectScreenState();
}

class _SearchProjectScreenState extends BaseConsumerState<SearchProjectScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _changeState = false;
  String searchText = '';
  final _debouncer = Debouncer(milliseconds: 700);
  FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    _searchController.addListener(_addressControllerListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_searchFocusNode);
    });
    super.initState();
  }

  void _addressControllerListener() {
    print(_searchController.text);
  }

  @override
  void dispose() {
    _searchController.removeListener(_addressControllerListener);
    super.dispose();
  }

  // List<ProjectModel> filterProjects(List<ProjectModel> projects, String query) {
  //   return projects
  //     .where((project) =>
  //         project.name!.contains(query.toLowerCase()) ||
  //         project.location!.name!.contains(query.toLowerCase()) ||
  //         // Add conditions based on other properties
  //         project.images?.any((image) =>
  //                 image..toLowerCase().contains(query.toLowerCase())) ==
  //             true
  //         // Add more conditions as needed
  //     )
  //     .toList();

  // }

  @override
  Widget build(BuildContext context) {
    final projectData =
        ref.watch(projectControllerProvider.select((value) => value.projects));
    // Extract the list of projects from AsyncValue
    // List<ProjectModel> projects = projectData.when(
    //   loading: () => [], // Return an empty list or loading indicator as needed
    //   error: (error, stackTrace) =>
    //       [], // Handle error state, return an empty list or show an error message
    //   data: (projects) =>
    //       projects ?? [], // Use the projects or return an empty list if null
    // );
    // List<ProjectModel> filteredProjects =
    //     filterProjects(projects, _searchController.text);
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
                        ref
                            .read(projectControllerProvider.notifier)
                            .getProjects(searchText: searchText);
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
                  projectData.when(
                    data: (data) {
                      if (data.isEmpty) {
                        return Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.6.h,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/illustration.svg'),
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
                        );
                      }
                      return ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 30.h);
                        },
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.length,
                        itemBuilder: ((context, index) {
                          return ProjectCard(
                              index: index, project: data[index]);
                        }),
                      );
                    },
                    error: (err, _) {
                      return const Text("Failed to load Projects",
                          style: TextStyle(color: Helper.errorColor));
                    },
                    loading: () => LoadingCardListScreen(),
                  )
                  //           if (filteredProjects.isNotEmpty)
                  //           ListView.separated(
                  //   separatorBuilder: (context, index) {
                  //     return SizedBox(height: 30.h);
                  //   },
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.zero,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: filteredProjects.length,
                  //   itemBuilder: ((context, index) {
                  //     return ProjectCard(index: index, project: filteredProjects[index]);
                  //   }),
                  // ),
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   itemCount: filteredProjects.length,
                  //   itemBuilder: (context, index) {
                  //     return ListTile(
                  //       title: Text(filteredProjects[index].name!),
                  //       // Add more details or actions as needed
                  //     );
                  //   },
                  // ),
                  // Add a message when no projects are found
                  // if (filteredProjects.isEmpty &&
                  //     _searchController.text.isNotEmpty)
                  //   Text(
                  //     'No projects found.',
                  //     style: TextStyle(color: Colors.red),
                  //   ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
