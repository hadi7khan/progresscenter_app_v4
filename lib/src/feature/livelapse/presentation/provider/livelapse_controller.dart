import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/repository/livelapse_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/state/livelapse_state.dart';

final livelapseControllerProvider =
    StateNotifierProvider.autoDispose<LivelapseController, LivelapseState>(
        (ref) {
  final livelapseService = ref.watch(livelapseProvider);
  return LivelapseController(const LivelapseState(), livelapseService);
});

class LivelapseController extends StateNotifier<LivelapseState> {
  LivelapseController(super.state, this.service);
  final LivelapseRepositoryImpl service;

  Future getLivelapse(projectId, cameraId) async {
    state = state.copyWith(isFetching: true);
    final result = await service.livelapseList(projectId, cameraId);

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, livelapse: AsyncValue.data(r));
    });
  }
}
