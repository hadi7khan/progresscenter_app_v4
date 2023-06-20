import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/repository/auth_repository_impl.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
  (ref) {
    final signInService = ref.watch(authProvider);
    return SignInController(const SignInState(), signInService);
  },
);

class SignInController extends StateNotifier<SignInState> {
  final AuthRepositoryImpl service;
  SignInController(super.state, this.service);

  Future signIn(data) async {
    state = state.copyWith(isSubmitting: true);
    final result = await service.signIn(data);
    if (!mounted) return;
    result.fold((l) {
      state = state.copyWith(isSubmitting: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
          isSubmitting: false, successMessage: 'Forgot password.');
    });
  }
}

class SignInState {
  final bool isSubmitting;
  final String? errorMessage;
  final String? successMessage;

  const SignInState({
    this.isSubmitting = false,
    this.errorMessage,
    this.successMessage,
  });

  SignInState copyWith({
    bool? isSubmitting,
    String? errorMessage,
    String? successMessage,
  }) {
    return SignInState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
