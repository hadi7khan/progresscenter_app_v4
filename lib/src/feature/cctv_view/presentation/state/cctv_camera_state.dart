import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/data/model/cctv_camera_model.dart';

part 'cctv_camera_state.freezed.dart';

@freezed
class CctvCameraState with _$CctvCameraState {
  const factory CctvCameraState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<CctvCameraModel>> cctvCameras,
      String? errorMessage}) = _CctvCameraState;
}
