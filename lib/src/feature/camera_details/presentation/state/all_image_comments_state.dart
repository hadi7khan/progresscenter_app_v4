import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/data/model/all_image_comments_model.dart';

part 'all_image_comments_state.freezed.dart';

@freezed
class AllImageCommentsState with _$AllImageCommentsState {
  const factory AllImageCommentsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<AllImageCommentsModel> allImageComments,
      String? errorMessage}) = _AllImageCommentsState;
}
