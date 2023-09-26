import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/auth/data/auth_repository.dart';
import 'package:todo_app/features/auth/domain/firestore_user.dart';

final firebaseAuthProvider = Provider((_) {
  return FirebaseAuth.instance;
});

final authRepositoryImplProvider = Provider<AuthReposistoy>(
    (ref) => AuthRepositoryImpl(ref.watch(firebaseAuthProvider)));

class AuthRepositoryImpl implements AuthReposistoy {
  AuthRepositoryImpl(this._auth);

  final FirebaseAuth _auth;
  @override
  Stream<FirestoreUser?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return userCredential.user!.uid;
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }
}
