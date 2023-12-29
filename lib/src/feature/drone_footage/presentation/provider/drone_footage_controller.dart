import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/repository/drone_footage_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/state/drone_footage_state.dart';

final droneFootageControllerProvider = StateNotifierProvider.autoDispose<
    DroneFootageController, DroneFootageState>((ref) {
  final droneFootageService = ref.watch(droneFootageProvider);
  return DroneFootageController(const DroneFootageState(), droneFootageService);
});

class DroneFootageController extends StateNotifier<DroneFootageState> {
  DroneFootageController(super.state, this.service);
  final DroneFootageRepositoryImpl service;

  Future getDroneFootage(id) async {
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
