import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/state/client_accounts_state.dart';

final clientAccountsControllerProvider = StateNotifierProvider.autoDispose<
    ClientAccountsController, ClientAccountsState>((ref) {
  final clientAccountsService = ref.watch(authProvider);
  return ClientAccountsController(
      const ClientAccountsState(), clientAccountsService);
});

class ClientAccountsController extends StateNotifier<ClientAccountsState> {
  ClientAccountsController(super.state, this.service);
  final AuthRepositoryImpl service;

  Future getClientAccounts() async {
    state = state.copyWith(isFetching: true);
    final result = await service.clientAccounts();
    if (!mounted) return;
    result.fold((l) {
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, clientAccounts: AsyncValue.data(r));
    });
  }
}
