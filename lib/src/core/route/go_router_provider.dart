import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/main.dart';
import 'package:progresscenter_app_v4/src/common/error/no_internet_connection_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/forgot_password/change_password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/forgot_password/forgot_password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/onboarding_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/sign_in_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/verify_email_screen.dart';

import 'notifier/go_router_notifier.dart';
import 'route_names.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey(debugLabel: 'shell');
//   final _prefsLocator = getIt.get<SharedPreferenceHelper>();
//  final token = _prefsLocator.getUserToken();

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: '/',
      refreshListenable: notifier,
      routes: <RouteBase>[
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/noInternet',
          name: noInternetRoute,
          builder: (context, state) =>
              NoInternetConnectionScreen(key: state.pageKey),
        ),
        // ShellRoute(
        //     navigatorKey: _shellNavigatorKey,
        //     builder: (context, state, child) {
        //       return DashboardScreen(key: state.pageKey, child: child);
        //     },

        //     ),
        GoRoute(
          path: '/',
          parentNavigatorKey: _rootNavigatorKey,
          name: splashRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: SplashScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: '/onbording',
          name: onbordingRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: OnBordingScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: '/signin',
          name: signinRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: SignInScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: '/password',
          name: passwordRoute,
          pageBuilder: (context, state) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return NoTransitionPage(
              key: state.pageKey,
              child: PasswordScreen(
                key: state.pageKey,
                email: args['email'],
              ),
            );
          },
        ),
        
        GoRoute(
          path: '/forgotpassword',
          name: forgotpasswordRoute,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: ForgotPasswordScreen(
                key: state.pageKey,
              ),
            );
          },
        ),
        GoRoute(
          path: '/verifyEmail',
          name: verifyemailRoute,
          pageBuilder: (context, state) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return NoTransitionPage(
              key: state.pageKey,
              child: VerifyEmailScreen(
                key: state.pageKey,
                token: args['token'],
              ),
            );
          },
        ),
        GoRoute(
          path: '/changepassword',
          name: changepasswordRoute,
          pageBuilder: (context, state) {
            Map<String, dynamic> args = state.extra as Map<String, dynamic>;
            return NoTransitionPage(
              key: state.pageKey,
              child: ChangePasswordScreen(
                key: state.pageKey,
                token: args['token'],
              ),
            );
          },
        ),
      ]);
});
