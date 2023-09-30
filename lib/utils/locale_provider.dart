import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/i18n/strings.g.dart';

final localeProvider =
    NotifierProvider<LocaleNotifier, AppLocale>(LocaleNotifier.new);

class LocaleNotifier extends Notifier<AppLocale> {
  @override
  build() {
    return LocaleSettings.currentLocale;
  }

  void changeLocale(AppLocale locale) {
    state = locale;
    LocaleSettings.setLocale(locale);
  }
}
