import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_drone_footage_state.freezed.dart';

@freezed
class EditDroneFootageState with _$EditDroneFootageState {
  const factory EditDroneFootageState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _EditDroneFootageState;
}
