import 'package:auto_route/auto_route.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('isAuth') ?? false){
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}

class LoginGuard extends AutoRouteGuard {
  @override
  Future<void> onNavigation(NavigationResolver resolver, StackRouter router) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool('isAuth') ?? false){
      router.push(const HomeRoute());
    } else {
      resolver.next(true);
    }
  }
}