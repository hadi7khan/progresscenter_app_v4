// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:progresscenter_app_v4/src/base/base_consumer_state.dart';
import 'package:progresscenter_app_v4/src/feature/auth/presentation/provider/primary_color_provider.dart';

class ScaffoldWithNestedNavigation extends ConsumerStatefulWidget {
  const ScaffoldWithNestedNavigation({
    Key? key,
    required this.navigationShell,
  }) : super(key: key ?? const ValueKey('ScaffoldWithNestedNavigation'));
  final StatefulNavigationShell navigationShell;

  @override
  ConsumerState<ScaffoldWithNestedNavigation> createState() =>
      _ScaffoldWithNestedNavigationState();
}

class _ScaffoldWithNestedNavigationState
    extends BaseConsumerState<ScaffoldWithNestedNavigation> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      // A common pattern when using bottom navigation bars is to support
      // navigating to the initial location when tapping the item that is
      // already active. This example demonstrates how to support this behavior,
      // using the initialLocation parameter of goBranch.
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: Container(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          border: Border(
            top: BorderSide(color: Colors.white.withOpacity(0.2), width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: widget.navigationShell.currentIndex,
          backgroundColor: Colors.white.withOpacity(0.8),
          selectedItemColor: ref.watch(primaryColorProvider),
          selectedLabelStyle: TextStyle(
            color: ref.watch(primaryColorProvider),
            fontSize: 11.sp,
            letterSpacing: -0.3,
            fontWeight: FontWeight.w500,
          ),
          items: [
            BottomNavigationBarItem(
                label: 'Projects',
                activeIcon: SvgPicture.asset(
                  'assets/images/projects.svg',
                  color: ref.watch(primaryColorProvider),
                ),
                icon: SvgPicture.asset('assets/images/projects.svg')),
            BottomNavigationBarItem(
                label: 'Feed',
                activeIcon: SvgPicture.asset(
                  'assets/images/timeline.svg',
                  color: ref.watch(primaryColorProvider),
                ),
                icon: SvgPicture.asset('assets/images/timeline.svg')),
            BottomNavigationBarItem(
                label: 'Docs',
                activeIcon: SvgPicture.asset(
                  'assets/images/docs.svg',
                  color: ref.watch(primaryColorProvider),
                ),
                icon: SvgPicture.asset('assets/images/docs.svg')),
            BottomNavigationBarItem(
                label: 'Team',
                activeIcon: SvgPicture.asset(
                  'assets/images/teams.svg',
                  color: ref.watch(primaryColorProvider),
                ),
                icon: SvgPicture.asset('assets/images/teams.svg')),
            BottomNavigationBarItem(
                label: 'Account',
                activeIcon: SvgPicture.asset(
                  'assets/images/profile.svg',
                  color: ref.watch(primaryColorProvider),
                ),
                icon: SvgPicture.asset('assets/images/profile.svg')),
          ],
          onTap: (index) {
            HapticFeedback.mediumImpact();

            _goBranch(index);
          },
        ),
      ),
    );
  }
}
