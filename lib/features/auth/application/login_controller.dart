import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/exceptions/app_exception.dart';
import '../../../utils/extensions/firebase_auth_exception.dart';
import '../data/auth_repository_impl.dart';

final loginControllerProvider =
    AutoDisposeAsyncNotifierProvider<LoginController, void>(
  LoginController.new,
);

class LoginController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // 初期化処理
  }

  Future<void> login({required String email, required String password}) async {
    final authRepository = ref.watch(authRepositoryImplProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        if (email.isEmpty) {
          const exception = AppException(message: 'メールアドレスが未入力です');
          throw exception;
        }
        if (password.isEmpty) {
          const exception = AppException(message: 'パスワードが未入力です');
          throw exception;
        }
        await authRepository.login(email: email, password: password);
      } on FirebaseAuthException catch (e) {
        final exception = AppException(code: e.code, message: e.toJapanese);
        throw exception;
      }
    });
  }
}
