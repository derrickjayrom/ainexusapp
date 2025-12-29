import 'dart:async';
import 'auth_repository.dart';

class FakeAuthRepository implements AuthRepository {
  final _controller = StreamController<AuthStatus>.broadcast();
  AuthStatus _status = AuthStatus.unauthenticated;

  FakeAuthRepository() {
    // Simulate startup check
    Future<void>.delayed(const Duration(milliseconds: 300), () {
      _controller.add(_status);
    });
  }

  @override
  Stream<AuthStatus> authStatusChanges() => _controller.stream;

  @override
  Future<void> signIn({required String email, required String password}) async {
    await Future<void>.delayed(const Duration(milliseconds: 600));
    _status = AuthStatus.authenticated;
    _controller.add(_status);
  }

  @override
  Future<void> signOut() async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    _status = AuthStatus.unauthenticated;
    _controller.add(_status);
  }
}
