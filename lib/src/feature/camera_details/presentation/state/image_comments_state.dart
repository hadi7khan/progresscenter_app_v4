import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/image_comments_model.dart';

part 'image_comments_state.freezed.dart';

@freezed
class ImageCommentsState with _$ImageCommentsState {
  const factory ImageCommentsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<ImageCommentsModel> imageComments,
      String? errorMessage}) = _ImageCommentsState;
}
