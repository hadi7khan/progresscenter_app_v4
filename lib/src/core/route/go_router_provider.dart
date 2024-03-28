import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/main.dart';
import 'package:progresscenter_app_v4/src/common/error/no_internet_connection_screen.dart';
import 'package:progresscenter_app_v4/src/common/error/page_not_found.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/locator.dart';
import 'package:progresscenter_app_v4/src/core/shared_pref/shared_preference_helper.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/privacy_policy_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/terms_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/account_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/change_password_profile_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/delete_account_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/organisation_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/organisation_url_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/profile_screen.dart';
import 'package:progresscenter_app_v4/src/feature/account/presentation/view/profile_team_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/choose_account_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/forgot_password/change_password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/forgot_password/forgot_password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/onboarding_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/password_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/sign_in_screen.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/view/verify_email_screen.dart';
import 'package:progresscenter_app_v4/src/feature/bottom_navigation/view/bottom_navigation.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/camera_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/image_comments_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/landscape_camera_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/multiple_images_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera_details/presentation/view/share_progressline_screen.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/presentation/view/fullview_cctv_screen.dart';
import 'package:progresscenter_app_v4/src/feature/compare/presentation/view/compare_screen.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/add_docs_screen.dart';
import 'package:progresscenter_app_v4/src/feature/docs/presentation/view/docs_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/add_video_file_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/add_vimeo_video_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/add_youtube_video_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/drone_footage_fullview.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/edit_drone_footage_screen.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/view/create_livelapse_screen.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/view/fullview_livelapse.dart';
import 'package:progresscenter_app_v4/src/feature/livelapse/presentation/view/livelapse_screen.dart';
import 'package:progresscenter_app_v4/src/feature/notifications/presentation/view/notifications_screen.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/progressline_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/progressline/presentation/view/progressline_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/data/models/project_model.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/add_member_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/camera_360.dart';
import 'package:progresscenter_app_v4/src/feature/cctv_view/presentation/view/cctv_view_screen.dart';
import 'package:progresscenter_app_v4/src/feature/drone_footage/presentation/view/drone_footage_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/edit_project_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/equipment_tracker_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/project_details_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/projects_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/search_project_screen.dart';
import 'package:progresscenter_app_v4/src/feature/projects/presentation/view/super_projects_screen.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/add_site_gallery_screen.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/fullview_site_gallery_screen.dart';
import 'package:progresscenter_app_v4/src/feature/site_gallery/presentation/view/site_gallery_screen.dart';
import 'package:progresscenter_app_v4/src/feature/camera/presentation/view/camera_screen.dart';
import 'package:progresscenter_app_v4/src/feature/reports/presentation/view/report_screen.dart';
import 'package:progresscenter_app_v4/src/feature/slider/presentation/view/fullview_slider_screen.dart';
import 'package:progresscenter_app_v4/src/feature/slider/presentation/view/slider_screen.dart';
import 'package:progresscenter_app_v4/src/feature/splitview/presentation/view/splitview_screen.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/create_ticket_screen.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/support_screen.dart';
import 'package:progresscenter_app_v4/src/feature/support/presentation/view/ticket_by_id_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/add_user_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/add_user_screen2.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/invite_bymail_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/roles_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/search_teams_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/select_teams_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/teams_screen.dart';
import 'package:progresscenter_app_v4/src/feature/team/presentation/view/user_profile_screen.dart';

