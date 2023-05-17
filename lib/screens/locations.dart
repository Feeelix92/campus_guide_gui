import 'package:flutter/material.dart';

class Locations extends StatelessWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Locations'),
      ),
      body: const Center(
        child: Text('Locations Page'),
      ),
    );
  }
}
