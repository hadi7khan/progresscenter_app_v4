import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/repository/progressline_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/state/progressline_state.dart';

final progresslineControllerProvider = StateNotifierProvider.autoDispose<
    ProgresslineController, ProgressLineState>((ref) {
  final progresslineService = ref.watch(progresslineProvider);
  return ProgresslineController(const ProgressLineState(), progresslineService);
});

class ProgresslineController extends StateNotifier<ProgressLineState> {
  ProgresslineController(super.state, this.service);
  final ProgresslineRepositoryImpl service;

  Future getProgressline() async {
    state = state.copyWith(isFetching: true);
    final result = await service.progressLine();
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, progressline: AsyncValue.data(r));
    });
  }
}
