import 'package:campus_guide_gui/core/app_router.dart';
import 'package:campus_guide_gui/core/auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var data = prefs.getString('token') ?? ''; //null check
  runApp(ChangeNotifierProvider(
    create: (context) => Auth(),
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Campus Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
    );
  }
}