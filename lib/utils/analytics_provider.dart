import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final analyticsServiceProvider = Provider<AnalyticsService>(
  (ref) => AnalyticsService(ref.watch(firebaseAnalyticsProvider)),
);

final firebaseAnalyticsProvider = Provider((_) {
  return FirebaseAnalytics.instance;
});

// GoogleAnalyticsを使用するためのサービスクラス
class AnalyticsService {
  AnalyticsService(this.analytics);

  final FirebaseAnalytics analytics;
  // ログインイベント
  Future<void> createTodo({required String userId}) async {
    await analytics.logEvent(
      name: 'Todoタスク作成',
      parameters: <String, dynamic>{
        'userId': userId,
      },
    );
  }
}
