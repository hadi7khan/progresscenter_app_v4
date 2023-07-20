import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/repository/camera_details_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/state/camera_by_id_state.dart';

final cameraByIdControllerProvider =
    StateNotifierProvider.autoDispose<CameraByIdController, CameraByIdState>(
        (ref) {
  final cameraService = ref.watch(cameraDetailsProvider);
  return CameraByIdController(const CameraByIdState(), cameraService);
});

class CameraByIdController extends StateNotifier<CameraByIdState> {
  CameraByIdController(super.state, this.service);
  final CameraDetailsRepositoryImpl service;

  void getCameraById(projectId, cameraId) async {
    state = state.copyWith(isFetching: true);
    final result = await service.cameraById(projectId, cameraId);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, cameraById: AsyncValue.data(r));
    });
  }
}
