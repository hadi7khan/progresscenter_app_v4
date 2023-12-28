import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/project_state.dart';

final projectControllerProvider =
    StateNotifierProvider.autoDispose<ProjectController, ProjectState>((ref) {
  final projectService = ref.watch(projectProvider);
  return ProjectController(const ProjectState(), projectService);
});

class ProjectController extends StateNotifier<ProjectState> {
  ProjectController(super.state, this.service);
  final ProjectRepositoryImpl service;

  Future getProjects({searchText = '', training = ''}) async {
    state = state.copyWith(isFetching: true);
    final result = await service.projectList();

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, projects: AsyncValue.data(r));
    });
  }
}
