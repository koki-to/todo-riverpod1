import 'package:auto_route/auto_route.dart';
import 'package:todo_app/router/router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CheckAuthRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(
          page: SignupRoute.page,
        ),
        AutoRoute(
          page: TodoListRoute.page,
        ),
      ];
}
