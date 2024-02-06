import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/repository/livelapse_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/state/livelapse_by_id_state.dart';

final livelapseByIdControllerProvider =
    StateNotifierProvider.autoDispose<LivelapseController, LivelapseByIdState>(
        (ref) {
  final livelapseService = ref.watch(livelapseProvider);
  return LivelapseController(const LivelapseByIdState(), livelapseService);
});

class LivelapseController extends StateNotifier<LivelapseByIdState> {
  LivelapseController(super.state, this.service);
  final LivelapseRepositoryImpl service;

  Future getLivelapseById(projectId, cameraId, livelapseId) async {
    var value;
    state = state.copyWith(isFetching: true);
    final result =
        await service.livelapseById(projectId, cameraId, livelapseId);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, livelapseById: AsyncValue.data(r));
      value = r;
    });
    return value;
  }
}
