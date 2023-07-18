
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              label: 'LiveLapse',
              activeIcon: SvgPicture.asset(
                'assets/images/video-recorder.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/video-recorder.svg')),
          BottomNavigationBarItem(
              label: 'Slider',
              activeIcon: SvgPicture.asset(
                'assets/images/slider.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/slider.svg')),
          BottomNavigationBarItem(
              label: 'Compare',
              activeIcon: SvgPicture.asset(
                'assets/images/rows.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/rows.svg', color: Helper.textColor700,)),
          BottomNavigationBarItem(
              label: 'Split View',
              activeIcon: SvgPicture.asset(
                'assets/images/layout-left.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/layout-left.svg')),
          BottomNavigationBarItem(
              label: 'Report',
              activeIcon: SvgPicture.asset(
                'assets/images/file-download.svg',
                color: Helper.primary,
              ),
              icon: SvgPicture.asset('assets/images/file-download.svg')),
        ],
        onTap: _goBranch,
      ),
    );
  }
}