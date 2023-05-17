import 'package:campus_guide_gui/screens/calendar.dart';
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
        '/': (context) => const MyHomePage(title: 'Campus Guide'),
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Column(
          children: <Widget>[
            Text(
              'Herzlich Willkommen im Campus Guide!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(
              Icons.calendar_month_outlined,
            ),
            title: const Text('Kalender'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/calendar');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.chat,
            ),
            title: const Text('Nachrichten'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/news');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.location_city,
            ),
            title: const Text('Locations'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/locations');
            },
          ),
        ],
      ),
    );
  }
}