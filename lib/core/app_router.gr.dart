// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:campus_guide_gui/screens/calendar_screen.dart' as _i1;
import 'package:campus_guide_gui/screens/home_screen.dart' as _i2;
import 'package:campus_guide_gui/screens/location_screen.dart' as _i3;
import 'package:campus_guide_gui/screens/login_screen.dart' as _i4;
import 'package:campus_guide_gui/screens/message_detail_screen.dart' as _i5;
import 'package:campus_guide_gui/screens/message_edit_screen.dart' as _i6;
import 'package:campus_guide_gui/screens/message_screen.dart' as _i7;
import 'package:campus_guide_gui/screens/message_write_screen.dart' as _i8;
import 'package:campus_guide_gui/screens/profile_screen.dart' as _i9;
import 'package:campus_guide_gui/screens/profile_recreate_screen.dart' as _i10;
import 'package:campus_guide_gui/screens/register_screen.dart' as _i11;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CalendarRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CalendarScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeScreen(),
      );
    },
    LocationRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LocationScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      final args = routeData.argsAs<LoginRouteArgs>(
          orElse: () => const LoginRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.LoginScreen(key: args.key),
      );
    },
    MessageDetailRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessageDetailRouteArgs>(
          orElse: () => MessageDetailRouteArgs(id: pathParams.getString('id')));
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.MessageDetailScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MessageEditRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<MessageEditRouteArgs>(
          orElse: () => MessageEditRouteArgs(id: pathParams.getString('id')));
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.MessageEditScreen(
          key: args.key,
          id: args.id,
        ),
      );
    },
    MessageRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.MessageScreen(),
      );
    },
    MessageWriteRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.MessageWriteScreen(),
      );
    },
    UserProfileRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.UserProfileScreen(),
      );
    },
    RecreateProfileRoute.name: (routeData) {
      final args = routeData.argsAs<RecreateProfileRouteArgs>(
          orElse: () => const RecreateProfileRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.RecreateProfileScreen(key: args.key),
      );
    },
    RegistrationRoute.name: (routeData) {
      final args = routeData.argsAs<RegistrationRouteArgs>(
          orElse: () => const RegistrationRouteArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.RegistrationScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CalendarScreen]
class CalendarRoute extends _i12.PageRouteInfo<void> {
  const CalendarRoute({List<_i12.PageRouteInfo>? children})
      : super(
          CalendarRoute.name,
          initialChildren: children,
        );

  static const String name = 'CalendarRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LocationScreen]
class LocationRoute extends _i12.PageRouteInfo<void> {
  const LocationRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LocationRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<LoginRouteArgs> page =
      _i12.PageInfo<LoginRouteArgs>(name);
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.MessageDetailScreen]
class MessageDetailRoute extends _i12.PageRouteInfo<MessageDetailRouteArgs> {
  MessageDetailRoute({
    _i13.Key? key,
    required String id,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MessageDetailRoute.name,
          args: MessageDetailRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'MessageDetailRoute';

  static const _i12.PageInfo<MessageDetailRouteArgs> page =
      _i12.PageInfo<MessageDetailRouteArgs>(name);
}

class MessageDetailRouteArgs {
  const MessageDetailRouteArgs({
    this.key,
    required this.id,
  });

  final _i13.Key? key;

  final String id;

  @override
  String toString() {
    return 'MessageDetailRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i6.MessageEditScreen]
class MessageEditRoute extends _i12.PageRouteInfo<MessageEditRouteArgs> {
  MessageEditRoute({
    _i13.Key? key,
    required String id,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          MessageEditRoute.name,
          args: MessageEditRouteArgs(
            key: key,
            id: id,
          ),
          rawPathParams: {'id': id},
          initialChildren: children,
        );

  static const String name = 'MessageEditRoute';

  static const _i12.PageInfo<MessageEditRouteArgs> page =
      _i12.PageInfo<MessageEditRouteArgs>(name);
}

class MessageEditRouteArgs {
  const MessageEditRouteArgs({
    this.key,
    required this.id,
  });

  final _i13.Key? key;

  final String id;

  @override
  String toString() {
    return 'MessageEditRouteArgs{key: $key, id: $id}';
  }
}

/// generated route for
/// [_i7.MessageScreen]
class MessageRoute extends _i12.PageRouteInfo<void> {
  const MessageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MessageRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.MessageWriteScreen]
class MessageWriteRoute extends _i12.PageRouteInfo<void> {
  const MessageWriteRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MessageWriteRoute.name,
          initialChildren: children,
        );

  static const String name = 'MessageWriteRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.UserProfileScreen]
class UserProfileRoute extends _i12.PageRouteInfo<void> {
  const UserProfileRoute({List<_i12.PageRouteInfo>? children})
      : super(
          UserProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'UserProfileRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.RecreateProfileScreen]
class RecreateProfileRoute
    extends _i12.PageRouteInfo<RecreateProfileRouteArgs> {
  RecreateProfileRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          RecreateProfileRoute.name,
          args: RecreateProfileRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RecreateProfileRoute';

  static const _i12.PageInfo<RecreateProfileRouteArgs> page =
      _i12.PageInfo<RecreateProfileRouteArgs>(name);
}

class RecreateProfileRouteArgs {
  const RecreateProfileRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RecreateProfileRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i11.RegistrationScreen]
class RegistrationRoute extends _i12.PageRouteInfo<RegistrationRouteArgs> {
  RegistrationRoute({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          RegistrationRoute.name,
          args: RegistrationRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'RegistrationRoute';

  static const _i12.PageInfo<RegistrationRouteArgs> page =
      _i12.PageInfo<RegistrationRouteArgs>(name);
}

class RegistrationRouteArgs {
  const RegistrationRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'RegistrationRouteArgs{key: $key}';
  }
}
