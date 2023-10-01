import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../i18n/strings.g.dart';
import '../../auth/presentation/user_profile.dart';
import '../../todo/presentation/todo_list_page.dart';
import '../application/bottom_navigation_controller.dart';
import 'widget/custom_bottom_navigation_bar.dart';
import 'widget/custom_drawer.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final currentPage = ref.watch(bottomNavigationNotifierProvider);

    String appBarTitle;
    Widget body;

    switch (currentPage) {
      case PageType.Todo:
        appBarTitle = t.homePage.title;
        body = const TodoListPage();
      case PageType.Profile:
        appBarTitle = t.homePage.bottomBar.profile;
        body = const UserProfilePage();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      drawer: const CustomDrawer(),
      body: body,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
