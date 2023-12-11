import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/repository/support_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/state/post_ticket_reply_state.dart';

final postTicketReplyProvider = StateNotifierProvider.autoDispose<
    PostTicketReplyController, PostTicketReplyState>(
  (ref) {
    final supportService = ref.watch(supportProvider);
    return PostTicketReplyController(
        const PostTicketReplyState(), supportService);
  },
);

class PostTicketReplyController extends StateNotifier<PostTicketReplyState> {
  final SupportRepositoryImpl service;
  PostTicketReplyController(super.state, this.service);

  Future postTicketReply(ticketId, data) async {
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.postTicketReply(ticketId, data);
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
