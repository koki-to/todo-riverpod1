import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../application/bottom_navigation_controller.dart';

class CustomBottomNavigationBar extends ConsumerWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPage = ref.watch(bottomNavigationNotifierProvider);
    return BottomNavigationBar(
      currentIndex: PageType.values.indexOf(currentPage),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.toc,
          ),
          label: 'todo',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: 'プロフィール',
        ),
      ],
      onTap: (int index) {
        final pageType = PageType.values[index];
        ref
            .read(bottomNavigationNotifierProvider.notifier)
            .changePage(pageType);
      },
    );
  }
}
