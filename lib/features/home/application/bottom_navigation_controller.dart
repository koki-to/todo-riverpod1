// ignore_for_file: constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PageType {
  Todo,
  Profile,
}

final bottomNavigationNotifierProvider =
    NotifierProvider<BottomNavigationNotifier, PageType>(
  BottomNavigationNotifier.new,
);

class BottomNavigationNotifier extends Notifier<PageType> {
  @override
  PageType build() {
    return PageType.Todo;
  }

  void changePage(PageType pageType) {
    state = pageType;
  }
}
