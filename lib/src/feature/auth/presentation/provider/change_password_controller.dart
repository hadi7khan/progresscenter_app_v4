import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:progresscenter_app_v4/src/feature/auth/data/repository/auth_repository_impl.dart';

final changePasswordProvider = StateNotifierProvider.autoDispose<
    ChangePasswordController, ChangePassState>(
  (ref) {
    final changePassService = ref.watch(authProvider);
    return ChangePasswordController(const ChangePassState(), changePassService);
  },
);

class ChangePasswordController extends StateNotifier<ChangePassState> {
  final AuthRepositoryImpl service;
  ChangePasswordController(super.state, this.service);

  Future changePass(data, token) async {
    state = state.copyWith(isSubmitting: true);
    final result = await service.changePassword(data, token);
    if (!mounted) return;
    result.fold((l) {
      state = state.copyWith(isSubmitting: false, errorMessage: l.message);
    }, (r) {
      state = state.copyWith(
          isSubmitting: false, successMessage: 'Change password.');
    });
  }
}

class ChangePassState {
  final bool isSubmitting;
  final String? errorMessage;
  final String? successMessage;

  const ChangePassState({
    this.isSubmitting = false,
    this.errorMessage,
    this.successMessage,
  });

  ChangePassState copyWith({
    bool? isSubmitting,
    String? errorMessage,
    String? successMessage,
  }) {
    return ChangePassState(
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage,
      successMessage: successMessage,
    );
  }
}
