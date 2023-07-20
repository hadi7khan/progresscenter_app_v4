import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/images_by_camera_id_model.dart';

part 'images_by_cam_id_state.freezed.dart';

@freezed
class ImagesByCamIdState with _$ImagesByCamIdState {
  const factory ImagesByCamIdState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<ImagesByCameraIdModel> imagesByCamId,
      String? errorMessage}) = _ImagesByCamIdState;
}
