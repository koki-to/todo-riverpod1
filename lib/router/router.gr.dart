// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:todo_app/features/auth/presentation/chack_auth_page.dart'
    as _i1;
import 'package:todo_app/features/auth/presentation/login_page.dart' as _i3;
import 'package:todo_app/features/auth/presentation/signup_page.dart' as _i4;
import 'package:todo_app/features/auth/presentation/user_profile.dart' as _i7;
import 'package:todo_app/features/home/presentation/home_page.dart' as _i2;
import 'package:todo_app/features/todo/presentation/todo_create_page.dart'
    as _i5;
import 'package:todo_app/features/todo/presentation/todo_list_page.dart' as _i6;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CheckAuthRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CheckAuthPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    SignupRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignupPage(),
      );
    },
    TodoCreateRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TodoCreatePage(),
      );
    },
    TodoListRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TodoListPage(),
      );
    },
    UserProfile.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.UserProfile(),
      );
    },
  };
}

/// generated route for
/// [_i1.CheckAuthPage]
class CheckAuthRoute extends _i8.PageRouteInfo<void> {
  const CheckAuthRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CheckAuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckAuthRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignupPage]
class SignupRoute extends _i8.PageRouteInfo<void> {
  const SignupRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignupRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TodoCreatePage]
class TodoCreateRoute extends _i8.PageRouteInfo<void> {
  const TodoCreateRoute({List<_i8.PageRouteInfo>? children})
      : super(
          TodoCreateRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoCreateRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TodoListPage]
class TodoListRoute extends _i8.PageRouteInfo<void> {
  const TodoListRoute({List<_i8.PageRouteInfo>? children})
      : super(
          TodoListRoute.name,
          initialChildren: children,
        );

  static const String name = 'TodoListRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.UserProfile]
class UserProfile extends _i8.PageRouteInfo<void> {
  const UserProfile({List<_i8.PageRouteInfo>? children})
      : super(
          UserProfile.name,
          initialChildren: children,
        );

  static const String name = 'UserProfile';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
