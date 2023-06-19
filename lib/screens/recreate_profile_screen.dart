import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../core/app_router.gr.dart';
import '../core/profile.dart';
import '../widgets/h1.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';

@RoutePage()
class RecreateProfileScreen extends StatelessWidget {
  RecreateProfileScreen({Key? key}) : super(key: key);

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 3,
            child: Column(
              children: [
                const H1(text: 'Legen Sie ein neues Profil an.'),
                const SizedBox(height: 20),
                TextField(
                  controller: _firstnameController,
                  decoration: const InputDecoration(
                    labelText: 'Vorname',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _lastnameController,
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
                ElevatedButton(
                    onPressed: (){
                      String firstname = _firstnameController.text;
                      String lastname = _lastnameController.text;
                      String email = _emailController.text;
                      String phone = _phoneController.text;

                      if(
                      firstname.isNotEmpty &&
                          lastname.isNotEmpty &&
                          email.isNotEmpty &&
                          phone.isNotEmpty
                      ) {
                        profile.createProfile(firstname, lastname, email, phone);
                        AutoRouter.of(context).push( const UserProfileRoute());
                      } else{
                        showDialog(
                          context: context,
                          builder: (context) =>
                              AlertDialog(
                                title: const Text('Fehler'),
                                content: const Text(
                                    'Bitte füllen Sie alle Felder aus.'),
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
                    child: const Text('Anlegen')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
