import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/utils/theme/app_theme.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Drawer(
      child: ListView(
        children: [
          appTheme == ThemeMode.light
              ? ListTile(
                  leading: const Icon(Icons.dark_mode),
                  title: const Text('ダークモード'),
                  onTap: () {
                    ref
                        .read(appThemeProvider.notifier)
                        .changeTheme(ThemeMode.dark);
                  },
                )
              : ListTile(
                  leading: const Icon(Icons.sunny_snowing),
                  title: const Text('ライトモード'),
                  onTap: () {
                    ref
                        .read(appThemeProvider.notifier)
                        .changeTheme(ThemeMode.light);
                  },
                )
        ],
      ),
    );
  }
}
