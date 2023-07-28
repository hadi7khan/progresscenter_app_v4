import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_livelapse_state.freezed.dart';

@freezed
class BasicLivelapseState with _$BasicLivelapseState {
  const factory BasicLivelapseState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _BasicLivelapseState;
}
