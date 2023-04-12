import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MapApp());
}

class MapApp extends StatelessWidget {
  const MapApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapViewScreen(),
    );
  }
}

class MapViewScreen extends StatefulWidget {
  const MapViewScreen({Key? key}) : super(key: key);

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {

  Position? currentLocation;

  void listenToLatestLocation() {
    Geolocator.getPositionStream(locationSettings: LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 5,
      timeLimit: Duration(seconds: 3)
    )).listen((event) {
      print(event);
    });
  }

  @override
  void initState() {
    super.initState();
    listenToLatestLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map View'),
      ),
      // body: GoogleMap(
      //   initialCameraPosition: CameraPosition(
      //       target: LatLng(23.793895737073488, 90.40448580672911)
      //   ),
      // ),
      body: Center(
        child: Text(currentLocation.toString()),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          /// location permission
          LocationPermission permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.always ||
              permission == LocationPermission.whileInUse) {
            /// current location fetch
            currentLocation = await Geolocator.getCurrentPosition();
            print(currentLocation);
            setState(() {});
          } else {
            print('Permission not allowed');
          }
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}










