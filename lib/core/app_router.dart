import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';
import 'auth_guard.dart';

@AutoRouterConfig(replaceInRouteName: 'Route')
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    /// routes go here
    AutoRoute(page: HomeScreenRoute.page, path: '/'),
    AutoRoute(page: CalendarScreenRoute.page, path: '/calendar', guards: [AuthGuard()]),
    AutoRoute(page: LocationScreenRoute.page, path: '/locations', guards: [AuthGuard()]),
    AutoRoute(page: NewsScreenRoute.page, path: '/news', guards: [AuthGuard()]),
    AutoRoute(page: UserProfileScreenRoute.page, path: '/user', guards: [AuthGuard()]),
    AutoRoute(page: MessageWriteScreenRoute.page, path: '/news/write', guards: [AuthGuard()]),
    AutoRoute(path: '/news/:id', page: DetailMessageScreenRoute.page, guards: [AuthGuard()]),
    /// Auth
    AutoRoute(page: LoginScreenRoute.page, path: '/login'),
    AutoRoute(page: RegistrationScreenRoute.page, path: '/registration'),
  ];
}