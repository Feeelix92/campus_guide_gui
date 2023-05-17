import 'package:flutter/material.dart';
import '../widgets/h2.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nachrichten'),
      ),
      body: const Center(
        child: Column(
          children: [
            H2(text: 'Nachrichten Page'),
            Placeholder(),
          ],
        ),
      ),
    );
  }
}
