import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/repository/team_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/state/create_user_state.dart';

final createUserProvider =
    StateNotifierProvider.autoDispose<CreateUserController, CreateUserState>(
  (ref) {
    final teamService = ref.watch(teamProvider);
    return CreateUserController(const CreateUserState(), teamService);
  },
);

class CreateUserController extends StateNotifier<CreateUserState> {
  final TeamRepositoryImpl service;
  CreateUserController(super.state, this.service);

  Future createUser(data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.createUser(data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });
    return result;
  }
}
