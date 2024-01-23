import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/multi_images_model.dart';

part 'multi_images_state.freezed.dart';

@freezed
class MultiImagesState with _$MultiImagesState {
  const factory MultiImagesState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<MultiImagesModel>> multiImages,
      String? errorMessage}) = _MultiImagesState;
}
