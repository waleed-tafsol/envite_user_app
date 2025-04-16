import 'dart:convert';

import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/event_model.dart';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import '../services/Location_services.dart';
import '../utills/MarkerUtills.dart';

class ChooseYourLocationController extends GetxController {
  final Rxn<GoogleMapController> mapController = Rxn<GoogleMapController>();
  RxSet<Marker> markers = <Marker>{}.obs;
  List<EventModel> nearByEvent = <EventModel>[];
  final TextEditingController searchController = TextEditingController();

  // final defaultPosition = const CameraPosition(
  //   target: LatLng(37.42796133580664, -122.085749655962),
  //   zoom: 14.4746,
  // );

  @override
  void onInit() {
    super.onInit();
    determinePosition();
  }

  void setMapController(GoogleMapController controller) {
    mapController.value = controller;
  }

  Future<void> determinePosition() async {
    final position = await LocationService.getCurrentPosition();
    if (position == null) {
      CustomSnackbar.showError(
          "Location Error", "Failed to get current location.");
      return;
    }

    final LatLng latLng = LatLng(position.latitude, position.longitude);

    ColoredPrint.green(
        "Current Location: ${position.latitude}, ${position.longitude}");
    await getNearByEvents(latLng);
  }

  Future<void> getNearByEvents(LatLng latlang) async {
    // isLoading.value = true;
    _moveCameraTo(latlang);
    try {
      final response = await http.post(Uri.parse(ApiConstants.getAllEvents),
          body: jsonEncode({
            "latitude": latlang.latitude.toString(),
            "longitude": latlang.longitude.toString(),
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        nearByEvent = (jsonResponse["data"] as List)
            .map((event) => EventModel.fromJson(event))
            .toList();
        final markerSet = await MarkerUtils.generateMarkers(
          events: nearByEvent,
          origin: LatLng(latlang.latitude, latlang.longitude),
        );
        markers.value = markerSet;
      } else {
        throw 'Failed to get Near by Event';
      }
    } catch (e) {
      CustomSnackbar.showError('Error', e.toString());
    } finally {
      // isLoading.value = false;
    }
  }

  Future<void> updateLocation(LatLng latLang) async {
    final Marker updatedMarker = markers.last.copyWith(positionParam: latLang);
    markers.remove(markers.last);
    markers.add(updatedMarker);
    markers.refresh();
    await _moveCameraTo(latLang);
    getNearByEvents(latLang);
  }

  Future<void> _moveCameraTo(LatLng latLang) async {
    await mapController.value?.animateCamera(
      CameraUpdate.newLatLngZoom(latLang, 16),
    );
  }
}
