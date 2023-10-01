import 'package:auto_route/auto_route.dart';
import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CheckAuthRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignupRoute.page),
        AutoRoute(page: TodoListRoute.page),
        AutoRoute(page: TodoCreateRoute.page),
        AutoRoute(page: TodoEditRoute.page),
        AutoRoute(page: UserProfileRoute.page),
        AutoRoute(page: HomeRoute.page),
      ];
}
