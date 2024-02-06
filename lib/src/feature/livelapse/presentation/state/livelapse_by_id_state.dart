import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/model/livelapse_by_id_model.dart';

part 'livelapse_by_id_state.freezed.dart';

@freezed
class LivelapseByIdState with _$LivelapseByIdState {
  const factory LivelapseByIdState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<LivelapseByIdModel> livelapseById,
      String? errorMessage}) = _LivelapseByIdState;
}
