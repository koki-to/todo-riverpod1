import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/router/router.dart';
import 'package:todo_app/utils/theme/app_theme.dart';
import 'package:todo_app/utils/theme/theme_data.dart';
import 'package:todo_app/utils/widget/sccaffold_messenger_service.dart';

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      title: 'Flutter Demo',
      theme: lightThemeData,
      darkTheme: dartThemeData,
      themeMode: ref.watch(appThemeProvider),
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
    );
  }
}
