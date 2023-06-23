import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'route_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(page: HomeRoute.page, path: '/'),
    AutoRoute(page: CalendarRoute.page, path: '/calendar', guards: [AuthGuard()]),
    AutoRoute(page: LocationRoute.page, path: '/locations', guards: [AuthGuard()]),
    AutoRoute(page: UserProfileRoute.page, path: '/user', guards: [AuthGuard()]),
    AutoRoute(page: MessageRoute.page, path: '/news', guards: [AuthGuard()]),
    AutoRoute(page: MessageWriteRoute.page, path: '/news/write', guards: [AuthGuard()]),
    AutoRoute(page: MessageEditRoute.page, path: '/news/edit/:id', guards: [AuthGuard()]),
    AutoRoute(page: MessageDetailRoute.page, path: '/news/:id', guards: [AuthGuard()]),
    /// Auth
    AutoRoute(page: LoginRoute.page, path: '/login', guards: [LoginGuard()]),
    AutoRoute(page: RegistrationRoute.page, path: '/registration', guards: [LoginGuard()]),
  ];
}