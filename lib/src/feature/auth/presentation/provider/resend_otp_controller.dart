import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/repository/auth_repository_impl.dart';

final resendOTPProvider = StateNotifierProvider.autoDispose<
    ResendOTPController, ResendOTPState>(
  (ref) {
    final resendOTPService = ref.watch(authProvider);
    return ResendOTPController(const ResendOTPState(), resendOTPService);
  },
);

class ResendOTPController extends StateNotifier<ResendOTPState> {
  final AuthRepositoryImpl service;
  ResendOTPController(super.state, this.service);

  Future resendOTP( token) async {
    state = state.copyWith(isSubmitting: true);
    final result = await service.resendOTP( token);
    if (!mounted) return;
    result.fold((l) {
      state = state.copyWith(isSubmitting: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
          isSubmitting: false, successMessage: 'Change password.');
    });
  }
}

class ResendOTPState {
  final bool isSubmitting;
  final String? errorMessage;
  final String? successMessage;

  const ResendOTPState({
    this.isSubmitting = false,
    this.errorMessage,
    this.successMessage,
  });

  ResendOTPState copyWith({
    bool? isSubmitting,
    String? errorMessage,
    String? successMessage,
  }) {
    return ResendOTPState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
