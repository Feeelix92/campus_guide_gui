import 'package:campus_guide_gui/widgets/h1.dart';
import 'package:flutter/material.dart';

import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/studentId.dart';
import '../widgets/h2.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  final String firstName = "Pascal";
  final String lastName = "Block";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              _TopPortion(),
              H1(text: '$firstName $lastName'),
              const SizedBox(height: 16),
              const _ProfileInfoRow(),
              const SizedBox(height: 16),
              StudentID()
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileInfoItem {
  final String title;
  final String value;
  const ProfileInfoItem(this.title, this.value);
}

class _ProfileInfoRow extends StatelessWidget {
  const _ProfileInfoRow({Key? key}) : super(key: key);

  final List<ProfileInfoItem> _items = const [
    ProfileInfoItem("Matrikelnummer", "123456"),
    ProfileInfoItem("Abschluss", "Master"),
    ProfileInfoItem("Semester", "3")
  ];

  @override
  Widget build(BuildContext context) {
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
  _TopPortion({Key? key}) : super(key: key);

  String userImage = "";
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
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
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 150,
            height: 150,
            child: Stack(
              fit: StackFit.expand,
              children: [
                userImage.isEmpty ?
                const CircleAvatar(
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
                        image: NetworkImage(
                            userImage
                        )
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton.filled(
                    onPressed: () => _dialogBuilder(context),
                    icon: const Icon(Icons.edit)
                  )
                ),
              ],
            )
            ),
          ),
      ],
    );
  }

  Future<void> _dialogBuilder(BuildContext context) async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const H2(text: 'Profil bearbeiten'),
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
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Passwort wiederholen',
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Abbrechen')
                      ),
                      const SizedBox(width: 10),
                      FilledButton(
                        child: const Text('Speichern'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}