import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';
import '../widgets/appDrawer.dart';
import '../widgets/customAppBar.dart';
import '../widgets/example_popup.dart';

@RoutePage()
class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late final List<Marker> _markers;

  /// Used to trigger showing/hiding of popups.
  final PopupController _popupLayerController = PopupController();
  @override
  void initState() {
    super.initState();
    _markers = [
      LatLng(50.33760, 8.75590),
      LatLng(50.33740, 8.75550),
      LatLng(50.33730, 8.75500),
    ]
        .map(
          (markerPosition) => Marker(
        point: markerPosition,
        width: 40,
        height: 40,
        builder: (_) => Icon(Icons.location_on, size: 40, color: Theme.of(context).colorScheme.primary),
        anchorPos: AnchorPos.align(AnchorAlign.top),
        rotateAlignment: AnchorAlign.top.rotationAlignment,
      ),
    )
        .toList();
  }

  @override
  void dispose() {
    _popupLayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: FlutterMap(
                  options: MapOptions(
                      zoom: 18,
                      maxZoom: 18,
                      keepAlive: true,
                      center: LatLng(50.33739, 8.75591)),
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.easy-ticket.map',
                    ),
                    PopupMarkerLayer(
                      options: PopupMarkerLayerOptions(
                        popupController: _popupLayerController,
                        markers: _markers,
                        popupDisplayOptions: PopupDisplayOptions(
                          builder: (BuildContext context, Marker marker) =>
                              ExamplePopup(marker),
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
