import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/main.dart';
import 'package:progresscenter_app_v4/src/common/error/no_internet_connection_screen.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/forgot_password/change_password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/forgot_password/forgot_password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/onboarding_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/sign_in_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/verify_email_screen.dart';
import 'package:progresscenter_app_v4/src/feature/bottom_navigation/view/bottom_navigation.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/camera_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/compare/presentation/view/compare_screen.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/add_docs_screen.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/docs_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/add_video_file_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/add_vimeo_video_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/add_youtube_video_screen.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/view/create_livelapse_screen.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/view/livelapse_screen.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/timeline_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/progressline_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_by_id_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/add_member_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/camera_360.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/presentation/view/cctv_view_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/drone_footage_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/edit_project_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/equipment_tracker_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/project_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/projects_screen.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/add_site_gallery_screen.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/site_gallery_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera/presentation/view/camera_screen.dart';
import 'package:progresscenter_app_v4/src/feature/report/presentation/view/report_screen.dart';
import 'package:progresscenter_app_v4/src/feature/slider/presentation/view/slider_screen.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/view/splitview_screen.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/create_ticket_screen.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/support_screen.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/ticket_by_id_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/add_user_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/add_user_screen2.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/invite_bymail_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/teams_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/user_profile_screen.dart';

import 'notifier/go_router_notifier.dart';
import 'route_names.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellE');
final _prefsLocator = getIt.get<SharedPreferenceHelper>();

