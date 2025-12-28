import 'package:ainexusapp/design/tokens/app_colors.dart';
import 'package:ainexusapp/design/widgets/app_background.dart';
import 'package:ainexusapp/features/explore/explore_screen.dart';
import 'package:ainexusapp/features/feed/feed_screen.dart';
import 'package:ainexusapp/features/saved/saved_screen.dart';
import 'package:ainexusapp/features/settings/settings_screen.dart';
import 'package:flutter/material.dart';

class AppShell extends StatefulWidget {
  final int initialIndex;

  const AppShell({super.key, this.initialIndex = 0});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  late int index;

  @override
  void initState() {
    super.initState();
    index = widget.initialIndex.clamp(0, 3);
  }

  final pages = const [
    FeedScreen(),
    ExploreScreen(),
    SavedScreen(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.surface2.withValues(alpha: 0.95),
        indicatorColor: AppColors.primary.withValues(alpha: 0.20),
        selectedIndex: index,
        onDestinationSelected: (v) => setState(() => index = v),
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
