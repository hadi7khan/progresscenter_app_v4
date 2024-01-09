import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/common/skeletons/loading_card_list.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/provider/project_by_id_controller.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/widgets/project_card.dart';
import 'dart:developer';
import 'package:progresscenter_app_v4/src/common/services/services.dart'
    as service;

final superProjectScreenProvider =
    Provider.autoDispose.family<SuperProjectScreen, String>((ref, projectId) {
  return SuperProjectScreen(key: ValueKey(projectId), projectId: projectId);
});

class SuperProjectScreen extends ConsumerStatefulWidget {
  final String projectId;
  const SuperProjectScreen({super.key, required this.projectId});

  @override
  ConsumerState<SuperProjectScreen> createState() => _SuperProjectScreenState();
}

class _SuperProjectScreenState extends BaseConsumerState<SuperProjectScreen> {
  bool includeChildren = true;
  ProjectModel? projectModel;

  @override
  void initState() {
    super.initState();
    service.Service().fetchProjectsList(widget.projectId, true).then((data) {
      setState(() {
        projectModel = data;
      });
      log("data passed superr " + projectModel.toString());
    });

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   ref
    //       .read(projectByIdControllerProvider.notifier)
    //       .getProjectById(widget.projectId, includeChildren);
    // });
  }

  @override
  void dispose() {
    // ref.invalidate(projectByIdControllerProvider);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final superProjectData = ref.watch(
    //     projectByIdControllerProvider.select((value) => value.projectDetails));
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          displacement: 10.0,
          color: Helper.primary,
          onRefresh: () async {
            HapticFeedback.mediumImpact();
            return await service.Service()
                .fetchProjectsList(widget.projectId, true)
                .then((data) {
              setState(() {
                projectModel = data;
              });
              log("data passed superr " + projectModel.toString());
            });
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child:
                    // superProjectData.when(
                    //   data: (data) {
                    //     log("data current  " + data.toString());
                    //     return
                    projectModel == null
                        ? LoadingCardListScreen()
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context.pop();
                                    },
                                    child: Transform.rotate(
                                      angle: 180 * (3.1415926535 / 180),
                                      child: SvgPicture.asset(
                                          'assets/images/chevron-right.svg',
                                          color: Helper.iconColor,
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      // InkWell(
                                      //     onTap: () {
                                      //       context.push("/projectSearch");
                                      //     },
                                      //     child:
                                      //         SvgPicture.asset('assets/images/search.svg')),
                                      SizedBox(width: 12.w),
                                      // SvgPicture.asset('assets/images/archive.svg'),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 14.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    projectModel!.name!,
                                    style: TextStyle(
                                        letterSpacing: -1,
                                        color: Helper.textColor700,
                                        fontSize: 36.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15.h),
                              ListView.separated(
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 30.h);
                                },
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: projectModel!.children!.length,
                                itemBuilder: ((context, index) {
                                  return ProjectCard(
                                      index: index,
                                      project: projectModel!.children![index]);
                                }),
                              )
                            ],
                          )
                //   },
                //   error: (err, _) {
                //     return const Text("Failed to load Projects",
                //         style: TextStyle(color: Helper.errorColor));
                //   },
                //   loading: () => LoadingCardListScreen(),
                // ),
                ),
          ),
        ),
      ),
    );
  }
}
