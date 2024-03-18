import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/repository/team_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/state/invite_bymail_state.dart';

final inviteByMailProvider =
    StateNotifierProvider.autoDispose<InviteByMailController, InviteByMail>(
  (ref) {
    final teamService = ref.watch(teamProvider);
    return InviteByMailController(const InviteByMail(), teamService);
  },
);

class InviteByMailController extends StateNotifier<InviteByMail> {
  final TeamRepositoryImpl service;
  InviteByMailController(super.state, this.service);

  Future inviteByMail(data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.inviteByMail(data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });
    return result;
  }
}
