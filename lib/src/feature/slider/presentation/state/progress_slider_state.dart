import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/slider/data/model/progress_slider_model.dart';

part 'progress_slider_state.freezed.dart';

@freezed
class ProgressSliderState with _$ProgressSliderState {
  const factory ProgressSliderState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<ProgressSliderModel>> progressSlider,
      String? errorMessage}) = _ProgressSliderState;
}
