import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/project_lean_state.dart';

final projectleanControllerProvider =
    StateNotifierProvider.autoDispose<ProjectleanController, ProjectLeanState>(
        (ref) {
  final projectService = ref.watch(projectProvider);
  return ProjectleanController(const ProjectLeanState(), projectService);
});

class ProjectleanController extends StateNotifier<ProjectLeanState> {
  ProjectleanController(super.state, this.service);
  final ProjectRepositoryImpl service;

  Future getProjectLean() async {
    state = state.copyWith(isFetching: true);
    final result = await service.projectLeanList();
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, projectlean: AsyncValue.data(r));
    });
  }
}
