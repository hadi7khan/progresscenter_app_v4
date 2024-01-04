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
    print("data passed to controller" + data.toString());
    state = state.copyWith(isLoading: true);
    final result = await service.signIn(data);
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
    // print("valueee " + valueee.toString());
    // return result;
  }
  // state = state.copyWith(isSubmitting: true);
  // final result = await service.signIn(data);
  // if (!mounted) return;
  // result.fold((l) {
  //   state = state.copyWith(isSubmitting: false, errorMessage: l.message);
  // }, (r) {
  //   state = state.copyWith(isSubmitting: false, successMessage: 'Sign In.');
  //   value = r;
  // });
  // log("value response" + value.toString());
  // return value;
  // }
}

// class SignInState {
//   final bool isSubmitting;
//   final String? errorMessage;
//   final String? successMessage;

//   const SignInState({
//     this.isSubmitting = false,
//     this.errorMessage,
//     this.successMessage,
//   });

//   SignInState copyWith({
//     bool? isSubmitting,
//     String? errorMessage,
//     String? successMessage,
//   }) {
//     return SignInState(
//       isSubmitting: isSubmitting ?? this.isSubmitting,
//       errorMessage: errorMessage,
//       successMessage: successMessage,
//     );
//   }
// }
