import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/repository/support_repo_impl.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/state/create_ticket_state.dart';

final createTicketProvider = StateNotifierProvider.autoDispose<
    CreateTicketController, CreateTicketState>(
  (ref) {
    final supportService = ref.watch(supportProvider);
    return CreateTicketController(const CreateTicketState(), supportService);
  },
);

class CreateTicketController extends StateNotifier<CreateTicketState> {
  final SupportRepositoryImpl service;
  CreateTicketController(super.state, this.service);

  Future createTicket(data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.createTicket(data);

    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      return r;
    });
    return result;
  }
}
