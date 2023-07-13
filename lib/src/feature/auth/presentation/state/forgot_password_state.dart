
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_state.freezed.dart';
@freezed
class ForgotPasswordState with _$ForgotPasswordState{
  const factory ForgotPasswordState({
    @Default(false)
    bool isLoading,
    @Default(AsyncValue.loading())
    
    AsyncValue result,
    String? errorMessage
  }) = _ForgotPasswordState;
}