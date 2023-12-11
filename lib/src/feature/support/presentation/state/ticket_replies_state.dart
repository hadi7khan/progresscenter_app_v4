import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:progresscenter_app_v4/src/feature/support/data/model/ticket_replies_model.dart';

part 'ticket_replies_state.freezed.dart';

@freezed
class TicketRepliesState with _$TicketRepliesState {
  const factory TicketRepliesState(
      {@Default(false) bool isFetching,
      @Default(AsyncValue.loading())
      AsyncValue<List<TicketRepliesModel>> replies,
      String? errorMessage}) = _TicketRepliesState;
}
