// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/core/utils/helper.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        items: [
          BottomNavigationBarItem(
              label: 'Feed',
              activeIcon: SvgPicture.asset(
                'assets/images/timeline.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/timeline.svg')),
          BottomNavigationBarItem(
              label: 'Docs',
              activeIcon: SvgPicture.asset(
                'assets/images/docs.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/docs.svg')),
          BottomNavigationBarItem(
              label: 'Projects',
              activeIcon: SvgPicture.asset(
                'assets/images/projects.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/projects.svg')),
          BottomNavigationBarItem(
              label: 'Team',
              activeIcon: SvgPicture.asset(
                'assets/images/teams.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/teams.svg')),
          BottomNavigationBarItem(
              label: 'Support',
              activeIcon: SvgPicture.asset(
                'assets/images/headphones.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/headphones.svg')),
        ],
        onTap:(index){
          HapticFeedback.mediumImpact();

          _goBranch(index);
        } ,
      ),
    );
  }
}
