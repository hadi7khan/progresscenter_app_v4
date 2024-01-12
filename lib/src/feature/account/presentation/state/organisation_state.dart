import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/account/data/models/organisation_model.dart';

part 'organisation_state.freezed.dart';

@freezed
class OrganisationState with _$OrganisationState {
  const factory OrganisationState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<OrganisationModel> organisation,
      String? errorMessage}) = _OrganisationState;
}
