import 'package:firebase_auth/firebase_auth.dart';
import 'package:todo_app/features/auth/domain/firestore_user.dart';

abstract class AuthReposistoy {
  Stream<User?> authStateChanges();
  Future<String?> signIn({required String email, required String password});
  Future<void> login({required String email, required String password});
  Future<void> signOut();
}
