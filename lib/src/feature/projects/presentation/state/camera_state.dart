import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/camera_model.dart';

part 'camera_state.freezed.dart';

@freezed
class CameraState with _$CameraState {
  const factory CameraState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<List<CameraModel>> cameras,
      String? errorMessage}) = _CameraState;
}
