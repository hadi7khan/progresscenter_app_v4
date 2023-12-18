import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_vimeo_video_state.freezed.dart';

@freezed
class AddVimeoVideoState with _$AddVimeoVideoState {
  const factory AddVimeoVideoState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _AddVimeoVideoState;
}
