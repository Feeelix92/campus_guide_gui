import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';
import '../widgets/h2.dart';

@RoutePage()
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            H1(text: 'Kalender Page'),
          ],
        ),
      ),
    );
  }
}


