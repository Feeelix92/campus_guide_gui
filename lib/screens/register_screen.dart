import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/widgets/customErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../core/app_router.gr.dart';
import '../core/auth.dart';
import '../data/constants.dart';
import '../widgets/h1.dart';

@RoutePage()
class RegistrationScreen extends StatefulWidget {

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _firstnameController = TextEditingController();

  final TextEditingController _lastnameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(builder: (context, authData, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(Constants.appName),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const H1(text: 'Registrieren Sie sich'),
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
                    controller: _firstnameController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                    ], // Only
                    decoration: const InputDecoration(
                      labelText: 'Vorname',
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _lastnameController,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z]")),
                    ], // Only
                    decoration: const InputDecoration(
                      labelText: 'Nachname',
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
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Telefonnummer',
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
                      String username = _usernameController.text;
                      String firstname = _firstnameController.text;
                      String lastname = _lastnameController.text;
                      String email = _emailController.text;
                      String phone = _phoneController.text;
                      String password = _passwordController.text;

                      // Beispiel-Validierung: Überprüfen, ob alle Felder nicht leer sind
                      if (username.isNotEmpty &&
                          firstname.isNotEmpty &&
                          lastname.isNotEmpty &&
                          email.isNotEmpty &&
                          phone.isNotEmpty &&
                          password.isNotEmpty) {
                        var successfulRegistration = await authData.register(username, firstname, lastname, email,
                            phone, password);
                        if (successfulRegistration && context.mounted) {
                          print('RegistrationScreen: Registrierung erfolgreich');
                          autoRouter.push(const HomeRoute());
                        } else {
                          print(
                          'RegistrationScreen: Registrierung nicht erfolgreich');
                           await customErrorDialog(context, 'Fehler', 'Username bereits vorhanden. Die Registrierung konnte nicht durchgeführt werden.'); // Funktion aufrufen und warten, bis der Dialog geschlossen ist
                        }
                      } else {
                        customErrorDialog(context, 'Fehler', 'Bitte füllen Sie alle Felder aus.');
                      }
                    },
                    child: const Text('Registrieren'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
