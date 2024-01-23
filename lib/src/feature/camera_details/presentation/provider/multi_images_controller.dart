import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/repository/camera_details_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/state/multi_images_state.dart';

final multiImageControllerProvider =
    StateNotifierProvider.autoDispose<MultiImagesController, MultiImagesState>(
        (ref) {
  final cameraDetailsService = ref.watch(cameraDetailsProvider);
  return MultiImagesController(const MultiImagesState(), cameraDetailsService);
});

class MultiImagesController extends StateNotifier<MultiImagesState> {
  MultiImagesController(super.state, this.service);
  final CameraDetailsRepositoryImpl service;

  Future getMultiImages(projectId, cameraId) async {
    state = state.copyWith(isFetching: true);
    final result = await service.multiImages(projectId, cameraId);
    if (!mounted) return;
    result.fold((l) {
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, multiImages: AsyncValue.data(r));
    });
  }
}
