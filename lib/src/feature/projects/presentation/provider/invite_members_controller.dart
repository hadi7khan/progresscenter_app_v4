import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/repository/project_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/state/invite_members_state.dart';

final inviteMembersProvider = StateNotifierProvider.autoDispose<
    InviteMembersController, InviteMembersState>(
  (ref) {
    final projectService = ref.watch(projectProvider);
    return InviteMembersController(const InviteMembersState(), projectService);
  },
);

class InviteMembersController extends StateNotifier<InviteMembersState> {
  final ProjectRepositoryImpl service;
  InviteMembersController(super.state, this.service);

  Future inviteMember(data, id) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.inviteMenbers(data, id);
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
