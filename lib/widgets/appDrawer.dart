import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/app_router.gr.dart';
import '../core/auth.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, authData, child) {
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
              AutoRouter.of(context).push(const LocationRoute());
            },
          ),
          if (authData.isAuth)...[
            ListTile(
              leading: const Icon(
                  Icons.logout
              ),
              title: const Text('Abmelden'),
              onTap: () {
                authData.logout();
                AutoRouter.of(context).push(const HomeRoute());
              },
            ),
          ]
          else...[
            ListTile(
              leading: const Icon(
                  Icons.login
              ),
              title: const Text('Anmelden'),
              onTap: () {
                AutoRouter.of(context).push(LoginRoute());
              },
            ),
          ]
        ],
      ),
    );
    });
  }
}