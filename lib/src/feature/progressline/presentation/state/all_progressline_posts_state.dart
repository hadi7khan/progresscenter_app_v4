import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_model.dart';

part 'all_progressline_posts_state.freezed.dart';

@freezed
class AllProgressLinePostsState with _$AllProgressLinePostsState {
  const factory AllProgressLinePostsState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<ProgressLineModel>> allProgresslinePosts,
      String? errorMessage}) = _AllProgressLinePostsState;
}
