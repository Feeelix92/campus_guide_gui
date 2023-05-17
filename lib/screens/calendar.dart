import 'package:flutter/material.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender'),
      ),
      body: const Center(
        child: Text('Kalender Page'),
      ),
    );
  }
}


