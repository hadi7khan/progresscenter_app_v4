import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/team/data/model/user_profile_model.dart';

part 'user_profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<UserProfileModel> userProfile,
      String? errorMessage}) = _UserProfileState;
}
