import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/auth/application/logout_controller.dart';
import 'package:todo_app/router/router.gr.dart';
import 'package:todo_app/utils/widget/loading.dart';
import 'package:todo_app/utils/widget/sccaffold_messenger_service.dart';

@RoutePage()
class TodoListPage extends ConsumerWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(logoutControllerProvider, (_, state) async {
      if (state.isLoading) {
        ref.watch(overlayLoadingProvider.notifier).update((state) => true);
        return;
      }
      await state.when(data: (_) async {
        ref.watch(overlayLoadingProvider.notifier).update((state) => false);
        ref.read(scaffoldMessengerServiceProvider).showSnackBar('ログアウトしました');
        context.router.replace(const LoginRoute());
      }, error: (e, s) {
        ref.watch(overlayLoadingProvider.notifier).update((state) => false);
        ref.read(scaffoldMessengerServiceProvider).showSnackBar('エラーが発生しました。');
      }, loading: () async {
        ref.watch(overlayLoadingProvider.notifier).update((state) => true);
      });
    });

    final state = ref.watch(logoutControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('todolist'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('todoListPage'),
            ElevatedButton(
              onPressed: () => context.router.push(
                const TodoCreateRoute(),
              ),
              child: const Text('新規登録'),
            ),
            ElevatedButton(
              onPressed: state.isLoading
                  ? null
                  : () {
                      ref.read(logoutControllerProvider.notifier).logout();
                    },
              child: const Text('ログアウト'),
            ),
          ],
        ),
      ),
    );
  }
}
