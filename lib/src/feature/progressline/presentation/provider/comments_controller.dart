import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/repository/progressline_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/state/comments_state.dart';

final commentsControllerProvider = StateNotifierProvider.autoDispose<
    CommentsController, CommentsState>((ref) {
  final progresslineService = ref.watch(progresslineProvider);
  return CommentsController(const CommentsState(), progresslineService);
});

class CommentsController extends StateNotifier<CommentsState> {
  CommentsController(super.state, this.service);
  final ProgresslineRepositoryImpl service;

  Future getComments(id) async {
    state = state.copyWith(isFetching: true);
    final result = await service.comments(id);
    if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state =
          state.copyWith(isFetching: false, comments: AsyncValue.data(r));
    });
  }
}
