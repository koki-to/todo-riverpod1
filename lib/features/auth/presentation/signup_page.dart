import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.gr.dart';
import '../../../utils/widget/loading.dart';
import '../../../utils/widget/sccaffold_messenger_service.dart';
import '../application/signin_controller.dart';

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

      await state.when(
        data: (_) async {
          ref.watch(overlayLoadingProvider.notifier).update((state) => false);
          ref
              .read(scaffoldMessengerServiceProvider)
              .showSnackBar('アカウント作成完了しました。');
          await context.router.replace(const HomeRoute());
        },
        error: (e, s) async {
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

    final state = ref.watch(signupControllerProvider);
    final emialController = TextEditingController();
    final passwordController = TextEditingController();
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
                controller: emialController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  hintText: 'メールアドレス',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
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
              onPressed: state.isLoading
                  ? null
                  : () async {
                      await ref.read(signupControllerProvider.notifier).signin(
                            email: emialController.text,
                            password: passwordController.text,
                          );
                    },
              child: const Text('登録する'),
            ),
          ],
        ),
      ),
    );
  }
}
