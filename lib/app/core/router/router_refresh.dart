import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ainexusapp/features/auth/state/auth_controller.dart';
import 'package:ainexusapp/features/auth/data/auth_repository.dart';

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(this.ref) {
    _sub = ref.listen<AsyncValue<AuthStatus>>(
      authStatusProvider,
      (previous, next) => notifyListeners(),
    );
  }

  final Ref ref;
  late final ProviderSubscription<AsyncValue<AuthStatus>> _sub;

  @override
  void dispose() {
    _sub.close();
    super.dispose();
  }
}
