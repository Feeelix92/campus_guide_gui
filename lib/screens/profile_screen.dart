import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/widgets/h1.dart';
import 'package:campus_guide_gui/widgets/h3.dart';
import 'package:campus_guide_gui/widgets/image_upload.dart';
import 'package:flutter/material.dart';
import '../core/profile.dart';
import '../model/profile_data.dart';
import '../widgets/studentId.dart';
import '../widgets/h2.dart';

import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';

@RoutePage()
class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  late Future<ProfileData?> profileDataFuture;

  @override
  void initState() {
    super.initState();
    final profile = Profile();
    profileDataFuture = profile.getProfileData();
  }

  final String firstName = "Pascal";
  final String lastName = "Block";
  final String userName = "pascalblock";
  final String password = "123456";
  final String degree = "Master";
  final int currentSemester = 3;
  final int matriculationNumber = 123456;
  final DateTime startSemesterTicket = DateTime(2023, 09, 30);
  final DateTime endSemesterTicket = DateTime(2022, 10, 01);

  /*
  Future<void> createProfileHandler() async {
    final profile = Profile();
    //await profile.createProfile(firstName);
    //await profile.getProfileData();
  }
   */

  void _getUpdatedProfileDataHandler() {
    final profile = Profile();
    Timer(const Duration(milliseconds: 200), () {
      setState(() {
        profileDataFuture = profile.getProfileData();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Center(
            child: FutureBuilder<ProfileData?>(
          future: profileDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              var profileData = snapshot.data!;
              return Column(
                children: [
                  _TopPortion(
                      firstname: profileData.firstname!,
                      lastname: profileData.lastname!,
                      phone: profileData.phone!,
                      email: profileData.email!,
                      loadNewData: _getUpdatedProfileDataHandler
                  ),
                  H1(text: '${profileData.firstname} ${profileData.lastname}'),
                  H3(text: '@${profileData.email}'),
                  const SizedBox(height: 16),
                  _ProfileInfoRow(
                    matriculationNumber: matriculationNumber,
                    degree: degree,
                    currentSemester: currentSemester,
                  ),
                  const SizedBox(height: 16),
                  StudentID(
                      firstName: profileData.firstname!,
                      lastName: profileData.lastname!,
                      matriculationNumber: matriculationNumber,
                      startSemesterTicket: startSemesterTicket,
                      endSemesterTicket: endSemesterTicket)
                ],
              );
            } else {
              return const Text('Ein Fehler ist aufgetreten');
            }
          },
        )),
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
  _TopPortion(
      {Key? key,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.phone,
      required this.loadNewData})
      : super(key: key);

  String userImage = "";
  String firstname;
  String lastname;
  String email;
  String phone;

  final VoidCallback loadNewData;

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future<void> editProfileHandler(firstname, lastname, email, phone) async {
    final profile = Profile();
    await profile.editProfileData(firstname, lastname, email, phone);
  }

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
    _firstnameController.text = firstname;
    _lastnameController.text = lastname;
    _emailController.text = email;
    _phoneController.text = phone;

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
                    controller: _firstnameController,
                    decoration: const InputDecoration(
                      labelText: 'Vorname',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _lastnameController,
                    decoration: const InputDecoration(
                      labelText: 'Nachname',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'E-Mail',
                    ),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      labelText: 'Nachname',
                    ),
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
                        onPressed: () => {
                          firstname = _firstnameController.text,
                          lastname = _lastnameController.text,
                          email = _emailController.text,
                          phone = _phoneController.text,
                          ImageUpload.triggerFunction(),
                          firstname,
                          lastname,
                          email,
                          phone,
                          editProfileHandler(firstname, lastname, email, phone),
                          loadNewData(),
                          Navigator.pop(context)
                        },
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
