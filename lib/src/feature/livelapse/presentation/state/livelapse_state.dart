import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/data/model/livelapse_model.dart';

part 'livelapse_state.freezed.dart';

@freezed
class LivelapseState with _$LivelapseState {
  const factory LivelapseState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<LivelapseModel>> livelapse,
      String? errorMessage}) = _LivelapseState;
}
