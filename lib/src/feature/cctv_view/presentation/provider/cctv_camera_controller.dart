import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/data/repository/cctv_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/presentation/state/cctv_camera_state.dart';

final cctvCameraControllerProvider =
    StateNotifierProvider.autoDispose<CctvCameraController, CctvCameraState>(
        (ref) {
  final cctvService = ref.watch(cctvProvider);
  return CctvCameraController(const CctvCameraState(), cctvService);
});

class CctvCameraController extends StateNotifier<CctvCameraState> {
  CctvCameraController(super.state, this.service);
  final CctvRepositoryImpl service;

  Future getCctvCameras(id) async {
    state = state.copyWith(isFetching: true);
    final result = await service.cctvCameraList(id);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, cctvCameras: AsyncValue.data(r));
    });
  }
}
