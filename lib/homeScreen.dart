import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Set<Marker> _marker = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(
      () {
        _marker.add(
          const Marker(
            markerId: MarkerId('ID-1'),
            infoWindow:
                InfoWindow(title: 'Nimap Infotech', snippet: 'A IT Company'),
            position: LatLng(18.9952463, 72.8245883),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            'Google Map',
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: Container(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              markers: _marker,
              initialCameraPosition: const CameraPosition(
                  target: LatLng(18.9952463, 72.8245883), zoom: 15),
            ),
          ),
        ),
      ),
    );
  }
}
