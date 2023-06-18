// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:campus_guide_gui/screens/calendar_screen.dart' as _i1;
import 'package:campus_guide_gui/screens/detail_message_screen.dart' as _i2;
import 'package:campus_guide_gui/screens/home_screen.dart' as _i3;
import 'package:campus_guide_gui/screens/location_screen.dart' as _i4;
import 'package:campus_guide_gui/screens/login_screen.dart' as _i5;
import 'package:campus_guide_gui/screens/message_write_screen.dart' as _i6;
import 'package:campus_guide_gui/screens/news_screen.dart' as _i7;
import 'package:campus_guide_gui/screens/profile_screen.dart' as _i8;
import 'package:campus_guide_gui/screens/register_screen.dart' as _i9;
import 'package:flutter/material.dart' as _i11;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CalendarScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalendarScreen(),
      );
    },
    DetailMessageScreenRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailMessageScreenRouteArgs>(
          orElse: () =>
              DetailMessageScreenRouteArgs(id: pathParams.getString('id')));
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailMessageScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LocationScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LocationScreen(),
      );
    },
    LoginScreenRoute.name: (routeData) {
      final args = routeData.argsAs<LoginScreenRouteArgs>(
          orElse: () => const LoginScreenRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginScreen(key: args.key),
      );
    },
    MessageWriteScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MessageWriteScreen(),
      );
    },
    NewsScreenRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NewsScreen(),
      );
    },
    UserProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenRouteArgs>(
          orElse: () => const UserProfileScreenRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.UserProfileScreen(key: args.key),
      );
    },
    RegistrationScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationScreenRouteArgs>(
          orElse: () => const RegistrationScreenRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RegistrationScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CalendarScreen]
class CalendarScreenRoute extends _i10.PageRouteInfo<void> {
  const CalendarScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CalendarScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailMessageScreen]
class DetailMessageScreenRoute
    extends _i10.PageRouteInfo<DetailMessageScreenRouteArgs> {
  DetailMessageScreenRoute({
    _i11.Key? key,
    required String id,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          DetailMessageScreenRoute.name,
          args: DetailMessageScreenRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DetailMessageScreenRoute';

  static const _i10.PageInfo<DetailMessageScreenRouteArgs> page =
      _i10.PageInfo<DetailMessageScreenRouteArgs>(name);
}

class DetailMessageScreenRouteArgs {
  const DetailMessageScreenRouteArgs({
    this.key,
    required this.id,
  });

  final _i11.Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailMessageScreenRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeScreenRoute extends _i10.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LocationScreen]
class LocationScreenRoute extends _i10.PageRouteInfo<void> {
  const LocationScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LocationScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginScreenRoute extends _i10.PageRouteInfo<LoginScreenRouteArgs> {
  LoginScreenRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LoginScreenRoute.name,
          args: LoginScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginScreenRoute';

  static const _i10.PageInfo<LoginScreenRouteArgs> page =
      _i10.PageInfo<LoginScreenRouteArgs>(name);
}

class LoginScreenRouteArgs {
  const LoginScreenRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.MessageWriteScreen]
class MessageWriteScreenRoute extends _i10.PageRouteInfo<void> {
  const MessageWriteScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MessageWriteScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageWriteScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NewsScreen]
class NewsScreenRoute extends _i10.PageRouteInfo<void> {
  const NewsScreenRoute({List<_i10.PageRouteInfo>? children})
      : super(
          NewsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsScreenRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.UserProfileScreen]
class UserProfileScreenRoute
    extends _i10.PageRouteInfo<UserProfileScreenRouteArgs> {
  UserProfileScreenRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          UserProfileScreenRoute.name,
          args: UserProfileScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfileScreenRoute';

  static const _i10.PageInfo<UserProfileScreenRouteArgs> page =
      _i10.PageInfo<UserProfileScreenRouteArgs>(name);
}

class UserProfileScreenRouteArgs {
  const UserProfileScreenRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'UserProfileScreenRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RegistrationScreen]
class RegistrationScreenRoute
    extends _i10.PageRouteInfo<RegistrationScreenRouteArgs> {
  RegistrationScreenRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RegistrationScreenRoute.name,
          args: RegistrationScreenRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegistrationScreenRoute';

  static const _i10.PageInfo<RegistrationScreenRouteArgs> page =
      _i10.PageInfo<RegistrationScreenRouteArgs>(name);
}

class RegistrationScreenRouteArgs {
  const RegistrationScreenRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'RegistrationScreenRouteArgs{key: $key}';
  }
}
