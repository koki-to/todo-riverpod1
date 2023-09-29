import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/application/todo_index_controller.dart';
import 'package:todo_app/features/todo/domain/todo.dart';
import 'package:todo_app/router/router.gr.dart';

@RoutePage()
class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Todoリストの取得
    final todos = ref.watch(todosProvider).maybeWhen<List<Todo>>(
        data: (data) {
          return data.toList();
        },
        orElse: () => []);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return Card(
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    tileColor: Colors.amber[50],
                    onTap: () {
                      context.router.push(TodoEditRoute(todo: todo));
                    },
                  ),
                );
              }),
          ElevatedButton(
            onPressed: () => context.router.push(
              const TodoCreateRoute(),
            ),
            child: const Text('新規登録'),
          ),
        ],
      ),
    );
  }
}
