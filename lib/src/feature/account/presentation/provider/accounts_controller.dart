import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/account/data/repository/accounts_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/state/accounts_state.dart';

final accountsControllerProvider =
    StateNotifierProvider.autoDispose<AccountsController, AccountsState>((ref) {
  final accountsService = ref.watch(accountsProvider);
  return AccountsController(const AccountsState(), accountsService);
});

class AccountsController extends StateNotifier<AccountsState> {
  AccountsController(super.state, this.service);
  final AccountsRepositoryImpl service;

  Future getProfile() async {
    var value;
    state = state.copyWith(isFetching: true);
    final result = await service.getProfile();

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, account: AsyncValue.data(r));
      value = r;
    });
    return value;
  }
}
