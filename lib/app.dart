import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'i18n/strings.g.dart';
import 'router/router.dart';
import 'utils/locale_provider.dart';
import 'utils/theme/app_theme.dart';
import 'utils/theme/theme_data.dart';
import 'utils/widget/sccaffold_messenger_service.dart';

class App extends ConsumerWidget {
  App({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(localeProvider);
    return MaterialApp.router(
      title: 'Flutter Demo',
      locale: currentLocale.flutterLocale,
      supportedLocales: AppLocaleUtils.supportedLocales,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
      theme: lightThemeData,
      darkTheme: dartThemeData,
      themeMode: ref.watch(appThemeProvider),
      scaffoldMessengerKey: ref.watch(scaffoldMessengerKeyProvider),
    );
  }
}
