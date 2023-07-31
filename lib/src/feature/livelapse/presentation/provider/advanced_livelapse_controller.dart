import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/repository/livelapse_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/state/advanced_livelapse_state.dart';

final advancedLivelapseProvider = StateNotifierProvider.autoDispose<
    AdvancedLivelapseController, AdvancedLivelapseState>(
  (ref) {
    final livelapseService = ref.watch(livelapseProvider);
    return AdvancedLivelapseController(
        const AdvancedLivelapseState(), livelapseService);
  },
);

class AdvancedLivelapseController
    extends StateNotifier<AdvancedLivelapseState> {
  final LivelapseRepositoryImpl service;
  AdvancedLivelapseController(super.state, this.service);

  Future advancedLivelapse(projectId, cameraId, data) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result =
        await service.createAdvancedLivelapse(projectId, cameraId, data);
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
