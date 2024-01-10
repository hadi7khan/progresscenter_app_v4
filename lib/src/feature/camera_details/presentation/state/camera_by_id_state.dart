import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/common/data/model/camera_by_id_model.dart';

part 'camera_by_id_state.freezed.dart';

@freezed
class CameraByIdState with _$CameraByIdState {
  const factory CameraByIdState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<CameraByIdModel> cameraById,
      String? errorMessage}) = _CameraByIdState;
}
