import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/h1.dart';
import '../widgets/h2.dart';

@RoutePage()
class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: [
            H1(text: 'Location Page'),
            Expanded(
              child: FlutterMap(
                  options: MapOptions(
                      zoom: 13,
                      maxZoom: 18,
                      keepAlive: true,
                      center: LatLng(50.33739, 8.75591)),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.easy-ticket.map',
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
