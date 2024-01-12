import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/account/data/repository/accounts_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/state/organisation_state.dart';

final organisationControllerProvider = StateNotifierProvider.autoDispose<
    OrganisationController, OrganisationState>((ref) {
  final organisationService = ref.watch(accountsProvider);
  return OrganisationController(const OrganisationState(), organisationService);
});

class OrganisationController extends StateNotifier<OrganisationState> {
  OrganisationController(super.state, this.service);
  final AccountsRepositoryImpl service;

  Future getOrganisation() async {
    var value;
    state = state.copyWith(isFetching: true);
    final result = await service.getOrganisation();

    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, organisation: AsyncValue.data(r));
      value = r;
    });
    return value;
  }
}
