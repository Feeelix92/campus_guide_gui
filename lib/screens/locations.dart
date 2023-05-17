import 'package:flutter/material.dart';
import '../widgets/h2.dart';

class Locations extends StatelessWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: const Center(
        child: Column(
          children: [
            H2(text: 'Locations Page'),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
