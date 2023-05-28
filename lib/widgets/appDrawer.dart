import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/app_router.gr.dart';

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
              AutoRouter.of(context).push(const HomeRoute());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.calendar_month_outlined,
            ),
            title: const Text('Kalender'),
            onTap: () {
              AutoRouter.of(context).push(const CalendarRoute());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.chat,
            ),
            title: const Text('Nachrichten'),
            onTap: () {
              AutoRouter.of(context).push(const NewsRoute());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.location_on
            ),
            title: const Text('Locations'),
            onTap: () {
              AutoRouter.of(context).push(const LocationsRoute());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.login
            ),
            title: const Text('Anmelden'),
            onTap: () {
              AutoRouter.of(context).push(LoginRoute());
            },
          ),
        ],
      ),
    );
  }
}