import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth_repository.dart';

final firebaseAuthProvider = Provider((_) {
  return FirebaseAuth.instance;
});

final authRepositoryImplProvider = Provider<AuthReposistoy>(
  (ref) => AuthRepositoryImpl(ref.watch(firebaseAuthProvider)),
);

final authUserProvider = StreamProvider(
  (ref) => ref.watch(authRepositoryImplProvider).authStateChanges(),
);

class AuthRepositoryImpl implements AuthReposistoy {
  AuthRepositoryImpl(this._auth);
  final FirebaseAuth _auth;

  @override
  User? get currentUser => _auth.currentUser;

  @override
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  @override
  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    final userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user!.uid;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }
}
