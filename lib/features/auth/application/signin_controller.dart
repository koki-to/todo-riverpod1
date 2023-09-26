import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/auth/data/auth_repository_impl.dart';
import 'package:todo_app/utils/exception/app_exception.dart';

final signupControllerProvider =
    AutoDisposeAsyncNotifierProvider<SignunController, void>(
        SignunController.new);

class SignunController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {
    // 初期値処理は不要
  }

  Future<void> signin({required String email, required String password}) async {
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

        final uid =
            await authRepository.signIn(email: email, password: password);
        if (uid == null) {
          const exception =
              AppException(message: 'アカウント作成に失敗しました。別のアドレスでお試しください。');
          throw exception;
        }
      } on FirebaseAuthException catch (e) {
        final exception = AppException(code: e.code, message: e.message);
        throw exception;
      }
    });
  }
}