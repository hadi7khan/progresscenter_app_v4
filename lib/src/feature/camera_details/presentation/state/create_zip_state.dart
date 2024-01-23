import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_zip_state.freezed.dart';

@freezed
class CreateZipState with _$CreateZipState {
  const factory CreateZipState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _CreateZipState;
}
