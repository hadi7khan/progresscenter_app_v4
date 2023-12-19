import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/repository/drone_footage_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/state/add_file_video_state.dart';

final addFileVideoControllerProvider = StateNotifierProvider.autoDispose<
    AddFileVideoController, AddFileVideoState>(
  (ref) {
    final droneFootageService = ref.watch(droneFootageProvider);
    return AddFileVideoController(
        const AddFileVideoState(), droneFootageService);
  },
);

class AddFileVideoController extends StateNotifier<AddFileVideoState> {
  final DroneFootageRepositoryImpl service;
  AddFileVideoController(super.state, this.service);

  Future addFileVideo(projectId, data) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.addFileVideo(projectId, data);
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
