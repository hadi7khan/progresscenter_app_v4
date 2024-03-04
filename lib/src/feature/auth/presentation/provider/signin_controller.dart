import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/repository/auth_repository_impl.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/state/signin_state.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInController, SigninState>(
  (ref) {
    final signInService = ref.watch(authProvider);
    return SignInController(const SigninState(), signInService);
  },
);

class SignInController extends StateNotifier<SigninState> {
  final AuthRepositoryImpl service;
  SignInController(super.state, this.service);

  Future signIn(data) async {
    var value;
    state = state.copyWith(isLoading: true);
    try {
      final result = await service.signIn(data);

      result.fold(
        (l) {
          state = state.copyWith(isLoading: false, errorMessage: l.message);
        },
        (r) {
          value = r;
        },
      );

      return value;
    } catch (e) {
      // Handle any exceptions here
      log("Error: $e");
      state =
          state.copyWith(isLoading: false, errorMessage: "An error occurred");
      return null; // or throw an exception if needed
    }
  }
}
