import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/account/data/models/accounts_model.dart';

part 'accounts_state.freezed.dart';

@freezed
class AccountsState with _$AccountsState {
  const factory AccountsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<AccountsModel> account,
      String? errorMessage}) = _AccountsState;
}
