import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/repository/camera_details_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/state/images_by_cam_id_state.dart';

final imagesByCamIdControllerProvider = StateNotifierProvider.autoDispose<
    ImagesByCamIdController, ImagesByCamIdState>((ref) {
  final cameraService = ref.watch(cameraDetailsProvider);
  return ImagesByCamIdController(const ImagesByCamIdState(), cameraService);
});

class ImagesByCamIdController extends StateNotifier<ImagesByCamIdState> {
  ImagesByCamIdController(super.state, this.service);
  final CameraDetailsRepositoryImpl service;

  void getIagesByCamId(projectId, cameraId) async {
    state = state.copyWith(isFetching: true);
    final result = await service.imagesByCameraId(projectId, cameraId);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, imagesByCamId: AsyncValue.data(r));
    });
  }
}
