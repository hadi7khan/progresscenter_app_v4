import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_comment_state.freezed.dart';

@freezed
class PostCommentState with _$PostCommentState {
  const factory PostCommentState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _PostCommentState;
}
