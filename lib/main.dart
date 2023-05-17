import 'package:campus_guide_gui/screens/calendar.dart';
import 'package:campus_guide_gui/screens/home.dart';
import 'package:campus_guide_gui/screens/locations.dart';
import 'package:campus_guide_gui/screens/news.dart';
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
      routes: {
        '/': (context) => const Home(title: 'Campus Guide'),
        '/calendar': (context) => const Calendar(),
        '/news': (context) => const News(),
        '/locations': (context) => const Locations(),
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
