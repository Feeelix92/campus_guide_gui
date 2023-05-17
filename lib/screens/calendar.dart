import 'package:flutter/material.dart';
import '../widgets/h2.dart';

class Calendar extends StatelessWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalender'),
      ),
      body: const Center(
        child: Column(
          children: [
            H2(text: 'Kalender Page'),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}


