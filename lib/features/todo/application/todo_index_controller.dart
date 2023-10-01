import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../auth/data/auth_repository_impl.dart';
import '../data/todo_repository_impl.dart';

final todosProvider = StreamProvider.autoDispose((ref) {
  final userId = ref.watch(authRepositoryImplProvider).currentUser!.uid;
  final todos =
      ref.watch(todoRepositoryImplProvider).streamTodoList(userId: userId);
  return todos;
});
