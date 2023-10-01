import '../domain/todo.dart';

abstract class TodoRepository {
  Future<bool> createTodo({required Todo todo, required String uid});
  Stream<List<Todo>> streamTodoList({required String userId});
  Future<void> updateTodo({required Todo todo, required String userId});
  Future<void> deleteTodo({required String todoId, required String userId});
}
