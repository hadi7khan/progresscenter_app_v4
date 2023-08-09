import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_model.dart';

part 'progressline_state.freezed.dart';

@freezed
class ProgressLineState with _$ProgressLineState {
  const factory ProgressLineState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<ProgressLineModel>> progressline,
      String? errorMessage}) = _ProgressLineState;
}
