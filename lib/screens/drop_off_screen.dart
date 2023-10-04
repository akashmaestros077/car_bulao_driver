import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DropOff extends StatefulWidget {
  const DropOff({Key? key}) : super(key: key);

  @override
  State<DropOff> createState() => _DropOffState();
}

class _DropOffState extends State<DropOff> {
  late GoogleMapController mapController;
  LocationData? _currentLocationData;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    final currentLocation = await location.getLocation();
    setState(() {
      _currentLocationData = currentLocation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Drop Off',
          style: GoogleFonts.fahkwang(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xff28a745),
      ),
      body: _currentLocationData != null
          ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                  _currentLocationData!.latitude!,
                  _currentLocationData!.longitude!,
                ),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
              markers: {
                Marker(
                  markerId: MarkerId("currentLocation"),
                  position: LatLng(
                    _currentLocationData!.latitude!,
                    _currentLocationData!.longitude!,
                  ),
                ),
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
