import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../model/scandmodel.dart';

class MapScreen extends StatefulWidget {
  final ScanModel qr;
  const MapScreen({Key? key, required this.qr}) : super(key: key);
// const MapScreen({Key? key}) : super(key: key);
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  @override
  void initState() {
    // TODO: implement initState
    _kGooglePlex = CameraPosition(
      target: widget.qr.getLatLng,
      zoom: 14.4746,
    );
    _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: widget.qr.getLatLng,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);

    super.initState();
  }

  static late CameraPosition _kGooglePlex;

  static late CameraPosition _kLake;

  @override
  Widget build(BuildContext context) {

Set<Marker> markers = <Marker>{};
markers.add(Marker( markerId: MarkerId('geo-location'), position: widget.qr.getLatLng));  


    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _getLocation,
        label: const Text('To the lake!'),
        icon: const Icon(Icons.directions_boat),
      ),
    );
  }




  _getLocation() async {
    var location = new Location();
    try {
      final currentLocation = await location.getLocation();

      print('locationLatitude: ${currentLocation.latitude}');
      print('locationLongitude: ${currentLocation.longitude}');

      final currentPosition = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(currentLocation.latitude!, currentLocation.longitude!),
          tilt: 59.440717697143555,
          zoom: 19.151926040649414);
      final GoogleMapController controller = await _controller.future;
      await controller.animateCamera(CameraUpdate.newCameraPosition(currentPosition));
      setState(
          () {}); //rebuild the widget after getting the current location of the user
    } on Exception {
      print('Could not get location');
    }
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
