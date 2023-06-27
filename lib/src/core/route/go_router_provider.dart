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
import 'package:progresscenter_app_v4/src/feature/bottom_navigation/view/bottom_navigation.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/docs_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/project_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/projects_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/teams_screen.dart';
import 'package:progresscenter_app_v4/src/feature/timeline/presentation/view/timeline_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/timeline/presentation/view/timeline_screen.dart';

import 'notifier/go_router_notifier.dart';
import 'route_names.dart';



final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');

final goRouterProvider = Provider<GoRouter>((ref){
  final notifier = ref.read(goRouterNotifierProvider);
  return  GoRouter(
  initialLocation: '/projects',
  // * Passing a navigatorKey causes an issue on hot reload:
  // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
  // * However it's still necessary otherwise the navigator pops back to
  // * root on hot reload
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    // Stateful navigation based on:
    // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: '/projects',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: ProjectsScreen(
                    label: 'Projects', detailsPath: '/project/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                      const ProjectDetailsScreen(label: 'details'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            // Timeline
            GoRoute(
              path: '/timeline',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TimelineScreen(
                    label: 'Timeline', detailsPath: '/timeline/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                      const TimelineDetailsScreen(label: 'details'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            // Docs
            GoRoute(
              path: '/docs',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: DocsScreen(
                    label: 'Teams', detailsPath: '/docs/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                      const TimelineDetailsScreen(label: 'details'),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            // Teams
            GoRoute(
              path: '/teams',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: TeamsScreen(
                    label: 'Teams', detailsPath: '/teams/details'),
              ),
              routes: [
                GoRoute(
                  path: 'details',
                  builder: (context, state) =>
                      const TimelineDetailsScreen(label: 'details'),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: '/noInternet',
      name: noInternetRoute,
      builder: (context, state) =>
          NoInternetConnectionScreen(key: state.pageKey),
    ),
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
  ],
);

});

// final goRouter = GoRouter(
//   initialLocation: '/',
//   // * Passing a navigatorKey causes an issue on hot reload:
//   // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
//   // * However it's still necessary otherwise the navigator pops back to
//   // * root on hot reload
//   navigatorKey: _rootNavigatorKey,
//   debugLogDiagnostics: true,
//   routes: [
//     // Stateful navigation based on:
//     // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
//     StatefulShellRoute.indexedStack(
//       builder: (context, state, navigationShell) {
//         return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
//       },
//       branches: [
//         StatefulShellBranch(
//           navigatorKey: _shellNavigatorAKey,
//           routes: [
//             GoRoute(
//               path: '/projects',
//               pageBuilder: (context, state) => const NoTransitionPage(
//                 child: ProjectsScreen(
//                     label: 'Projects', detailsPath: '/project/details'),
//               ),
//               routes: [
//                 GoRoute(
//                   path: 'details',
//                   builder: (context, state) =>
//                       const ProjectDetailsScreen(label: 'details'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         StatefulShellBranch(
//           navigatorKey: _shellNavigatorBKey,
//           routes: [
//             // Shopping Cart
//             GoRoute(
//               path: '/timeline',
//               pageBuilder: (context, state) => const NoTransitionPage(
//                 child: TimelineScreen(
//                     label: 'Timeline', detailsPath: '/timeline/details'),
//               ),
//               routes: [
//                 GoRoute(
//                   path: 'details',
//                   builder: (context, state) =>
//                       const TimelineDetailsScreen(label: 'details'),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     ),
//     GoRoute(
//       parentNavigatorKey: _rootNavigatorKey,
//       path: '/noInternet',
//       name: noInternetRoute,
//       builder: (context, state) =>
//           NoInternetConnectionScreen(key: state.pageKey),
//     ),
//     GoRoute(
//       path: '/',
//       parentNavigatorKey: _rootNavigatorKey,
//       name: splashRoute,
//       pageBuilder: (context, state) {
//         return NoTransitionPage(
//           key: state.pageKey,
//           child: SplashScreen(
//             key: state.pageKey,
//           ),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/onbording',
//       name: onbordingRoute,
//       pageBuilder: (context, state) {
//         return NoTransitionPage(
//           key: state.pageKey,
//           child: OnBordingScreen(
//             key: state.pageKey,
//           ),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/signin',
//       name: signinRoute,
//       pageBuilder: (context, state) {
//         return NoTransitionPage(
//           key: state.pageKey,
//           child: SignInScreen(
//             key: state.pageKey,
//           ),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/password',
//       name: passwordRoute,
//       pageBuilder: (context, state) {
//         Map<String, dynamic> args = state.extra as Map<String, dynamic>;
//         return NoTransitionPage(
//           key: state.pageKey,
//           child: PasswordScreen(
//             key: state.pageKey,
//             email: args['email'],
//           ),
//         );
//       },
//     ),

//     GoRoute(
//       path: '/forgotpassword',
//       name: forgotpasswordRoute,
//       pageBuilder: (context, state) {
//         return NoTransitionPage(
//           key: state.pageKey,
//           child: ForgotPasswordScreen(
//             key: state.pageKey,
//           ),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/verifyEmail',
//       name: verifyemailRoute,
//       pageBuilder: (context, state) {
//         Map<String, dynamic> args = state.extra as Map<String, dynamic>;
//         return NoTransitionPage(
//           key: state.pageKey,
//           child: VerifyEmailScreen(
//             key: state.pageKey,
//             token: args['token'],
//           ),
//         );
//       },
//     ),
//     GoRoute(
//       path: '/changepassword',
//       name: changepasswordRoute,
//       pageBuilder: (context, state) {
//         Map<String, dynamic> args = state.extra as Map<String, dynamic>;
//         return NoTransitionPage(
//           key: state.pageKey,
//           child: ChangePasswordScreen(
//             key: state.pageKey,
//             token: args['token'],
//           ),
//         );
//       },
//     ),
//   ],
// );

// final GlobalKey<NavigatorState> _rootNavigatorKey =
//     GlobalKey(debugLabel: 'root');
// final GlobalKey<NavigatorState> _shellNavigatorKey =
//     GlobalKey(debugLabel: 'shell');
// //   final _prefsLocator = getIt.get<SharedPreferenceHelper>();
// //  final token = _prefsLocator.getUserToken();

// final goRouterProvider = Provider<GoRouter>((ref) {
//   final notifier = ref.read(goRouterNotifierProvider);

//   return GoRouter(
//       navigatorKey: _rootNavigatorKey,
//       initialLocation: '/',
//       refreshListenable: notifier,
//       routes: <RouteBase>[
//         GoRoute(
//           parentNavigatorKey: _rootNavigatorKey,
//           path: '/noInternet',
//           name: noInternetRoute,
//           builder: (context, state) =>
//               NoInternetConnectionScreen(key: state.pageKey),
//         ),
//         // ShellRoute(
//         //     navigatorKey: _shellNavigatorKey,
//         //     builder: (context, state, child) {
//         //       return DashboardScreen(key: state.pageKey, child: child);
//         //     },

//         //     ),
//         GoRoute(
//           path: '/',
//           parentNavigatorKey: _rootNavigatorKey,
//           name: splashRoute,
//           pageBuilder: (context, state) {
//             return NoTransitionPage(
//               key: state.pageKey,
//               child: SplashScreen(
//                 key: state.pageKey,
//               ),
//             );
//           },
//         ),
//         GoRoute(
//           path: '/onbording',
//           name: onbordingRoute,
//           pageBuilder: (context, state) {
//             return NoTransitionPage(
//               key: state.pageKey,
//               child: OnBordingScreen(
//                 key: state.pageKey,
//               ),
//             );
//           },
//         ),
//         GoRoute(
//           path: '/signin',
//           name: signinRoute,
//           pageBuilder: (context, state) {
//             return NoTransitionPage(
//               key: state.pageKey,
//               child: SignInScreen(
//                 key: state.pageKey,
//               ),
//             );
//           },
//         ),
//         GoRoute(
//           path: '/password',
//           name: passwordRoute,
//           pageBuilder: (context, state) {
//             Map<String, dynamic> args = state.extra as Map<String, dynamic>;
//             return NoTransitionPage(
//               key: state.pageKey,
//               child: PasswordScreen(
//                 key: state.pageKey,
//                 email: args['email'],
//               ),
//             );
//           },
//         ),

//         GoRoute(
//           path: '/forgotpassword',
//           name: forgotpasswordRoute,
//           pageBuilder: (context, state) {
//             return NoTransitionPage(
//               key: state.pageKey,
//               child: ForgotPasswordScreen(
//                 key: state.pageKey,
//               ),
//             );
//           },
//         ),
//         GoRoute(
//           path: '/verifyEmail',
//           name: verifyemailRoute,
//           pageBuilder: (context, state) {
//             Map<String, dynamic> args = state.extra as Map<String, dynamic>;
//             return NoTransitionPage(
//               key: state.pageKey,
//               child: VerifyEmailScreen(
//                 key: state.pageKey,
//                 token: args['token'],
//               ),
//             );
//           },
//         ),
//         GoRoute(
//           path: '/changepassword',
//           name: changepasswordRoute,
//           pageBuilder: (context, state) {
//             Map<String, dynamic> args = state.extra as Map<String, dynamic>;
//             return NoTransitionPage(
//               key: state.pageKey,
//               child: ChangePasswordScreen(
//                 key: state.pageKey,
//                 token: args['token'],
//               ),
//             );
//           },
//         ),
//       ]);
// });
