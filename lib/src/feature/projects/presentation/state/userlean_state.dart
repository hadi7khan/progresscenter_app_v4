import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/user_lean_model.dart';

part 'userlean_state.freezed.dart';

@freezed
class UserLeanState with _$UserLeanState {
  const factory UserLeanState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<UserLeanModel>> userlean,
      String? errorMessage}) = _UserLeanState;
}
