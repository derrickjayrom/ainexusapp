import 'package:ainexusapp/features/auth/state/auth_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GoRouterRefreshNotifier extends ChangeNotifier {
  GoRouterRefreshNotifier(this.ref) {
    _sub = ref.listen(
      authStatusProvider,
      (previous, next) => notifyListeners(),
    );
  }

  final Ref ref;
  late final ProviderSubscription _sub;

  @override
  void dispose() {
    _sub.close();
    super.dispose();
  }
}
