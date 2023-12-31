/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 26 (13 per locale)
///
/// Built on 2023-09-30 at 08:25 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
  en(languageCode: 'en', build: _StringsEn.build),
  ja(languageCode: 'ja', build: _StringsJa.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, _StringsEn> build;

  /// Gets current instance managed by [LocaleSettings].
  _StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
  Translations._(); // no constructor

  static _StringsEn of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, _StringsEn> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  _StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsEn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, _StringsEn> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final _StringsEn _root = this; // ignore: unused_field

  // Translations
  late final _StringsMainScreenEn mainScreen = _StringsMainScreenEn._(_root);
  late final _StringsHomePageEn homePage = _StringsHomePageEn._(_root);
  Map<String, String> get locales => {
        'en': 'English',
        'de': 'Deutsch',
        'ja': 'Japanese',
      };
}

// Path: mainScreen
class _StringsMainScreenEn {
  _StringsMainScreenEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get title => 'Japanese Title';
  String counter({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
        n,
        one: 'I pressed the button ${n} times.',
        other: 'I pressed the button ${n} times.',
      );
  String get tapMe => 'Push it';
}

// Path: homePage
class _StringsHomePageEn {
  _StringsHomePageEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get title => 'TodoList';
  late final _StringsHomePageBottomBarEn bottomBar =
      _StringsHomePageBottomBarEn._(_root);
  late final _StringsHomePageDrawerEn drawer =
      _StringsHomePageDrawerEn._(_root);
}

// Path: homePage.bottomBar
class _StringsHomePageBottomBarEn {
  _StringsHomePageBottomBarEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get todo => 'todo';
  String get profile => 'profile';
}

// Path: homePage.drawer
class _StringsHomePageDrawerEn {
  _StringsHomePageDrawerEn._(this._root);

  final _StringsEn _root; // ignore: unused_field

  // Translations
  String get themeModeLight => 'Switch to LightMode';
  String get themeModeDart => 'Switch to DarkMode';
  String get appLocale => 'Switch to English';
}

// Path: <root>
class _StringsJa implements _StringsEn {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsJa.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ja,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ja>.
  @override
  final TranslationMetadata<AppLocale, _StringsEn> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsJa _root = this; // ignore: unused_field

  // Translations
  @override
  late final _StringsMainScreenJa mainScreen = _StringsMainScreenJa._(_root);
  @override
  late final _StringsHomePageJa homePage = _StringsHomePageJa._(_root);
  @override
  Map<String, String> get locales => {
        'en': '英語',
        'de': 'ドイツ語',
        'ja': '日本語',
      };
}

// Path: mainScreen
class _StringsMainScreenJa implements _StringsMainScreenEn {
  _StringsMainScreenJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => '日本語のタイトル';
  @override
  String counter({required num n}) =>
      (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
        n,
        one: 'ボタンを${n}回押しました。',
        other: 'ボタンを${n}回押しました。',
      );
  @override
  String get tapMe => '押してね';
}

// Path: homePage
class _StringsHomePageJa implements _StringsHomePageEn {
  _StringsHomePageJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Todoリスト';
  @override
  late final _StringsHomePageBottomBarJa bottomBar =
      _StringsHomePageBottomBarJa._(_root);
  @override
  late final _StringsHomePageDrawerJa drawer =
      _StringsHomePageDrawerJa._(_root);
}

// Path: homePage.bottomBar
class _StringsHomePageBottomBarJa implements _StringsHomePageBottomBarEn {
  _StringsHomePageBottomBarJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get todo => 'todo';
  @override
  String get profile => 'プロフィール';
}

// Path: homePage.drawer
class _StringsHomePageDrawerJa implements _StringsHomePageDrawerEn {
  _StringsHomePageDrawerJa._(this._root);

  @override
  final _StringsJa _root; // ignore: unused_field

  // Translations
  @override
  String get themeModeLight => 'ライトモードに変更';
  @override
  String get themeModeDart => 'ダークモードに変更';
  @override
  String get appLocale => 'Switch to English';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'mainScreen.title':
        return 'Japanese Title';
      case 'mainScreen.counter':
        return ({required num n}) =>
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('en'))(
              n,
              one: 'I pressed the button ${n} times.',
              other: 'I pressed the button ${n} times.',
            );
      case 'mainScreen.tapMe':
        return 'Push it';
      case 'homePage.title':
        return 'TodoList';
      case 'homePage.bottomBar.todo':
        return 'todo';
      case 'homePage.bottomBar.profile':
        return 'profile';
      case 'homePage.drawer.themeModeLight':
        return 'Switch to LightMode';
      case 'homePage.drawer.themeModeDart':
        return 'Switch to DarkMode';
      case 'homePage.drawer.appLocale':
        return 'Switch to English';
      case 'locales.en':
        return 'English';
      case 'locales.de':
        return 'Deutsch';
      case 'locales.ja':
        return 'Japanese';
      default:
        return null;
    }
  }
}

extension on _StringsJa {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'mainScreen.title':
        return '日本語のタイトル';
      case 'mainScreen.counter':
        return ({required num n}) =>
            (_root.$meta.cardinalResolver ?? PluralResolvers.cardinal('ja'))(
              n,
              one: 'ボタンを${n}回押しました。',
              other: 'ボタンを${n}回押しました。',
            );
      case 'mainScreen.tapMe':
        return '押してね';
      case 'homePage.title':
        return 'Todoリスト';
      case 'homePage.bottomBar.todo':
        return 'todo';
      case 'homePage.bottomBar.profile':
        return 'プロフィール';
      case 'homePage.drawer.themeModeLight':
        return 'ライトモードに変更';
      case 'homePage.drawer.themeModeDart':
        return 'ダークモードに変更';
      case 'homePage.drawer.appLocale':
        return 'Switch to English';
      case 'locales.en':
        return '英語';
      case 'locales.de':
        return 'ドイツ語';
      case 'locales.ja':
        return '日本語';
      default:
        return null;
    }
  }
}
