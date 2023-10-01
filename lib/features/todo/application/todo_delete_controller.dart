import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../utils/exceptions/app_exception.dart';
import '../data/todo_repository_impl.dart';

final todoDeleteControllerProvider =
    AutoDisposeAsyncNotifierProvider<TodoDeleteController, void>(
  TodoDeleteController.new,
);

class TodoDeleteController extends AutoDisposeAsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> deleteTodo({
    required String todoId,
    required String userId,
  }) async {
    final todoRepository = ref.read(todoRepositoryImplProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      try {
        await todoRepository.deleteTodo(
          todoId: todoId,
          userId: userId,
        );
      } on AppException {
        rethrow;
      }
    });
  }
}
