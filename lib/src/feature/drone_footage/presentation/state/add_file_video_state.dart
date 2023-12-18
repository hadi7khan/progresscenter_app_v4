import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_file_video_state.freezed.dart';

@freezed
class AddFileVideoState with _$AddFileVideoState {
  const factory AddFileVideoState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _AddFileVideoState;
}
