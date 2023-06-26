import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/theme/app_theme.dart';
import 'package:progresscenter_app_v4/src/core/theme/theme_const.dart';

import 'src/base/base_consumer_state.dart';
import 'src/core/route/go_router_provider.dart';
import 'src/core/utils/helper.dart';

void main() {
  runApp(const ProviderScope(child: const MyApp()));
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
          ScreenUtil.init(context);
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerDelegate: goRouter.routerDelegate,
            routeInformationParser: goRouter.routeInformationParser,
            routeInformationProvider: goRouter.routeInformationProvider,
            title: 'ProgressCenter',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: currentTheme(kLight),
            // theme: ThemeData(
            //   splashColor: Colors.transparent,
            //   fontFamily: 'Inter',
            //   useMaterial3: true,
            // ),
          );
        });
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateInitialRoute();
  }

  navigateInitialRoute() async {
    Future.delayed(const Duration(milliseconds: 1500), () async {
      // Navigator.pushReplacement(
      //     context,
      //     PageTransition(
      //         child: OnBordingScreen(), type: PageTransitionType.rightToLeft));
      context.pushReplacement('/onbording');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
