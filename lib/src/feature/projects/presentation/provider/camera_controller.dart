import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/camera_state.dart';

final cameraControllerProvider =
    StateNotifierProvider.autoDispose<CameraController, CameraState>((ref) {
  final projectService = ref.watch(projectProvider);
  return CameraController(const CameraState(), projectService);
});

class CameraController extends StateNotifier<CameraState> {
  CameraController(super.state, this.service);
  final ProjectRepositoryImpl service;

  void getCameras(id) async {
    state = state.copyWith(isFetching: true);
    final result = await service.cameraList(id);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, cameras: AsyncValue.data(r));
    });
  }
}
