import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/auth/application/signin_controller.dart';
import 'package:todo_app/router/router.gr.dart';
import 'package:todo_app/utils/widget/loading.dart';
import 'package:todo_app/utils/widget/sccaffold_messenger_service.dart';

@RoutePage()
class SignupPage extends ConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(signupControllerProvider, (_, state) async {
      if (state.isLoading) {
        ref.watch(overlayLoadingProvider.notifier).update((state) => true);
        return;
      }

      await state.when(data: (_) async {
        ref.watch(overlayLoadingProvider.notifier).update((state) => false);
        ref
            .read(scaffoldMessengerServiceProvider)
            .showSnackBar('アカウント作成完了しました。');
        context.router.replace(const TodoListRoute());
      }, error: (e, s) async {
        ref.watch(overlayLoadingProvider.notifier).update((state) => false);
        ref.read(scaffoldMessengerServiceProvider).showSnackBar('エラーが発生しました。');
      }, loading: () async {
        ref.watch(overlayLoadingProvider.notifier).update((state) => true);
      });
    });

    final state = ref.watch(signupControllerProvider);
    final emialController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emialController,
              onChanged: (value) {},
              decoration: const InputDecoration(
                hintText: 'メールアドレス',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: passwordController,
              onChanged: (value) {},
              decoration: const InputDecoration(
                hintText: 'パスワード',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 60),
          ElevatedButton(
            child: const Text('登録する'),
            onPressed: state.isLoading
                ? null
                : () async {
                    ref.read(signupControllerProvider.notifier).signin(
                          email: emialController.text,
                          password: passwordController.text,
                        );
                  },
          ),
        ]),
      ),
    );
  }
}
