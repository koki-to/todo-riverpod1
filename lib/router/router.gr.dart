// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:todo_app/features/auth/presentation/chack_auth_page.dart'
    as _i1;
import 'package:todo_app/features/auth/presentation/login_page.dart' as _i2;
import 'package:todo_app/features/auth/presentation/signup_page.dart' as _i3;
import 'package:todo_app/features/todo/presentation/todo_create_page.dart'
    as _i4;
import 'package:todo_app/features/todo/presentation/todo_list_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    CheckAuthRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CheckAuthPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignupPage(),
      );
    },
    TodoCreateRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.TodoCreatePage(),
      );
    },
    TodoListRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TodoListPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.CheckAuthPage]
class CheckAuthRoute extends _i6.PageRouteInfo<void> {
  const CheckAuthRoute({List<_i6.PageRouteInfo>? children})
      : super(
          CheckAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckAuthRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignupPage]
class SignupRoute extends _i6.PageRouteInfo<void> {
  const SignupRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.TodoCreatePage]
class TodoCreateRoute extends _i6.PageRouteInfo<void> {
  const TodoCreateRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TodoCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoCreateRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TodoListPage]
class TodoListRoute extends _i6.PageRouteInfo<void> {
  const TodoListRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TodoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
