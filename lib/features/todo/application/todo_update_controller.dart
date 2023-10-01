import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/exceptions/app_exception.dart';
import '../data/todo_repository_impl.dart';
import '../domain/todo.dart';

final todoUpdateControllerProvider =
    AutoDisposeAsyncNotifierProvider<TodoUpdateController, void>(
  TodoUpdateController.new,
);

class TodoUpdateController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> updateTodo({required Todo todo, required String userId}) async {
    final todoRepository = ref.read(todoRepositoryImplProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        if (todo.title.isEmpty) {
          const exception = AppException(message: 'タイトルを入力してください');
          throw exception;
        }

        if (todo.description.isEmpty) {
          const exception = AppException(message: '説明文を入力してください');
          throw exception;
        }

        await todoRepository.updateTodo(todo: todo, userId: userId);
      } on AppException {
        rethrow;
      }
    });
  }
}
