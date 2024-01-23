import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/repository/camera_details_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/state/create_zip_state.dart';

final createZipProvider =
    StateNotifierProvider.autoDispose<CreateZipController, CreateZipState>(
  (ref) {
    final cameraDetailsService = ref.watch(cameraDetailsProvider);
    return CreateZipController(const CreateZipState(), cameraDetailsService);
  },
);

class CreateZipController extends StateNotifier<CreateZipState> {
  final CameraDetailsRepositoryImpl service;
  CreateZipController(super.state, this.service);

  Future createZip(projectId, cameraId, data) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.createZip(projectId, cameraId, data);
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
