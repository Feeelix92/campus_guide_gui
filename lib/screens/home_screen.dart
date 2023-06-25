import 'package:auto_route/auto_route.dart';
import 'package:campus_guide_gui/core/app_router.gr.dart';
import 'package:campus_guide_gui/widgets/customAppBar.dart';
import 'package:campus_guide_gui/widgets/customText.dart';
import 'package:campus_guide_gui/widgets/h1.dart';
import 'package:flutter/material.dart';

import '../widgets/appDrawer.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            H1(text: 'Willkommen auf der Hauptseite!'),
            CustomText(text: 'Hier können Sie sich durch die App navigieren.'),
            CustomText(text: 'Viel Spaß!'),
          ],
        ),
      ),
    );
  }
}