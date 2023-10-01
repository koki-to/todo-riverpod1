import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../constants/strings.dart';
import '../shared_preferences_provider.dart';

final appThemeProvider =
    StateNotifierProvider<AppTheme, ThemeMode>(AppTheme.new);

class AppTheme extends StateNotifier<ThemeMode> {
  AppTheme(this._ref) : super(ThemeMode.system) {
    final themeIndex = _prefs.getInt(themePrefsKey);
    if (themeIndex == null) {
      return;
    }
    final themeMode = ThemeMode.values.firstWhere(
      (e) => e.index == themeIndex,
      orElse: () => ThemeMode.system,
    );
    state = themeMode;
  }

  final Ref _ref;

  late final _prefs = _ref.read(sharedPreferencesProvider);

  Future<void> changeTheme(ThemeMode theme) async {
    await _prefs.setInt(themePrefsKey, theme.index);
    state = theme;
  }
}
