import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/repository/drone_footage_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/state/add_vimeo_video_state.dart';

final addVimeoVideoControllerProvider = StateNotifierProvider.autoDispose<
    AddVimeoVideoController, AddVimeoVideoState>(
  (ref) {
    final droneFootageService = ref.watch(droneFootageProvider);
    return AddVimeoVideoController(
        const AddVimeoVideoState(), droneFootageService);
  },
);

class AddVimeoVideoController extends StateNotifier<AddVimeoVideoState> {
  final DroneFootageRepositoryImpl service;
  AddVimeoVideoController(super.state, this.service);

  Future addVimeoVideo(projectId, data) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.addVimeoVideo(projectId, data);
    // return result;
    // if (!mounted) return;
    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      // state = state.copyWith(
      //   isLoading: false,
      //     result: AsyncValue.data(r));
      return r;
    });
    print("valueee " + valueee.toString());
    return result;
  }
}
