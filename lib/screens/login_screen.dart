import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/core/app_router.gr.dart';
import 'package:campus_guide_gui/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../core/auth.dart';
import '../data/constants.dart';
import '../widgets/h1.dart';
import 'home_screen.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, authData, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.appName),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const H1(text: 'Login!'),
                const SizedBox(height: 20),
                TextField(
                  controller: _usernameController,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                  ], // Only
                  decoration: const InputDecoration(
                    labelText: 'Benutzername',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Passwort',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    final autoRouter = AutoRouter.of(context);
                    final showDialog = buildShowDialog(context);
                    String username = _usernameController.text;
                    String password = _passwordController.text;
                    // Beispiel-Validierung: Überprüfen, ob Benutzername und Passwort nicht leer sind
                    if (username.isNotEmpty && password.isNotEmpty) {
                      if (await authData.login(username, password)) {
                        print('LoginScreen: Authentifizierung erfolgreich');
                        autoRouter.push(const HomeRoute());
                      } else {
                        print(
                            'LoginScreen: Authentifizierung nicht erfolgreich');
                        showDialog;
                      }
                    }
                  },
                  child: const Text('Anmelden'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).push(RegistrationRoute());
                  },
                  child: const Text('Registrieren'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fehler'),
        content: const Text('Bitte füllen Sie alle Felder aus.'),
        actions: [
          TextButton(
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
