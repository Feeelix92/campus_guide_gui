import 'package:flutter/material.dart';

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