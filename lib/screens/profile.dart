import 'package:campus_guide_gui/widgets/h1.dart';
import 'package:campus_guide_gui/widgets/h3.dart';
import 'package:campus_guide_gui/widgets/image_upload.dart';
import 'package:flutter/material.dart';

import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/studentId.dart';
import '../widgets/h2.dart';

class UserProfile extends StatelessWidget {
  UserProfile({Key? key}) : super(key: key);

  final String firstName = "Pascal";
  final String lastName = "Block";
  final String userName = "pascalblock";
  final String password = "123456";
  final String degree = "Maser";
  final int currentSemester = 3;
  final int matriculationNumber = 123456;
  final DateTime startSemesterTicket = DateTime(2023, 09, 30);
  final DateTime endSemesterTicket = DateTime(2022, 10, 01);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _TopPortion(
                userName: userName,
                password: password,
              ),
              H1(text: '$firstName $lastName'),
              H3(text: '@$userName'),
              const SizedBox(height: 16),
              _ProfileInfoRow(
                matriculationNumber: matriculationNumber,
                degree: degree,
                currentSemester: currentSemester,
              ),
              const SizedBox(height: 16),
              StudentID(
                  firstName: firstName,
                  lastName: lastName,
                  matriculationNumber: matriculationNumber,
                  startSemesterTicket: startSemesterTicket,
                  endSemesterTicket: endSemesterTicket)
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoItem {
  final String title;
  late String value;

  ProfileInfoItem(this.title, this.value);
}

class _ProfileInfoRow extends StatelessWidget {
  _ProfileInfoRow(
      {Key? key,
      required this.matriculationNumber,
      required this.degree,
      required this.currentSemester})
      : super(key: key);

  final int matriculationNumber;
  final String degree;
  final int currentSemester;
  final List<ProfileInfoItem> _items = [
    ProfileInfoItem("Matrikelnummer", ''),
    ProfileInfoItem("Abschluss", ''),
    ProfileInfoItem("Semester", '')
  ];

  @override
  Widget build(BuildContext context) {
    _items[0].value = '$matriculationNumber';
    _items[1].value = degree;
    _items[2].value = '$currentSemester';

    return Container(
      height: 80,
      constraints: const BoxConstraints(maxWidth: 450),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: _items
            .map((item) => Expanded(
                    child: Row(
                  children: [
                    if (_items.indexOf(item) != 0) const VerticalDivider(),
                    Expanded(child: _singleItem(context, item)),
                  ],
                )))
            .toList(),
      ),
    );
  }

  Widget _singleItem(BuildContext context, ProfileInfoItem item) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              item.value,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          Text(
            item.title,
            style: Theme.of(context).textTheme.bodySmall,
          )
        ],
      );
}

class _TopPortion extends StatelessWidget {
  _TopPortion({Key? key, required this.userName, required this.password})
      : super(key: key);

  String userImage = "";
  final String userName;
  final String password;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 50),
          decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              )),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
              width: 150,
              height: 150,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  userImage.isEmpty
                      ? const CircleAvatar(
                          child: Icon(
                            Icons.person,
                            size: 65,
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(userImage)),
                          ),
                        ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: IconButton.filled(
                          onPressed: () => _dialogBuilder(context),
                          icon: const Icon(Icons.edit))),
                ],
              )),
        ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) async {
    _usernameController.text = userName;
    _passwordController.text = password;

    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SizedBox(
          height: 700,
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const H2(text: 'Profil bearbeiten'),
                  const ImageUpload(),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Benutzername',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Passwort',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Abbrechen')),
                      const SizedBox(width: 8),
                      FilledButton(
                        child: const Text('Speichern'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8)
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
