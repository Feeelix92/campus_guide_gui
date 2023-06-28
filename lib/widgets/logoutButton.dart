import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/app_router.gr.dart';
import '../core/auth.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({
    super.key, required Auth authData,
  }): _authData = authData;

  final Auth _authData;

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) =>
              AlertDialog(
                title: const Text('Abmelden'),
                content: const Text('Möchten Sie sich wirklich abmelden?'),
                actions: [
                  TextButton(onPressed: () {
                    AutoRouter.of(context).pop();
                  }, child: const Text('Abbrechen')),
                  TextButton(onPressed: () {
                    widget._authData.logout();
                    AutoRouter.of(context).pop();
                    AutoRouter.of(context).push(const HomeRoute());
                  }, child: const Text('Abmelden')),
                ],
              ),
          );
        },
        child: const Text('Abmelden'));
  }
}
