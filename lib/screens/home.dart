import 'package:flutter/material.dart';
import '../model/login.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    postRequest('admin', 'admin123').then((value) => print(value));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            H1(
              text: 'Herzlich Willkommen im Campus Guide!',
            ),
          ],
        ),
      ),
    );
  }
}


