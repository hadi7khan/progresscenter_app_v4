import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/repository/support_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/support/domain/support_repository.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/state/ticket_by_id_state.dart';

final ticketControllerProvider =
    StateNotifierProvider.autoDispose<TicketByIdController, TicketByIdState>(
        (ref) {
  final supportService = ref.watch(supportProvider);
  return TicketByIdController(const TicketByIdState(), supportService);
});

class TicketByIdController extends StateNotifier<TicketByIdState> {
  TicketByIdController(super.state, this.service);
  final SupportRepository service;

  Future getTicketById(id) async {
    var value;
    state = state.copyWith(isFetching: true);
    final result = await service.ticketBYId(id);

    var valueee = await result.fold((l) {
      state = state.copyWith(isFetching: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(isFetching: false, ticketById: AsyncValue.data(r));
      value = r;
    });
    return value;
  }
}
