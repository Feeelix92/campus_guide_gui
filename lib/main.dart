import 'package:campus_guide_gui/screens/calendar.dart';
import 'package:campus_guide_gui/screens/home.dart';
import 'package:campus_guide_gui/screens/locations.dart';
import 'package:campus_guide_gui/screens/news.dart';
import 'package:campus_guide_gui/screens/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return PageRouteBuilder(
              maintainState: true,
              pageBuilder: (context, animation, secondaryAnimation) => const Home(title: 'Campus Guide'),
            );
          case '/calendar':
            return PageRouteBuilder(
              maintainState: true,
              pageBuilder: (context, animation, secondaryAnimation) => const Calendar(),
            );
          case '/news':
            return PageRouteBuilder(
              maintainState: true,
              pageBuilder: (context, animation, secondaryAnimation) => const News(),
            );
          case '/locations':
            return PageRouteBuilder(
              maintainState: true,
              pageBuilder: (context, animation, secondaryAnimation) => const Locations(),
            );
            case '/profile':
            return PageRouteBuilder(
              maintainState: true,
              pageBuilder: (context, animation, secondaryAnimation) => UserProfile(),
            );
          default:
            return null;
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
      title: 'Campus Guide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
    );
  }
}
