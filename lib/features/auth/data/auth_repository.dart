import 'package:todo_app/features/auth/domain/firestore_user.dart';

abstract class AuthReposistoy {
  Stream<FirestoreUser?> authStateChanges();
  Future<String?> signIn({required String email, required String password});
  Future<void> signOut();
}
