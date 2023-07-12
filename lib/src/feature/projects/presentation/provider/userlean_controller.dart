import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/userlean_state.dart';

final userleanControllerProvider =
    StateNotifierProvider.autoDispose<UserleanController, UserLeanState>((ref) {
  final projectService = ref.watch(projectProvider);
  return UserleanController(const UserLeanState(), projectService);
});

class UserleanController extends StateNotifier<UserLeanState> {
  UserleanController(super.state, this.service);
  final ProjectRepositoryImpl service;

  Future getUserLean() async {
    state = state.copyWith(isFetching: true);
    final result = await service.userleanList();
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, userlean: AsyncValue.data(r));
    });
  }
}
