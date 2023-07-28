import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'advanced_livelapse_state.freezed.dart';

@freezed
class AdvancedLivelapseState with _$AdvancedLivelapseState {
  const factory AdvancedLivelapseState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _AdvancedLivelapseState;
}
