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
    CalendarRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalendarScreen(),
      );
    },
    DetailMessageRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailMessageRouteArgs>(
          orElse: () => DetailMessageRouteArgs(id: pathParams.getString('id')));
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailMessageScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomeScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LocationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.LoginScreen(key: args.key),
      );
    },
    MessageWriteRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.MessageWriteScreen(),
      );
    },
    NewsRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.NewsScreen(),
      );
    },
    UserProfileRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileRouteArgs>(
          orElse: () => const UserProfileRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.UserProfileScreen(key: args.key),
      );
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.RegistrationScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CalendarScreen]
class CalendarRoute extends _i10.PageRouteInfo<void> {
  const CalendarRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailMessageScreen]
class DetailMessageRoute extends _i10.PageRouteInfo<DetailMessageRouteArgs> {
  DetailMessageRoute({
    _i11.Key? key,
    required String id,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          DetailMessageRoute.name,
          args: DetailMessageRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'DetailMessageRoute';

  static const _i10.PageInfo<DetailMessageRouteArgs> page =
      _i10.PageInfo<DetailMessageRouteArgs>(name);
}

class DetailMessageRouteArgs {
  const DetailMessageRouteArgs({
    this.key,
    required this.id,
  });

  final _i11.Key? key;

  final String id;

  @override
  String toString() {
    return 'DetailMessageRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LocationScreen]
class LocationRoute extends _i10.PageRouteInfo<void> {
  const LocationRoute({List<_i10.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LoginScreen]
class LoginRoute extends _i10.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i10.PageInfo<LoginRouteArgs> page =
      _i10.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.MessageWriteScreen]
class MessageWriteRoute extends _i10.PageRouteInfo<void> {
  const MessageWriteRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MessageWriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageWriteRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.NewsScreen]
class NewsRoute extends _i10.PageRouteInfo<void> {
  const NewsRoute({List<_i10.PageRouteInfo>? children})
      : super(
          NewsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.UserProfileScreen]
class UserProfileRoute extends _i10.PageRouteInfo<UserProfileRouteArgs> {
  UserProfileRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          UserProfileRoute.name,
          args: UserProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i10.PageInfo<UserProfileRouteArgs> page =
      _i10.PageInfo<UserProfileRouteArgs>(name);
}

class UserProfileRouteArgs {
  const UserProfileRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'UserProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.RegistrationScreen]
class RegistrationRoute extends _i10.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i11.Key? key,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          RegistrationRoute.name,
          args: RegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i10.PageInfo<RegistrationRouteArgs> page =
      _i10.PageInfo<RegistrationRouteArgs>(name);
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key}';
  }
}
