import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/auth/presentation/user_profile.dart';
import 'package:todo_app/features/home/application/bottom_navigation_controller.dart';
import 'package:todo_app/features/todo/presentation/todo_list_page.dart';
import 'package:todo_app/features/home/presentation/widget/custom_bottom_navigation_bar.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(bottomNavigationNotifierProvider);

    String appBarTitle;
    Widget body;

    switch (currentPage) {
      case PageType.Todo:
        appBarTitle = 'Todoリスト';
        body = const TodoListPage();
        break;
      case PageType.Profile:
        appBarTitle = 'プロフィール';
        body = const UserProfile();
        break;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: body,
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
