import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.gr.dart';
import '../../../utils/analytics_provider.dart';
import '../../../utils/widget/loading.dart';
import '../../../utils/widget/sccaffold_messenger_service.dart';
import '../../auth/data/auth_repository_impl.dart';
import '../application/todo_create_controller.dart';

@RoutePage()
class TodoCreatePage extends ConsumerWidget {
  const TodoCreatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(todoCreateControllerProvider, (_, state) async {
      if (state.isLoading) {
        ref.watch(overlayLoadingProvider.notifier).update((state) => true);
        return;
      }
      await state.when(
        data: (_) {
          ref.watch(overlayLoadingProvider.notifier).update((state) => false);
          ref
              .read(scaffoldMessengerServiceProvider)
              .showSnackBar('Todoを登録しました');
          context.router.replaceAll([const HomeRoute()]);
        },
        error: (e, s) {
          ref.watch(overlayLoadingProvider.notifier).update((state) => false);
          ref
              .read(scaffoldMessengerServiceProvider)
              .showSnackBar('エラーが発生しました。');
        },
        loading: () async {
          ref.watch(overlayLoadingProvider.notifier).update((state) => true);
        },
      );
    });

    final state = ref.watch(todoCreateControllerProvider);
    final auth = ref.watch(firebaseAuthProvider).currentUser;
    final analytics = ref.read(analyticsServiceProvider);
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
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
                  : () async {
                      await ref
                          .read(todoCreateControllerProvider.notifier)
                          .createTodo(
                            uid: auth!.uid,
                            title: titleController.text,
                            description: descriptionController.text,
                          );
                      await analytics.createTodo(userId: auth.uid);
                    },
              child: const Text('登録'),
            ),
          ],
        ),
      ),
    );
  }
}
