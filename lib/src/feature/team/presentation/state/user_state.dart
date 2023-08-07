import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/model/user_model.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<UserModel>> users,
      String? errorMessage}) = _UserState;
}
