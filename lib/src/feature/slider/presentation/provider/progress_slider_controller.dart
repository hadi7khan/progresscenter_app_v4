import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/slider/data/repository/slider_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/slider/presentation/state/progress_slider_state.dart';

final progressSliderControllerProvider = StateNotifierProvider.autoDispose<
    ProgressSliderController, ProgressSliderState>((ref) {
  final progressSliderService = ref.watch(progressSliderProvider);
  return ProgressSliderController(
      const ProgressSliderState(), progressSliderService);
});

class ProgressSliderController extends StateNotifier<ProgressSliderState> {
  ProgressSliderController(super.state, this.service);
  final ProgressSliderRepositoryImpl service;

  Future getProgressSlider(projectId, cameraId) async {
    state = state.copyWith(isFetching: true);
    final result = await service.progressSlider(projectId, cameraId);

    return result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, progressSlider: AsyncValue.data(r));
          return r;
    });
  }
}
