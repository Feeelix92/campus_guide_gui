// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:campus_guide_gui/screens/calendar_screen.dart' as _i1;
import 'package:campus_guide_gui/screens/home_screen.dart' as _i2;
import 'package:campus_guide_gui/screens/location_screen.dart' as _i3;
import 'package:campus_guide_gui/screens/login_screen.dart' as _i4;
import 'package:campus_guide_gui/screens/news_screen.dart' as _i5;
import 'package:campus_guide_gui/screens/profile_screen.dart' as _i6;
import 'package:campus_guide_gui/screens/register_screen.dart' as _i7;
import 'package:flutter/material.dart' as _i9;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CalendarRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalendarScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LocationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LoginScreen(key: args.key),
      );
    },
    NewsRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.NewsScreen(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () => const UserProfileRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.UserProfileScreen(key: args.key),
      );
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.RegistrationScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CalendarScreen]
class CalendarRoute extends _i8.PageRouteInfo<void> {
  const CalendarRoute({List<_i8.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
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
/// [_i3.LocationScreen]
class LocationRoute extends _i8.PageRouteInfo<void> {
  const LocationRoute({List<_i8.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i8.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i8.PageInfo<LoginRouteArgs> page =
      _i8.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.NewsScreen]
class NewsRoute extends _i8.PageRouteInfo<void> {
  const NewsRoute({List<_i8.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.UserProfileScreen]
class UserProfileRoute extends _i8.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i8.PageInfo<UserProfileRouteArgs> page =
      _i8.PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.RegistrationScreen]
class RegistrationRoute extends _i8.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i9.Key? key,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          RegistrationRoute.name,
          args: RegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i8.PageInfo<RegistrationRouteArgs> page =
      _i8.PageInfo<RegistrationRouteArgs>(name);
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key}';
  }
}
