import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/data/repository/progressline_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/state/comment_state.dart';

final postCommentProvider =
    StateNotifierProvider.autoDispose<PostCommentController, PostCommentState>(
  (ref) {
    final progresslineService = ref.watch(progresslineProvider);
    return PostCommentController(const PostCommentState(), progresslineService);
  },
);

class PostCommentController extends StateNotifier<PostCommentState> {
  final ProgresslineRepositoryImpl service;
  PostCommentController(super.state, this.service);

  Future postComment(id, data) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.postComment(id, data);
    // return result;
    // if (!mounted) return;
    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      // state = state.copyWith(
      //   isLoading: false,
      //     result: AsyncValue.data(r));
      return r;
    });
    print("valueee " + valueee.toString());
    return result;
  }
}
