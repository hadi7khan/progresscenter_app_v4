import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/comments_model.dart';

part 'comments_state.freezed.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<CommentsModel>> comments,
      String? errorMessage}) = _CommentsState;
}
