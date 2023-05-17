import 'package:flutter/material.dart';
import '../widgets/appDrawer.dart';
import '../widgets/h1.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: const AppDrawer(),
      body: const Center(
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
