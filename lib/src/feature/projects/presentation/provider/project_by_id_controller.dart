import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/project_by_id_state.dart';

final projectByIdControllerProvider =
    StateNotifierProvider.autoDispose<ProjectController, ProjectByIdState>((ref) {
  final projectService = ref.watch(projectProvider);
  return ProjectController(const ProjectByIdState(), projectService);
});

class ProjectController extends StateNotifier<ProjectByIdState> {
  ProjectController(super.state, this.service);
  final ProjectRepositoryImpl service;

  void getProjectById(id) async {
    state = state.copyWith(isFetching: true);
    final result = await service.projectById(id
    );

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, projectDetails: AsyncValue.data(r));
    });
  }
}