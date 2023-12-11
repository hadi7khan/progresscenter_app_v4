import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_replies_model.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/repository/support_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/state/ticket_replies_state.dart';

final ticketRepliesControllerProvider = StateNotifierProvider.autoDispose<
    TicketRepliesController, TicketRepliesState>((ref) {
  final supportService = ref.watch(supportProvider);
  return TicketRepliesController(const TicketRepliesState(), supportService);
});

class TicketRepliesController extends StateNotifier<TicketRepliesState> {
  TicketRepliesController(super.state, this.service);
  final SupportRepositoryImpl service;

  Future getTicketReplies(ticketId) async {
    // var repliesData;
    List<TicketRepliesModel> repliesData = [];
    state = state.copyWith(isFetching: true);
    final result = await service.ticketReplies(ticketId);
    // if (!mounted) return;
    result.fold((l) {
      // error handle
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, replies: AsyncValue.data(r));
      // Assume that asyncValue is an AsyncValue<List<CustomModel>> object
      // AsyncValue<List<TicketRepliesModel>> asyncValue = AsyncValue.data(r);

      // Accessing all properties and creating a List<String> with concatenated values
      repliesData = r;
      // repliesData = AsyncValue.data(r);
    });
    print("repliesData---" + repliesData.toString());
    return repliesData;
  }
}
