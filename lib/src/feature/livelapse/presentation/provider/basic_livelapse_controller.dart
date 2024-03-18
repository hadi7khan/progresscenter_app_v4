import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/repository/livelapse_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/state/basic_livelapse_state.dart';

final basicLivelapseProvider = StateNotifierProvider.autoDispose<
    BasicLivelapseController, BasicLivelapseState>(
  (ref) {
    final livelapseService = ref.watch(livelapseProvider);
    return BasicLivelapseController(
        const BasicLivelapseState(), livelapseService);
  },
);

class BasicLivelapseController extends StateNotifier<BasicLivelapseState> {
  final LivelapseRepositoryImpl service;
  BasicLivelapseController(super.state, this.service);

  Future basicLivelapse(projectId, cameraId, data) async {
    state = state.copyWith(isLoading: true);
    final result =
        await service.createBasicLivelapse(projectId, cameraId, data);
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
    return result;
  }
}
