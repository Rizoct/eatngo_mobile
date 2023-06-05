// ignore_for_file: prefer_const_constructors

import 'package:eatngo_thesis/screens_customer/tabs_restaurants/map_location.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

double latitude = -7.93004801009408;
double longitude = 112.65919560836002;
String query = "Balikon.id";

List<LatLng> polygonPoints = [
  LatLng(-7.933264, 112.660046),
  LatLng(-7.933490, 112.660087),
  LatLng(-7.933502, 112.660499),
  LatLng(-7.933269, 112.660612)
];

class LocationTab extends StatefulWidget {
  final String restoName;
  const LocationTab({super.key, required this.restoName});

  @override
  State<LocationTab> createState() => _LocationTabState();
}

class _LocationTabState extends State<LocationTab> {
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$query';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MapLocationScreen(
                        restoName: widget.restoName,
                      ),
                    ),
                  );
                },
                child: Text('Lihat lokasi')),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ))),
                onPressed: () async {
                  if (await canLaunchUrl(Uri.parse(googleUrl))) {
                    await launchUrl(Uri.parse(googleUrl));
                  } else {
                    throw 'Could not open the map.';
                  }
                },
                child: Text('Lihat lokasi di Google Map')),
          ),
        )
      ],
    ));
  }
}
