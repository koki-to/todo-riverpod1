import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthReposistoy {
  /// ログイン中かそうではないか
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<String?> signIn({required String email, required String password});
  Future<void> login({required String email, required String password});
  Future<void> signOut();
}
