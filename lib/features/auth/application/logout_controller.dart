import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/exceptions/app_exception.dart';
import '../../../utils/extensions/firebase_auth_exception.dart';
import '../data/auth_repository_impl.dart';

final logoutControllerProvider =
    AutoDisposeAsyncNotifierProvider<LogoutController, void>(
  LogoutController.new,
);

class LogoutController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> logout() async {
    final authReposistoy = ref.read(authRepositoryImplProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        await authReposistoy.signOut();
      } on FirebaseAuthException catch (e) {
        final exception = AppException(
          code: e.code,
          message: e.toJapanese,
        );
        throw exception;
      }
    });
  }
}
