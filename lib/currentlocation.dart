import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class CurrentLocatioin extends StatefulWidget {
  const CurrentLocatioin({super.key});

  @override
  State<CurrentLocatioin> createState() => _CurrentLocatioinState();
}

class _CurrentLocatioinState extends State<CurrentLocatioin> {
  var locatioinMessage = "";

  void getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    var lastPostion = await Geolocator.getLastKnownPosition();
    print(lastPostion);
    var Lat = position.latitude;
    var Long = position.longitude;
    setState(() {
      locatioinMessage = "Latitude : $Lat , Longitude : $Long ";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Current Location'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on,
                size: 46.0,
                color: Colors.blue,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Get User Location',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto'),
              ),
              const SizedBox(
                height: 20,
              ),
              Text("Position : $locatioinMessage"),
              ElevatedButton(
                  onPressed: () {
                    getCurrentLocation();
                  },
                  child: const Text(
                    'Get Current Location',
                    style: TextStyle(color: Colors.blue),
                  )),
            ]),
      ),
    );
  }
}
