import 'dart:async';

enum AuthStatus { unknown, unauthenticated, authenticated }

abstract class AuthRepository {
  Stream<AuthStatus> authStatusChanges();
  Future<void> signIn({required String email, required String password});
  Future<void> signOut();
}
