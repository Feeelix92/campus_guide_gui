import 'package:campus_guide_gui/data/constants.dart';
import 'package:campus_guide_gui/widgets/customAppBar.dart';
import 'package:campus_guide_gui/widgets/h1.dart';
import 'package:flutter/material.dart';

import '../widgets/appDrawer.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            H1(text: 'Willkommen auf der Hauptseite!')
          ],
        ),
      ),
    );
  }
}