import 'notifier/go_router_notifier.dart';
import 'route_names.dart';

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
    navigatorKey: rootNavigatorKey,
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
            navigatorKey: _shellNavigatorAKey,
            routes: [
              GoRoute(
                path: '/projects',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ProjectsScreen(
                      label: 'Projects', detailsPath: '/projects/details'),
                ),
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
                  child: ProgresslineScreen(
                      label: 'Timeline', detailsPath: '/timeline/details'),
                ),
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
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellNavigatorEKey,
            routes: [
              // Account
              GoRoute(
                path: '/account',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: AccountScreen(),
                ),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/noInternet',
        name: noInternetRoute,
        builder: (context, state) =>
            NoInternetConnectionScreen(key: state.pageKey),
      ),
      GoRoute(
        parentNavigatorKey: rootNavigatorKey,
        path: '/pageNotFound',
        name: pageNotFoundRoute,
        builder: (context, state) => PageNotFoundScreen(key: state.pageKey),
      ),
      GoRoute(
        path: '/',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
                projectImages: args['projectImages'],
                projectLocation: args['projectLocation'],
                projectUsers: args['projectUsers']),
          );
        },
      ),
      GoRoute(
        path: '/superProject/:projectId',
        parentNavigatorKey: rootNavigatorKey,
        name: superProjectRoute,
        pageBuilder: (context, state) {
          // final family = Families.family(state.p['fid']!);
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: SuperProjectScreen(
              key: state.pageKey,
              projectId: args['projectId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/projectSearch',
        parentNavigatorKey: rootNavigatorKey,
        name: projectSearchRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: SearchProjectScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: '/camera',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
              cameraName: args['cameraName'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/imageComments',
        parentNavigatorKey: rootNavigatorKey,
        name: imageCommentsRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ImageCommentsScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              cameraId: args['cameraId'],
              imageName: args['imageName'],
              imageHeight: args['imageHeight'],
              imageWidth: args['imageWidth'],
              fromNotifications: args['fromNotifications'],
              cameraImageCommentId: args['cameraImageCommentId'],
              // cameraImageCommentReplyId: args['cameraImageCommentReplyId'],
              imageUrl: args['imageUrl'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/shareProgressline',
        parentNavigatorKey: rootNavigatorKey,
        name: shareProgresslineRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ShareProgresslineScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              cameraId: args['cameraId'],
              imageUrl: args['imageUrl'],
              imageHeight: args['imageHeight'],
              imageWidth: args['imageWidth'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/landscapeCameradetails',
        parentNavigatorKey: rootNavigatorKey,
        name: landscapeCameraDetailsRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: LandscapeCameraDetailsScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              projectName: args['projectName'],
              cameraId: args['cameraId'],
              imagesData: args['imagesData'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/multipleImages',
        parentNavigatorKey: rootNavigatorKey,
        name: multipleImagesRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: MultipleImagesScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              cameraName: args['cameraName'],
              cameraId: args['cameraId'],
              startDate: args['startDate'],
              endDate: args['endDate'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/livelapse',
        parentNavigatorKey: rootNavigatorKey,
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
        path: '/fullViewlivelapse',
        parentNavigatorKey: rootNavigatorKey,
        name: fullViewlivelapseRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: FullviewLivelapse(
              key: state.pageKey,
              projectId: args['projectId'],
              cameraId: args['cameraId'],
              livelapseId: args['livelapseId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/slider',
        parentNavigatorKey: rootNavigatorKey,
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
        path: '/fullviewSlider',
        parentNavigatorKey: rootNavigatorKey,
        name: fullviewSliderRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: FullviewSliderScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName'],
                cameraId: args['cameraId'],
                sliderData: args['sliderData'],
                imagesBytes: args['imagesBytes']),
          );
        },
      ),
      GoRoute(
        path: '/compare',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
        name: reportRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ReportScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              cameraId: args['cameraId'],
              projectName: args['projectName'],
              startDate: args['startDate'],
              endDate: args['endDate'],
              cameraName: args['cameraName'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/createlivelapse',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
      GoRoute(
        path: '/roles',
        parentNavigatorKey: rootNavigatorKey,
        name: rolesRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          Function(String) onRoleSelection = args['onRoleSelection'];
          return NoTransitionPage(
            key: state.pageKey,
            child: RolesScreen(
              key: state.pageKey,
              roles: args['roles'],
              assignedRole: args['assignedRole'],
              onRoleSelection: onRoleSelection,
            ),
          );
        },
      ),
      GoRoute(
        path: '/selectTeams',
        parentNavigatorKey: rootNavigatorKey,
        name: selectTeamsRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: SelectTeamsScreen(
              key: state.pageKey,
              teamsList: args['teamsList'],
              selectedTeams: args['selectedTeams'],
              userId: args['userId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/teamSearch',
        parentNavigatorKey: rootNavigatorKey,
        name: teamSearchRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: SearchTeamScreen(key: state.pageKey, data: args['data']),
          );
        },
      ),

      // ---------------------------------Support Route--------------------------------
      GoRoute(
        path: '/support',
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) => const NoTransitionPage(
          child:
              SupportScreen(label: 'Support', detailsPath: '/support/details'),
        ),
        routes: [],
      ),
      GoRoute(
        path: '/createTicket',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        path: '/editDronefootage',
        parentNavigatorKey: rootNavigatorKey,
        name: editDronefootageRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: EditDroneFootageScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              droneId: args['droneId'],
              name: args['name'],
              location: args['location'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/addFileVideo',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        path: '/fullViewDrone',
        parentNavigatorKey: rootNavigatorKey,
        name: fullViewDroneRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: DroneFootageFullviewScreen(
                key: state.pageKey,
                projectId: args['projectId'],
                projectName: args['projectName'],
                videoUrl: args['videoUrl'],
                provider: args["provider"]),
          );
        },
      ),
      // --------------------------------- CCTV --------------------------------
      GoRoute(
        path: '/cctv',
        parentNavigatorKey: rootNavigatorKey,
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
        path: '/fullViewCCTV',
        parentNavigatorKey: rootNavigatorKey,
        name: fullViewCCTVRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: FullViewCCTVScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              name: args['name'],
              streamingUrl: args['streamingUrl'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/camera360',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
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
        path: '/fullViewSitegallery',
        parentNavigatorKey: rootNavigatorKey,
        name: fullViewSitegalleryRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: FullViewSitegalleryScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              name: args['name'],
              url: args['url'],
              type: args['type'],
              siteGalleryId: args['siteGalleryId'],
              projectName: args['projectName'],
              createdAt: args['createdAt'],
              uploadedBy: args['uploadedBy'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/equipmentTracker',
        parentNavigatorKey: rootNavigatorKey,
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
        parentNavigatorKey: rootNavigatorKey,
        name: editProjectRoute,
        pageBuilder: (context, state) {
          ProjectModel model = state.extra as ProjectModel;
          return NoTransitionPage(
            key: state.pageKey,
            child: EditProjectScreen(key: state.pageKey, data: model),
          );
        },
      ),
      GoRoute(
        path: '/addmember',
        parentNavigatorKey: rootNavigatorKey,
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

      // ---------------------------------Account--------------------------------
      GoRoute(
        path: '/profile',
        parentNavigatorKey: rootNavigatorKey,
        name: profileRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ProfileScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: '/profileTeam',
        parentNavigatorKey: rootNavigatorKey,
        name: profileteamRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ProfileTeamScreen(
              key: state.pageKey,
              teamsList: args['teamsList'],
              selectedTeams: args['selectedTeams'],
              userId: args['userId'],
            ),
          );
        },
      ),
      GoRoute(
        path: '/terms',
        parentNavigatorKey: rootNavigatorKey,
        name: termsRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: TermsScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: '/privacyPolicy',
        parentNavigatorKey: rootNavigatorKey,
        name: privacyPolicyRoute,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            key: state.pageKey,
            child: PrivacyPolicyScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: '/changePasswordProfile',
        parentNavigatorKey: rootNavigatorKey,
        name: changePasswordProfileRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ChangePasswordProfileScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: '/deleteAccount',
        parentNavigatorKey: rootNavigatorKey,
        name: deleteAccountRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: DeleteAccountScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: '/organisation',
        parentNavigatorKey: rootNavigatorKey,
        name: organisationRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: OrganisationScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
      GoRoute(
        path: '/organisationUrl',
        parentNavigatorKey: rootNavigatorKey,
        name: organisationUrlRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: OrganisationUrlScreen(
              key: state.pageKey,
            ),
          );
        },
      ),

      GoRoute(
        path: '/progresslineById',
        parentNavigatorKey: rootNavigatorKey,
        name: progresslineByIdRoute,
        pageBuilder: (context, state) {
          Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ProgresslineDetailsScreen(
              key: state.pageKey,
              projectId: args['projectId'],
              progressLinePostId: args['progressLinePostId'],
              commentId: args['commentId'],
            ),
          );
        },
      ),

      GoRoute(
        path: '/notifications',
        parentNavigatorKey: rootNavigatorKey,
        name: notificationsRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: NotificationsScreen(
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
      GoRoute(
        path: '/clientAccounts',
        name: clientAccountsRoute,
        pageBuilder: (context, state) {
          // Map<String, dynamic> args = state.extra as Map<String, dynamic>;
          return NoTransitionPage(
            key: state.pageKey,
            child: ChooseAccountScreen(
              key: state.pageKey,
            ),
          );
        },
      ),
    ],
  );
});
