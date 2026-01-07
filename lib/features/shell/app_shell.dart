import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/widgets/app_background.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: AppBackground(
        child: navigationShell, // GoRouter renders the active branch here
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor:
            (isDark ? AppColors.surface2Dark : AppColors.surface2Light)
                .withValues(alpha: 0.95),
        indicatorColor: AppColors.primary.withValues(alpha: 0.20),
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (idx) {
          navigationShell.goBranch(
            idx,
            // if the user taps the current tab again, keep them at that tab’s root
            initialLocation: idx == navigationShell.currentIndex,
          );
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.view_agenda_outlined),
            selectedIcon: Icon(Icons.view_agenda),
            label: "Feed",
          ),
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: "Explore",
          ),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.bookmark),
            label: "Saved",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}
