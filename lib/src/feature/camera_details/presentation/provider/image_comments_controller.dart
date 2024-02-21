import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/repository/camera_details_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/state/image_comments_state.dart';

final imageCommentsControllerProvider = StateNotifierProvider.autoDispose<
    ImageCommentsController, ImageCommentsState>((ref) {
  final cameraService = ref.watch(cameraDetailsProvider);
  return ImageCommentsController(const ImageCommentsState(), cameraService);
});

class ImageCommentsController extends StateNotifier<ImageCommentsState> {
  ImageCommentsController(super.state, this.service);
  final CameraDetailsRepositoryImpl service;

  Future getImageComments(projectId, cameraId, imageName) async {
    var value;
    state = state.copyWith(isFetching: true);
    final result = await service.imageComments(projectId, cameraId, imageName);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, imageComments: AsyncValue.data(r));
      value = r;
    });
    return value;
  }
}
