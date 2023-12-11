import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_by_id_model.dart';

part 'ticket_by_id_state.freezed.dart';

@freezed
class TicketByIdState with _$TicketByIdState {
  const factory TicketByIdState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading()) AsyncValue<TicketByIdModel> ticketById,
      String? errorMessage}) = _TicketByIdState;
}
