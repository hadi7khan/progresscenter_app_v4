import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/state/forgot_password_state.dart';

final forgotPasswordProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordController, ForgotPasswordState>(
  (ref) {
    final forgotPassService = ref.read(authProvider);
    return ForgotPasswordController(
        const ForgotPasswordState(), forgotPassService);
  },
);

class ForgotPasswordController extends StateNotifier<ForgotPasswordState> {
  final AuthRepositoryImpl service;
  ForgotPasswordController(super.state, this.service);

  Future forgotPass(data) async {
    state = state.copyWith(isLoading: true);
    final result = await service.forgotPassword(data);
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
