import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/support_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'support_state.freezed.dart';

@freezed
class SupportState with _$SupportState {
  const factory SupportState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<SupportModel>> users,
      String? errorMessage}) = _SupportState;
}
