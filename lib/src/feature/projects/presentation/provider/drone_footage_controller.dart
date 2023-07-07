import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/drone_footage_state.dart';

final droneFootageControllerProvider = StateNotifierProvider.autoDispose<
    DroneFootageController, DroneFootageState>((ref) {
  final projectService = ref.watch(projectProvider);
  return DroneFootageController(const DroneFootageState(), projectService);
});

class DroneFootageController extends StateNotifier<DroneFootageState> {
  DroneFootageController(super.state, this.service);
  final ProjectRepositoryImpl service;

  void getDroneFootage(id) async {
    state = state.copyWith(isFetching: true);
    final result = await service.droneFootageList(id);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, droneFootages: AsyncValue.data(r));
    });
  }
}
