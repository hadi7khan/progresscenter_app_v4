import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_ticket_state.freezed.dart';

@freezed
class CreateTicketState with _$CreateTicketState {
  const factory CreateTicketState(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _CreateTicketState;
}