import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/models/client_accounts_model.dart';

part 'client_accounts_state.freezed.dart';

@freezed
class ClientAccountsState with _$ClientAccountsState {
  const factory ClientAccountsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<ClientAccountsModel>> clientAccounts,
      String? errorMessage}) = _ClientAccountsState;
}
