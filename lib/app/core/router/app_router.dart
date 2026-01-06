import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:ainexusapp/features/auth/data/auth_repository.dart';
import 'package:ainexusapp/features/auth/presentation/login_screen.dart';
import 'package:ainexusapp/features/auth/presentation/onboarding_screen.dart';
import 'package:ainexusapp/features/auth/state/auth_controller.dart';

import 'package:ainexusapp/features/feed/feed_screen.dart';
import 'package:ainexusapp/features/explore/explore_screen.dart';
import 'package:ainexusapp/features/saved/saved_screen.dart';
import 'package:ainexusapp/features/settings/settings_screen.dart';
import 'package:ainexusapp/features/tool_details/tool_details_screen.dart';
import 'package:ainexusapp/features/shell/app_shell.dart';

import 'router_refresh.dart';

// Same refresh approach you used previously (version-proof)
final _routerRefreshProvider = Provider<GoRouterRefreshNotifier>((ref) {
  final notifier = GoRouterRefreshNotifier(ref);
  ref.onDispose(notifier.dispose);
  return notifier;
});

final appRouterProvider = Provider<GoRouter>((ref) {
  final refresh = ref.watch(_routerRefreshProvider);

  return GoRouter(
    initialLocation: '/onboarding',
    refreshListenable: refresh,
    routes: [
      GoRoute(path: '/onboarding', builder: (_, _) => const OnboardingScreen()),
      GoRoute(path: '/login', builder: (_, _) => const LoginScreen()),

      // Bottom tabs with deep-linkable routes:
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppShell(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/feed',
                builder: (_, _) => const FeedScreen(),
                routes: [
                  GoRoute(
                    path: 'tool',
                    builder: (_, _) => const ToolDetailsScreen(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/explore',
                builder: (_, _) => const ExploreScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/saved',
                builder: (_, _) => const SavedScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/app/settings',
                builder: (_, _) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
    redirect: (context, state) {
      final auth = ref
          .read(authStatusProvider)
          .maybeWhen(data: (v) => v, orElse: () => AuthStatus.unknown);

      final loc = state.matchedLocation;

      final isAuthScreens = (loc == '/onboarding' || loc == '/login');
      final isInApp = loc.startsWith('/app');

      if (auth == AuthStatus.unknown) return null;

      if (auth == AuthStatus.unauthenticated) {
        if (isInApp) return '/onboarding';
        return null; // Let them stay on onboarding or login if they are there
      }

      // authenticated
      if (isAuthScreens) return '/app/feed';
      return null;
    },
  );
});
