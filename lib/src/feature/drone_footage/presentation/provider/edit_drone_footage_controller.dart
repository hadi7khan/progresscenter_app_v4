import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/data/repository/drone_footage_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/state/edit_drone_footage_state.dart';

final editDroneFootageControllerProvider = StateNotifierProvider.autoDispose<
    EditDroneFootageController, EditDroneFootageState>(
  (ref) {
    final droneFootageService = ref.watch(droneFootageProvider);
    return EditDroneFootageController(
        const EditDroneFootageState(), droneFootageService);
  },
);

class EditDroneFootageController extends StateNotifier<EditDroneFootageState> {
  final DroneFootageRepositoryImpl service;
  EditDroneFootageController(super.state, this.service);

  Future editDroneFootage(projectId, droneId, data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.editDroneFootage(projectId, droneId, data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });
    return result;
  }
}
