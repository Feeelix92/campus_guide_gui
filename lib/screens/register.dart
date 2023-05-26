import 'package:flutter/material.dart';

import '../data/constants.dart';
import '../widgets/h1.dart';
import 'home.dart';

class Registration extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Registration({super.key});

  @override
  Widget build(BuildContext context) {
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
              const H1(text: 'Registrieren Sie sich'),
              const SizedBox(height: 20),
              TextField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  labelText: 'Benutzername',
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'E-Mail',
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
                onPressed: () {
                  // Hier können Sie die Registrierungslogik implementieren
                  String username = _usernameController.text;
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // Beispiel-Validierung: Überprüfen, ob alle Felder nicht leer sind
                  if (username.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Home(),
                      ),
                    );
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Fehler'),
                        content: const Text('Bitte füllen Sie alle Felder aus.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Registrieren'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
