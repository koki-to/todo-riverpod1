import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/data/todo_repository.dart';
import 'package:todo_app/features/todo/domain/todo.dart';

final firebaseFirestoreProvider = Provider((_) {
  return FirebaseFirestore.instance;
});

final todoRepositoryImplProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(ref.watch(firebaseFirestoreProvider)),
);

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this._firestore);
  final FirebaseFirestore _firestore;

  @override
  Future<bool> createTodo({required Todo todo, required String uid}) async {
    final docRf = await _firestore
        .collection('users')
        .doc(uid)
        .collection('todo')
        .add(todo.toJson());
    final ds = await docRf.get();
    return ds.exists;
  }

  @override
  Future<List<Todo>> fetchTodoList({required String userId}) {
    // TODO: implement fetchTodoList
    throw UnimplementedError();
  }
}
