import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_ticket_reply_state.freezed.dart';

@freezed
class PostTicketReplyState with _$PostTicketReplyState {
  const factory PostTicketReplyState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _PostTicketReplyState;
}
