import 'package:flutter/material.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override

  Widget build(BuildContext context) {
    var displayWidth = MediaQuery.of(context).size.width;
    if (displayWidth < 600) {
      return const Scaffold(
        appBar: CustomAppBar(),
        drawer: AppDrawer(),
        body: Center(
          child: Column(
            children: <Widget>[
              H1(
                text: 'Herzlich Willkommen im Campus Guide!',
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: CustomAppBar(),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              width: 250.0,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    leading: const Icon(
                      Icons.home,
                    ),
                    title: const Text('Home'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/');
                    },
                  ),
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
                        Icons.location_on
                    ),
                    title: const Text('Locations'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, '/locations');
                    },
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            child: SizedBox(
              width: displayWidth-250.0,
              child: Column(
                children: <Widget>[
                  H1(
                    text: 'Herzlich Willkommen im Campus Guide!',
                  ),
                ],
              ),
            ),
          ),
    ])
      );
    }
  }
}


