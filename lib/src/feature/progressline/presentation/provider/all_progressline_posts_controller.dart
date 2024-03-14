import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/model/progressline_model.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/repository/progressline_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/state/all_progressline_posts_state.dart';

final allProgresslinePostsControllerProvider =
    StateNotifierProvider.autoDispose<AllProgresslinePostsController,
        AllProgressLinePostsState>((ref) {
  final progresslineService = ref.watch(progresslineProvider);
  return AllProgresslinePostsController(
      const AllProgressLinePostsState(), progresslineService);
});

class AllProgresslinePostsController
    extends StateNotifier<AllProgressLinePostsState> {
  AllProgresslinePostsController(super.state, this.service);
  final ProgresslineRepositoryImpl service;

  Future getAllProgresslinePosts() async {
    List<ProgressLineModel>? value;
    state = state.copyWith(isFetching: true);
    final result = await service.allProgressLinePosts();
    // if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
          isFetching: false, allProgresslinePosts: AsyncValue.data(r));
      value = r;
    });
    log("value" + value.toString());
    return value!;
  }
}
