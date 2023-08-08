import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/repository/team_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/state/user_state.dart';

final teamControllerProvider =
    StateNotifierProvider.autoDispose<UserController, UserState>((ref) {
  final teamService = ref.watch(teamProvider);
  return UserController(const UserState(), teamService);
});

class UserController extends StateNotifier<UserState> {
  UserController(super.state, this.service);
  final TeamRepositoryImpl service;

  Future getUser() async {
    state = state.copyWith(isFetching: true);
    final result = await service.userList();
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, users: AsyncValue.data(r));
    });
  }
}
