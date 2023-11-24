import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'invite_bymail_state.freezed.dart';

@freezed
class InviteByMail with _$InviteByMail {
  const factory InviteByMail(
      {@Default(false) bool isLoading,
      @Default(AsyncValue.loading()) AsyncValue result,
      String? errorMessage}) = _InviteByMail;
}
