import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../router/router.gr.dart';
import '../../../utils/widget/loading.dart';
import '../data/auth_repository_impl.dart';

@RoutePage()
class CheckAuthPage extends ConsumerWidget {
  const CheckAuthPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: ref.watch(authUserProvider).when(
        data: (data) {
          if (data != null) {
            context.router.replace(const HomeRoute());
            return;
          }
          context.router.replace(const LoginRoute());
          return;
        },
        error: (e, s) {
          context.router.replace(const LoginRoute());
          return;
        },
        loading: () {
          return const OverlayLoadingWidget();
        },
      ),
    );
  }
}
