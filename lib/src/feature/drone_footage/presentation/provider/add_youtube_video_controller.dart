import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/repository/drone_footage_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/state/add_youtube_video_state.dart';

final addYoutubeVideoControllerProvider = StateNotifierProvider.autoDispose<
    AddYoutubeVideoController, AddYoutubeVideoState>(
  (ref) {
    final droneFootageService = ref.watch(droneFootageProvider);
    return AddYoutubeVideoController(
        const AddYoutubeVideoState(), droneFootageService);
  },
);

class AddYoutubeVideoController extends StateNotifier<AddYoutubeVideoState> {
  final DroneFootageRepositoryImpl service;
  AddYoutubeVideoController(super.state, this.service);

  Future addYoutubeVideo(projectId, data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.addYoutubeVideo(projectId, data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });
    return result;
  }
}
