import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../i18n/strings.g.dart';

final localeProvider =
    NotifierProvider<LocaleNotifier, AppLocale>(LocaleNotifier.new);

class LocaleNotifier extends Notifier<AppLocale> {
  @override
  AppLocale build() {
    return LocaleSettings.currentLocale;
  }

  void changeLocale(AppLocale locale) {
    state = locale;
    LocaleSettings.setLocale(locale);
  }
}
