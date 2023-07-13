
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_members_state.freezed.dart';
@freezed
class InviteMembersState with _$InviteMembersState{
  const factory InviteMembersState({
    @Default(false)
    bool isLoading,
    @Default(AsyncValue.loading())
    
    AsyncValue result,
    String? errorMessage
  }) = _InviteMembersState;
}