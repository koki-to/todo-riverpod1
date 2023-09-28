import 'package:todo_app/features/todo/domain/todo.dart';

abstract class TodoRepository {
  Future<bool> createTodo({required Todo todo, required String uid});
  Stream<List<Todo>> streamTodoList({required String userId});
}
