import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/data/todo_repository_impl.dart';
import 'package:todo_app/utils/exceptions/app_exception.dart';

final todoDeleteControllerProvider =
    AutoDisposeAsyncNotifierProvider<TodoDeleteController, void>(
        TodoDeleteController.new);

class TodoDeleteController extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() {}

  Future<void> deleteTodo(
      {required String todoId, required String userId}) async {
    final todoRepository = ref.read(todoRepositoryImplProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        todoRepository.deleteTodo(
          todoId: todoId,
          userId: userId,
        );
      } on AppException {
        rethrow;
      }
    });
  }
}
