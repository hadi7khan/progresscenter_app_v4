import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/repository/support_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/state/support_state.dart';

final supportControllerProvider =
    StateNotifierProvider.autoDispose<SupportController, SupportState>((ref) {
  final supportService = ref.watch(supportProvider);
  return SupportController(const SupportState(), supportService);
});

class SupportController extends StateNotifier<SupportState> {
  SupportController(super.state, this.service);
  final SupportRepositoryImpl service;

  Future getSupportTickets() async {
    state = state.copyWith(isFetching: true);
    final result = await service.supportList();
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, users: AsyncValue.data(r));
    });
  }
}
