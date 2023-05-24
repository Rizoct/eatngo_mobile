// ignore_for_file: prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map_tool;

LatLng initialLocation = LatLng(-7.933283, 112.660648);
bool isInArea = false;

//test
String lokasi = "";
String alamat = "";

List<LatLng> polygonPoints = [
  LatLng(-7.933264, 112.660046),
  LatLng(-7.933490, 112.660087),
  LatLng(-7.933502, 112.660499),
  LatLng(-7.933269, 112.660612)
];

class MapLocationScreen extends StatefulWidget {
  const MapLocationScreen({super.key});

  @override
  State<MapLocationScreen> createState() => _MapLocationScreenState();
}

class _MapLocationScreenState extends State<MapLocationScreen> {
  late GoogleMapController _googleMapController;
  void CheckUpdatedLocation(LatLng pointLatLng) {
    List<map_tool.LatLng> convatedPolygonPoints = polygonPoints
        .map((point) => map_tool.LatLng(point.latitude, point.longitude))
        .toList();
    setState(() {
      if (isInArea = map_tool.PolygonUtil.containsLocation(
          map_tool.LatLng(pointLatLng.latitude, pointLatLng.longitude),
          convatedPolygonPoints,
          false)) {
        lokasi = 'Taman BBPPMPV BOE MALANG';
        alamat = 'Arjosari, Kota Malang, Jawa Timur';
      } else {
        alamat = 'Diluar BBPPMPV BOE MALANG';
        lokasi = 'Diluar BBPPMPV BOE MALANG';
      }
    });
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    // ignore: avoid_print
    print('Dispose used');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('<nama resto> Location')),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _googleMapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: initialLocation,
              zoom: 19,
            ),
            markers: {
              Marker(
                  markerId: MarkerId('demo'),
                  position: initialLocation,
                  draggable: true,
                  onDragEnd: (updatedLatLng) {
                    CheckUpdatedLocation(updatedLatLng);
                  })
            },
            polygons: {
              Polygon(
                  polygonId: PolygonId("1"),
                  points: polygonPoints,
                  fillColor: Color(0xFF006491).withOpacity(0.2),
                  strokeWidth: 2,
                  strokeColor: Colors.grey),
            },
          ),
        ],
      ),
    );
  }
}
