// Stateful nested navigation based on:
// https://github.com/flutter/packages/blob/main/packages/go_router/example/lib/stateful_shell_route.dart
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

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
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        backgroundColor: Colors.white,
        destinations: const [
          NavigationDestination(
              label: 'Projects', icon: FaIcon(FontAwesomeIcons.bars)),
          NavigationDestination(
              label: 'Timeline', icon: Icon(Icons.space_dashboard)),
          NavigationDestination(
              label: 'Docs', icon: Icon(Icons.insert_drive_file_outlined)),
          NavigationDestination(label: 'Team', icon: Icon(Icons.person_4)),
          NavigationDestination(label: 'Settings', icon: Icon(Icons.settings)),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }
}
