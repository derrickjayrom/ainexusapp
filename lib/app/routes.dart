import 'package:ainexusapp/design/widgets/app_shell.dart';
import 'package:flutter/material.dart';

// Screens
import '../features/auth/onboarding_screen.dart';
import '../features/auth/login_screen.dart';

/// Route names (single source of truth)
abstract class AppRouteNames {
  static const String onboarding = '/';
  static const String login = '/login';

  // App shell + tabs
  static const String app = '/app';
  static const String feed = '/app/feed';
  static const String explore = '/app/explore';
  static const String saved = '/app/saved';
  static const String settings = '/app/settings';

  // Details
  static const String toolDetails = '/tool';
}

/// Optional arguments to control Shell start tab.
class ShellArgs {
  const ShellArgs({this.initialIndex = 0});
  final int initialIndex;
}

/// Optional arguments for Tool Details (UI-only; you can expand later).
class ToolDetailsArgs {
  const ToolDetailsArgs({this.toolName, this.categoryLine});

  final String? toolName;
  final String? categoryLine;
}

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.onboarding:
        return _page(const OnboardingScreen(), settings);

      case AppRouteNames.login:
        return _page(const LoginScreen(), settings);

      // Shell base
      case AppRouteNames.app:
        {
          final args = settings.arguments;
          final initialIndex = (args is ShellArgs) ? args.initialIndex : 0;
          return _page(AppShell(initialIndex: initialIndex), settings);
        }

      // Shell tab deep routes (map to the correct index)
      case AppRouteNames.feed:
        return _page(const AppShell(initialIndex: 0), settings);

      case AppRouteNames.explore:
        return _page(const AppShell(initialIndex: 1), settings);

      case AppRouteNames.saved:
        return _page(const AppShell(initialIndex: 2), settings);

      case AppRouteNames.settings:
        return _page(const AppShell(initialIndex: 3), settings);

      // case AppRouteNames.toolDetails:
      //   {
      //     final args = settings.arguments;
      //     final toolArgs = args is ToolDetailsArgs
      //         ? args
      //         : const ToolDetailsArgs();
      //     return _page(
      //       ToolDetailsScreen(
      //         toolName: toolArgs.toolName,
      //         categoryLine: toolArgs.categoryLine,
      //       ),
      //       settings,
      //     );
      //   }

      default:
        return _page(_UnknownRoute(name: settings.name), settings);
    }
  }

  static MaterialPageRoute _page(Widget child, RouteSettings settings) {
    return MaterialPageRoute(builder: (_) => child, settings: settings);
  }
}

class _UnknownRoute extends StatelessWidget {
  const _UnknownRoute({required this.name});
  final String? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('No route defined for "$name"')));
  }
}
