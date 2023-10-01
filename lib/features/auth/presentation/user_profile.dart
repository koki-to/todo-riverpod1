import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.gr.dart';
import '../../../utils/widget/loading.dart';
import '../../../utils/widget/sccaffold_messenger_service.dart';
import '../application/logout_controller.dart';
import '../data/auth_repository_impl.dart';

@RoutePage()
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ログアウト処理
    ref.listen(logoutControllerProvider, (_, state) async {
      if (state.isLoading) {
        ref.watch(overlayLoadingProvider.notifier).update((state) => true);
        return;
      }
      await state.when(
        data: (_) async {
          ref.watch(overlayLoadingProvider.notifier).update((state) => false);
          ref.read(scaffoldMessengerServiceProvider).showSnackBar('ログアウトしました');
          await context.router.replace(const LoginRoute());
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

    final state = ref.watch(logoutControllerProvider);

    final currentUser = ref.watch(authRepositoryImplProvider).currentUser;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(currentUser == null ? '' : currentUser.email!),
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
    );
  }
}
