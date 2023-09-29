import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final scaffoldMessengerKeyProvider = Provider(
  (_) => GlobalKey<ScaffoldMessengerState>(),
);

final scaffoldMessengerServiceProvider =
    Provider.autoDispose(ScaffordMessengerService.new);

class ScaffordMessengerService {
  ScaffordMessengerService(this._ref);

  final AutoDisposeProviderRef<ScaffordMessengerService> _ref;

  GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _ref.read(scaffoldMessengerKeyProvider);

  /// errorDialogを表示する。
  Future<T?> showDialogByBuilder<T>({
    required Widget Function(BuildContext) builder,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: scaffoldMessengerKey.currentContext!,
      barrierDismissible: barrierDismissible,
      builder: builder,
    );
  }

  /// snackBarを表示する。
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
    String message, {
    bool removeCurrentSnackBar = true,
    Duration duration = const Duration(seconds: 2),
  }) {
    final scaffoldMessengerState = scaffoldMessengerKey.currentState!;
    if (removeCurrentSnackBar) {
      scaffoldMessengerState.removeCurrentSnackBar();
    }
    return scaffoldMessengerState.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(),
        ),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
        duration: duration,
      ),
    );
  }
}
