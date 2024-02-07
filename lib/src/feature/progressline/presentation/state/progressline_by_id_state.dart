import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_model.dart';

part 'progressline_by_id_state.freezed.dart';

@freezed
class ProgresslineByIdState with _$ProgresslineByIdState {
  const factory ProgresslineByIdState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<ProgressLineModel> progresslineById,
      String? errorMessage}) = _ProgresslineByIdState;
}
