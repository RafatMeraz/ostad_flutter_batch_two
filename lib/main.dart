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
  late GoogleMapController _googleMapController;
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
      body: GoogleMap(
        zoomControlsEnabled: true,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        // zoomGesturesEnabled: false,
        onTap: (LatLng position) {
          print(position);
        },
        mapType: MapType.normal,
        markers: <Marker>{
          Marker(
            markerId: MarkerId('vivasoft-office'),
            position: LatLng(23.793895737073488, 90.40448580672911),
            infoWindow: InfoWindow(title: 'Vivasoft Office'),
          ),
          Marker(
            markerId: MarkerId('sheraton-office'),
            position: LatLng(23.793124988898843, 90.40753081440926),
            infoWindow: InfoWindow(title: 'Sheraton Office'),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan)
          ),
          Marker(
            markerId: MarkerId('draggable'),
            position: LatLng(23.792507438554292, 90.40466889739038),
            infoWindow: InfoWindow(title: 'Draggable'),
            draggable: true,
            onDrag: (LatLng initLatLng) {
              // print(initLatLng);
            },
            onDragEnd: (LatLng onDragEnd) {
              print(onDragEnd);
            },
            onDragStart: (LatLng onDragStart) {
              print(onDragStart);
            }
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: CircleId('office-circle'),
            center: LatLng(23.793895737073488, 90.40448580672911),
            radius: 100,
            fillColor: Colors.purple.shade100,
            strokeWidth: 5,
            strokeColor: Colors.pink
          ),
          Circle(
            circleId: CircleId('sheraton-circle'),
            center: LatLng(23.793124988898843, 90.40753081440926),
            radius: 100,
            fillColor: Colors.amberAccent.shade100,
            strokeWidth: 5,
            strokeColor: Colors.pink
          ),
        },
        polygons: <Polygon> {
          Polygon(
            polygonId: PolygonId('skjfkdjs'),
            visible: true,
            fillColor: Colors.teal.shade100,
            strokeWidth: 2,
            strokeColor: Colors.teal,
            points: [
              LatLng(23.79270991440046, 90.40328957140447),
              LatLng(23.78989731258375, 90.40383607149124),
              LatLng(23.788868955187958, 90.40577866137028),
              LatLng(23.791346264162456, 90.4083301126957),
              LatLng(23.792745807813002, 90.40588025003672)
            ]
          ),
        },
        polylines: <Polyline> {
          Polyline(
            polylineId: PolylineId('asfd'),
            width: 4,
            color: Colors.blue,
            points: [
              LatLng(23.799256770175383, 90.4044134169817),
              LatLng(23.796286935662668, 90.40347699075939),
              LatLng(23.796893731044133, 90.40817420929669),
            ]
          )
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(23.793895737073488, 90.40448580672911),
          zoom: 16,
          bearing: 0,
          tilt: 0
        ),
        onMapCreated: (controller) {
          _googleMapController = controller;
        },
      ),
      // body: Center(
      //   child: Text(currentLocation.toString()),
      // ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     /// location permission
      //     LocationPermission permission = await Geolocator.requestPermission();
      //     if (permission == LocationPermission.always ||
      //         permission == LocationPermission.whileInUse) {
      //       /// current location fetch
      //       currentLocation = await Geolocator.getCurrentPosition();
      //       print(currentLocation);
      //       setState(() {});
      //     } else {
      //       print('Permission not allowed');
      //     }
      //   },
      //   child: const Icon(Icons.location_on),
      // ),
    );
  }
}










