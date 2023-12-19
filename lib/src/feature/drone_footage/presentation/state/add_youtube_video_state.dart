import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_youtube_video_state.freezed.dart';

@freezed
class AddYoutubeVideoState with _$AddYoutubeVideoState {
  const factory AddYoutubeVideoState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _AddYoutubeVideoState;
}