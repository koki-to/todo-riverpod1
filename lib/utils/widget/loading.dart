import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

/// アプリ全体に半透明のローディング画面を重ねるかどうか。
final overlayLoadingProvider = StateProvider<bool>((_) => false);

/// プライマリカラーの SpinkitCircle を表示する
class PrimarySpinkitCircle extends StatelessWidget {
  const PrimarySpinkitCircle({
    super.key,
    this.size = 48,
  });

  final double size;
  @override
  Widget build(BuildContext context) {
    return SpinKitFadingCircle(
      size: size,
      color: Colors.amber,
    );
  }
}

/// 二度押しを防止したいときなどの重ねるローディングウィジェット
class OverlayLoadingWidget extends StatelessWidget {
  const OverlayLoadingWidget({
    super.key,
    this.backgroundColor = Colors.black38,
  });

  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor.withOpacity(0.7),
      child: const SizedBox.expand(
        child: Center(
          child: PrimarySpinkitCircle(),
        ),
      ),
    );
  }
}
