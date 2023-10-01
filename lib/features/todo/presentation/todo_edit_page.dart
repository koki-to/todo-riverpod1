// ignore_for_file: flutter_style_todos

import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.gr.dart';
import '../../../utils/widget/loading.dart';
import '../../../utils/widget/sccaffold_messenger_service.dart';
import '../../auth/data/auth_repository_impl.dart';
import '../application/todo_delete_controller.dart';
import '../application/todo_update_controller.dart';
import '../domain/todo.dart';

@RoutePage()
class TodoEditPage extends ConsumerWidget {
  const TodoEditPage({required this.todo, super.key});

  final Todo todo;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// todo更新処理
    ref
      ..listen(todoUpdateControllerProvider, (_, state) async {
        if (state.isLoading) {
          ref.watch(overlayLoadingProvider.notifier).update((state) => true);
          return;
        }
        await state.when(
          data: (data) async {
            ref.watch(overlayLoadingProvider.notifier).update((state) => false);
            ref.read(scaffoldMessengerServiceProvider).showSnackBar('更新しました');
            await context.router.replaceAll([const HomeRoute()]);
          },
          error: (e, s) async {
            ref.watch(overlayLoadingProvider.notifier).update((state) => false);
            ref
                .read(scaffoldMessengerServiceProvider)
                .showSnackBar('更新に失敗しました');
          },
          loading: () async => ref
              .watch(overlayLoadingProvider.notifier)
              .update((state) => false),
        );
      })

      /// todo削除処理
      ..listen(todoDeleteControllerProvider, (_, state) async {
        if (state.isLoading) {
          ref.watch(overlayLoadingProvider.notifier).update((state) => true);
          return;
        }
        await state.when(
          data: (data) async {
            ref.watch(overlayLoadingProvider.notifier).update((state) => false);
            ref.read(scaffoldMessengerServiceProvider).showSnackBar('削除しました');
            await context.router.replaceAll([const HomeRoute()]);
          },
          error: (e, s) async {
            ref.watch(overlayLoadingProvider.notifier).update((state) => false);
            ref
                .read(scaffoldMessengerServiceProvider)
                .showSnackBar('更新に失敗しました');
          },
          loading: () async => ref
              .watch(overlayLoadingProvider.notifier)
              .update((state) => false),
        );
      });

    final state = ref.watch(todoUpdateControllerProvider);
    final todoDeleteCtr = ref.watch(todoDeleteControllerProvider);
    final auth = ref.watch(firebaseAuthProvider).currentUser;
    final titleController = TextEditingController(text: todo.title);
    final descriptionController = TextEditingController(text: todo.description);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todoの編集'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: titleController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: 'タイトル',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: descriptionController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: '説明文',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      ref
                          .read(todoUpdateControllerProvider.notifier)
                          .updateTodo(
                            userId: auth!.uid,
                            todo: Todo(
                              id: todo.id,
                              title: titleController.text,
                              description: descriptionController.text,
                              completed: todo.completed,
                              createdAt: todo.createdAt,
                              updatedAt: Timestamp.now(),
                            ),
                          );
                    },
              child: const Text('更新'),
            ),
            ElevatedButton(
              onPressed: todoDeleteCtr.isLoading
                  ? null
                  : () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      ref
                          .read(todoDeleteControllerProvider.notifier)
                          .deleteTodo(
                            userId: auth!.uid,
                            todoId: todo.id,
                          );
                    },
              child: const Text('削除'),
            ),
          ],
        ),
      ),
    );
  }
}
