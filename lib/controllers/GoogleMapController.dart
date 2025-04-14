import 'dart:ui' as ui;

import 'package:event_planner_light/constants/assets.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseYourLocationController extends GetxController {
  final Rxn<GoogleMapController> mapController = Rxn<GoogleMapController>();
  final Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  RxSet<Marker> markers = <Marker>{}.obs;

  final defaultPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  void onInit() {
    super.onInit();
    _determinePosition();
  }

  void setMapController(GoogleMapController controller) {
    mapController.value = controller;
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("Location Error", "Location services are disabled.");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        Get.snackbar("Permission Denied", "Location permission not granted.");
        return;
      }
    }

    final position = await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );

    currentLocation.value = LatLng(position.latitude, position.longitude);
    _addNearbyMarkers(currentLocation.value!);
    _moveCameraTo(currentLocation.value!);
  }

  Future<void> _addNearbyMarkers(LatLng origin) async {
    final List<LatLng> nearbyPoints = [
      LatLng(origin.latitude + 0.001, origin.longitude + 0.001),
      LatLng(origin.latitude - 0.001, origin.longitude - 0.001),
      LatLng(origin.latitude + 0.0015, origin.longitude - 0.0012),
    ];

    final Set<Marker> newMarkers = {};

    final Uint8List markerIcon = await getBytesFromAsset(Assets.mapPin, 30);
    for (int i = 0; i < nearbyPoints.length; i++) {
      newMarkers.add(
        Marker(
          icon: BitmapDescriptor.bytes(markerIcon),
          markerId: MarkerId('marker_$i'),
          position: nearbyPoints[i],
          infoWindow: InfoWindow(
            title: 'Event ${i + 1}',
            snippet: "Legends ${i + 1}",
            onTap: () => print("button tapped"),
          ),
        ),
      );
    }

    // Add current location marker
    newMarkers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: origin,
        infoWindow: const InfoWindow(title: 'You are here'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );

    markers.value = newMarkers;
  }

  Future<void> _moveCameraTo(LatLng position) async {
    await mapController.value?.animateCamera(
      CameraUpdate.newLatLngZoom(position, 16),
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
