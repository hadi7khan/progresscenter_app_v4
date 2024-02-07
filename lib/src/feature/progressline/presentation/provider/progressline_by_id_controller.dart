import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/repository/progressline_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/state/progressline_by_id_state.dart';

final progresslineByIdControllerProvider = StateNotifierProvider.autoDispose<
    ProgresslineController, ProgresslineByIdState>((ref) {
  final progresslineService = ref.watch(progresslineProvider);
  return ProgresslineController(
      const ProgresslineByIdState(), progresslineService);
});

class ProgresslineController extends StateNotifier<ProgresslineByIdState> {
  ProgresslineController(super.state, this.service);
  final ProgresslineRepositoryImpl service;

  Future getProgresslineById(progresslineId, projectId) async {
    state = state.copyWith(isFetching: true);
    final result = await service.progresslineById(progresslineId, projectId);
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
          isFetching: false, progresslineById: AsyncValue.data(r));
    });
  }
}