final goRouterProvider = Provider<GoRouter>((ref) {
  final notifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
    initialLocation: '/',
    // * Passing a navigatorKey causes an issue on hot reload:
    // * https://github.com/flutter/flutter/issues/113757#issuecomment-1518421380
    // * However it's still necessary otherwise the navigator pops back to
    // * root on hot reload
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    // redirect: (context, state){
    //    // if the user is not logged in, they need to login
    //   // final hasToken =  _prefsLocator.getUserToken();
    //   // final bool loggingIn = state.subloc == '/login';
    //   // if (hasToken.isEmpty) {
    //   //   return '/signin';
    //   // }

    //   // if the user is logged in but still on the login page, send them to
    //   // the home page
    //   // if (hasToken.isNotEmpty) {
    //   //   return '/projects';
    //   // }

    //   // no need to redirect at all
    //   return null;
    // },
    routes: [
      // Stateful navigation based on:
      // https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellNavigatorBKey,
            routes: [
              // Timeline
              GoRoute(
                path: '/timeline',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProgresslineScreen(
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
                  child:
                      DocsScreen(label: 'Teams', detailsPath: '/docs/details'),
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
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                path: '/projects',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProjectsScreen(
                      label: 'Projects', detailsPath: '/projects/details'),
                ),
                routes: [
                  // GoRoute(
                  //     path: 'details',
                  //     builder: (context, state) {
                  //       Map<String, dynamic> args = state.extra as Map<String, dynamic>;
                  //       return ProjectDetailsScreen(label: 'details', projectId: args['projectId'], projectName: args['projectName'],);
                  //     }),
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
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorEKey,
            routes: [
              // Support
              GoRoute(
                path: '/support',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: SupportScreen(
                      label: 'Support', detailsPath: '/support/details'),
                ),
                routes: [],
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
        path: '/details',
        parentNavigatorKey: _rootNavigatorKey,
        name: projectDetailRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ProjectDetailsScreen(
              key: state.pageKey,
              label: 'details',
              projectId: args['projectId'],
              projectName: args['projectName'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/camera',
        parentNavigatorKey: _rootNavigatorKey,
        name: cameraRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: CameraScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      // --------------------------Camera Details Route--------------------------
      GoRoute(
        path: '/cameradetails',
        parentNavigatorKey: _rootNavigatorKey,
        name: cameraDetailsRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: CameraDetailsSreen(
              key: state.pageKey,
              projectId: args['projectId'],
              projectName: args['projectName'],
              cameraId: args['cameraId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/livelapse',
        parentNavigatorKey: _rootNavigatorKey,
        name: livelapseRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: LivelapseScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              projectName: args['projectName'],
              cameraId: args['cameraId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/slider',
        parentNavigatorKey: _rootNavigatorKey,
        name: sliderRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: SliderScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              projectName: args['projectName'],
              cameraId: args['cameraId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/compare',
        parentNavigatorKey: _rootNavigatorKey,
        name: compareRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: CompareScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              projectName: args['projectName'],
              cameraId: args['cameraId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/splitview',
        parentNavigatorKey: _rootNavigatorKey,
        name: splitviewRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: SplitviewScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              projectName: args['projectName'],
              cameraId: args['cameraId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/report',
        parentNavigatorKey: _rootNavigatorKey,
        name: reportRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ReportScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/createlivelapse',
        parentNavigatorKey: _rootNavigatorKey,
        name: createLivelapseRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: CreateLivelapseScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              projectName: args['projectName'],
              cameraId: args['cameraId'],
            ),
          );
        },
      ),
      // ---------------------------------Teams Route--------------------------------

      GoRoute(
        path: '/addUser',
        parentNavigatorKey: _rootNavigatorKey,
        name: addUserRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: AddUserScreen(
              key: state.pageKey,
            ),
          );
        },
      ),

      GoRoute(
        path: '/addUser2',
        parentNavigatorKey: _rootNavigatorKey,
        name: addUserRoute2,
        pageBuilder: (context, state) {
          final args = state.extra;
          return NoTransitionPage(
            key: state.pageKey,
            child: AddUserScreen2(key: state.pageKey, data: args!),
          );
        },
      ),

      GoRoute(
        path: '/inviteByMail',
        parentNavigatorKey: _rootNavigatorKey,
        name: inviteByMailRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: InviteByMailScreen(
              key: state.pageKey,
            ),
          );
        },
      ),

      GoRoute(
        path: '/userProfile',
        parentNavigatorKey: _rootNavigatorKey,
        name: userProfileRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: UserProfileScreen(
              key: state.pageKey,
              userId: args['userId'],
            ),
          );
        },
      ),

      // ---------------------------------Support Route--------------------------------

      GoRoute(
        path: '/createTicket',
        parentNavigatorKey: _rootNavigatorKey,
        name: createTicketRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: CreateTicketScreen(
              key: state.pageKey,
            ),
          );
        },
      ),

      GoRoute(
        path: '/ticketById',
        parentNavigatorKey: _rootNavigatorKey,
        name: ticketByIdRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: TicketByIdScreen(
              key: state.pageKey,
              ticketId: args['ticketId'],
            ),
          );
        },
      ),

      // ---------------------------------Documents--------------------------------

      GoRoute(
        path: '/addDocs',
        parentNavigatorKey: _rootNavigatorKey,
        name: addDocsRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: AddDocsScreen(
              key: state.pageKey,
              category: args['category'],
            ),
          );
        },
      ),

      // ---------------------------------Drone Footage--------------------------------
      GoRoute(
        path: '/dronefootage',
        parentNavigatorKey: _rootNavigatorKey,
        name: dronefootageRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: DroneFootageScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/addFileVideo',
        parentNavigatorKey: _rootNavigatorKey,
        name: addFileVideoRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: AddFileVideoScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/addVimeoVideo',
        parentNavigatorKey: _rootNavigatorKey,
        name: addVimeoVideoRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: AddVimeoVideoScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/addYoutubeVideo',
        parentNavigatorKey: _rootNavigatorKey,
        name: addYoutubeVideoRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: AddYoutubeVideoScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/cctv',
        parentNavigatorKey: _rootNavigatorKey,
        name: cctvRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: CCTVScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/camera360',
        parentNavigatorKey: _rootNavigatorKey,
        name: camera360Route,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: Camera360Screen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      // ---------------------------------Site Gallery--------------------------------
      GoRoute(
        path: '/sitegallery',
        parentNavigatorKey: _rootNavigatorKey,
        name: siteGalleryRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: SiteGalleryScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/addSiteGallery',
        parentNavigatorKey: _rootNavigatorKey,
        name: addSiteGalleryRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: AddSiteGalleryScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/equipmentTracker',
        parentNavigatorKey: _rootNavigatorKey,
        name: equipmentTrackerRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: EquipmentTrackerScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName']),
          );
        },
      ),
      GoRoute(
        path: '/editproject',
        parentNavigatorKey: _rootNavigatorKey,
        name: editProjectRoute,
        pageBuilder: (context, state) {
          ProjectByIdModel model = state.extra as ProjectByIdModel;
          return NoTransitionPage(
            key: state.pageKey,
            child: EditProjectScreen(key: state.pageKey, data: model),
          );
        },
      ),
      GoRoute(
        path: '/addmember',
        parentNavigatorKey: _rootNavigatorKey,
        name: addMemberRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: AddMemberScreen(
              key: state.pageKey,
              projectId: args['projectId'],
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
