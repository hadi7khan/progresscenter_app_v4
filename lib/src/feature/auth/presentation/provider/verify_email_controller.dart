import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/state/forgot_password_state.dart';

final verifyEmailProvider = StateNotifierProvider.autoDispose<
    VerifyEmailController, ForgotPasswordState>(
  (ref) {
    final verifyEmailService = ref.read(authProvider);
    return VerifyEmailController(
        const ForgotPasswordState(), verifyEmailService);
  },
);

class VerifyEmailController extends StateNotifier<ForgotPasswordState> {
  final AuthRepositoryImpl service;
  VerifyEmailController(super.state, this.service);

  Future verifyEmail(data, token) async {
    state = state.copyWith(isLoading: true);
    final result = await service.verifyEmail(data, token);
    // return result;
    // if (!mounted) return;
    var valueee = await result.fold((l) {
      state = state.copyWith(isLoading: false, errorMessage: l.message);
    }, (r) {
      // state = state.copyWith(
      //   isLoading: false,
      //     result: AsyncValue.data(r));
      return r;
    });

    return result;
  }
}
