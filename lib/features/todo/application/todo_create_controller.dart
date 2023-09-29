import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/data/todo_repository_impl.dart';
import 'package:todo_app/features/todo/domain/todo.dart';
import 'package:todo_app/utils/exceptions/app_exception.dart';
import 'package:uuid/uuid.dart';

final todoCreateControllerProvider =
    AutoDisposeAsyncNotifierProvider<TodoCreateController, void>(
        TodoCreateController.new);

class TodoCreateController extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() {}

  Future<void> createTodo({
    required String uid,
    required String title,
    required String description,
  }) async {
    final todoRepository = ref.read(todoRepositoryImplProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        if (title.isEmpty) {
          const exception = AppException(
            message: 'タイトルを入力してください',
          );
          throw exception;
        }

        if (description.isEmpty) {
          const exception = AppException(
            message: '説明文を入力してください',
          );
          throw exception;
        }

        final todo = Todo(
          id: const Uuid().v4(),
          title: title,
          description: description,
          completed: false,
          createdAt: Timestamp.now(),
          updatedAt: Timestamp.now(),
        );

        final result = await todoRepository.createTodo(todo: todo, uid: uid);
        if (!result) {
          const exception =
              AppException(message: '登録に失敗しました。前の画面に戻り再度登録してください。');
          throw exception;
        }
      } on AppException {
        rethrow;
      }
    });
  }
}
