import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  // ToDo: Implement auth check
  final bool authService = true;

  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async{
    if(authService){
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}