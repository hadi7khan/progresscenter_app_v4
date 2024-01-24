import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mentions/flutter_mentions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/common/services/services.dart';
import 'package:progresscenter_app_v4/src/core/theme/app_theme.dart';
import 'package:progresscenter_app_v4/src/core/theme/theme_const.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

import 'src/base/base_consumer_state.dart';
import 'src/core/route/go_router_provider.dart';
import 'src/core/shared_pref/locator.dart';
import 'src/core/shared_pref/shared_preference_helper.dart';
import 'src/core/utils/helper.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;
import 'dart:developer' as dev;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  // await FlutterDownloader.initialize(
  //     debug:
  //         true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );
  await SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //   statusBarIconBrightness: Brightness.dark,
  //       statusBarBrightness: Brightness.dark,
  //       systemNavigationBarColor: Colors.black,
  //       statusBarColor: Colors.black.withOpacity(0.2)
  // ));
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black.withOpacity(0.3),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light));

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

  runApp(const ProviderScope(child: const MyApp()));
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends BaseConsumerState<MyApp> with AppThemeMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final goRouter = ref.watch(goRouterProvider);
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Portal(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerDelegate: goRouter.routerDelegate,
              routeInformationParser: goRouter.routeInformationParser,
              routeInformationProvider: goRouter.routeInformationProvider,
              title: 'ProgressCenter',
              theme: lightTheme(),
              darkTheme: darkTheme(),
              themeMode: currentTheme(kLight),
              // theme: ThemeData(
              //   splashColor: Colors.transparent,
              //   fontFamily: 'Inter',
              //   useMaterial3: true,
              // ),
            ),
          );
        });
  }
}

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseConsumerState<SplashScreen> {
  final _prefsLocator = getIt.get<SharedPreferenceHelper>();
  bool hasColor = false;

  var color;
  @override
  void initState() {
    super.initState();
    Service().fetchUser().then((value) {
      _prefsLocator.setPrimaryColor(color: value.preferences!.primaryColor!);
    });
    navigateInitialRoute();
  }

  Color _hexToColor(String hexCode) {
    hexCode = hexCode.replaceAll("#", "");
    if (hexCode.length != 6) {
      hexCode = "0F9555"; // Default color if hex code is invalid
    }
    int colorValue = int.parse(hexCode, radix: 16);
    return Color(0xFF000000 + colorValue);
  }

  navigateInitialRoute() async {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      bool hasToken = _prefsLocator.containsToken();
      hasColor = _prefsLocator.containsPrimary();
      context.pushReplacement('/onbording');
      if (!hasToken) {
        context.pushReplacement('/onbording');
      } else {
        context.go('/projects');
      }
      // _prefsLocator.userToken != null  ? context.go('/projects')   : context.pushReplacement('/onbording');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (hasColor) {
      color = _prefsLocator.getPrimaryColor();
      dev.log("color" + color.toString());
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        ref.read(primaryColorProvider.notifier).state = _hexToColor(color);
      });
    }
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Helper.primary,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/Group1.svg',
                          // fit: BoxFit.fill,
                          width: MediaQuery.of(context).size.width * 0.6),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
