import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../i18n/strings.g.dart';
import '../../../../utils/locale_provider.dart';
import '../../../../utils/theme/app_theme.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    final activeLocale = ref.watch(localeProvider);
    return Drawer(
      child: ListView(
        children: [
          appTheme == ThemeMode.light
              ? ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: Text(t.homePage.drawer.themeModeDart),
                  onTap: () {
                    ref
                        .read(appThemeProvider.notifier)
                        .changeTheme(ThemeMode.dark);
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.sunny_snowing),
                  title: Text(t.homePage.drawer.themeModeLight),
                  onTap: () {
                    ref
                        .read(appThemeProvider.notifier)
                        .changeTheme(ThemeMode.light);
                  },
                ),
          activeLocale == AppLocale.ja
              ? ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(t.homePage.drawer.appLocale),
                  onTap: () {
                    ref
                        .read(localeProvider.notifier)
                        .changeLocale(AppLocale.en);
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.language),
                  title: Text(t.homePage.drawer.appLocale),
                  onTap: () {
                    ref
                        .read(localeProvider.notifier)
                        .changeLocale(AppLocale.ja);
                  },
                ),
        ],
      ),
    );
  }
}
