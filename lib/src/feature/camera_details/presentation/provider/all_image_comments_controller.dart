import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/repository/camera_details_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/state/all_image_comments_state.dart';

final allImageCommentsControllerProvider = StateNotifierProvider.autoDispose<
    AllImageCommentsController, AllImageCommentsState>((ref) {
  final cameraService = ref.watch(cameraDetailsProvider);
  return AllImageCommentsController(
      const AllImageCommentsState(), cameraService);
});

class AllImageCommentsController extends StateNotifier<AllImageCommentsState> {
  AllImageCommentsController(super.state, this.service);
  final CameraDetailsRepositoryImpl service;

  Future getAllImageComments(projectId, cameraId, page) async {
    var value;
    state = state.copyWith(isFetching: true);
    final result = await service.allImageComments(projectId, cameraId, page);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
          isFetching: false, allImageComments: AsyncValue.data(r));
      value = r;
    });
    return value;
  }
}
