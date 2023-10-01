// ignore_for_file: flutter_style_todos

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/todo.dart';
import 'todo_repository.dart';

final firebaseFirestoreProvider = Provider((_) {
  return FirebaseFirestore.instance;
});

final todoRepositoryImplProvider = Provider<TodoRepository>(
  (ref) => TodoRepositoryImpl(ref.watch(firebaseFirestoreProvider)),
);

class TodoRepositoryImpl implements TodoRepository {
  TodoRepositoryImpl(this._firestore);
  final FirebaseFirestore _firestore;

  /// todoの登録
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

  /// todoリストの取得
  @override
  Stream<List<Todo>> streamTodoList({required String userId}) {
    final crTodo = _firestore
        .collection('users')
        .doc(userId)
        .collection('todo')
        .withConverter(
          fromFirestore: (snapshot, _) => Todo.fromDocumentSnapshot(snapshot),
          toFirestore: (snapshot, _) {
            return snapshot.toJson();
          },
        );
    return crTodo
        .snapshots()
        .map((qs) => qs.docs.map((qds) => qds.data()).toList());
  }

  /// todoの更新
  @override
  Future<void> updateTodo({required Todo todo, required String userId}) async {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('todo')
        .doc(todo.id)
        .update(todo.toJson());
  }

  /// todoの削除
  @override
  Future<void> deleteTodo({
    required String todoId,
    required String userId,
  }) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('todo')
        .doc(todoId)
        .delete();
  }
}
