import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/repository/team_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/state/user_profile_state.dart';

final userProfileControllerProvider =
    StateNotifierProvider.autoDispose<UserProfileController, UserProfileState>(
        (ref) {
  final teamService = ref.watch(teamProvider);
  return UserProfileController(const UserProfileState(), teamService);
});

class UserProfileController extends StateNotifier<UserProfileState> {
  UserProfileController(super.state, this.service);
  final TeamRepositoryImpl service;

  Future getUserProfile(id) async {
    var value;
    state = state.copyWith(isFetching: true);
    final result = await service.userProfile(id);
    // return result;
    // if (!mounted) return;
    var valueee = await result.fold((l) {
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
        isFetching: false,
          userProfile: AsyncValue.data(r));
          print("rrrrrr "+ r.projects.toString());
      value = r;
    });
    print("valueee "+ value.toString());
     return value;
  }
}
