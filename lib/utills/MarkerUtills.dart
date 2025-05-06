import 'dart:ui' as ui;

import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/model/event_model.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/EventDetailScreen/events_detail_screen.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MarkerUtils {
  static Future<Set<Marker>> generateMarkers({
    required List<EventModel> events,
    required LatLng origin,
  }) async {
    final Set<Marker> newMarkers = {};
    final Uint8List markerIcon = await _getBytesFromAsset(Assets.mapPin, 80);

    for (final event in events) {
      newMarkers.add(
        Marker(
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(event.slug!),
          position: LatLng(
              event.location!.coordinates![1], event.location!.coordinates![0]),
          infoWindow: InfoWindow(
            title: event.name,
            snippet: event.description,
            onTap: () {
              Get.toNamed(EventsDetailScreen.routeName,
                  arguments: {"slug": event.slug});
            },
          ),
        ),
      );
    }

    newMarkers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: origin,
        infoWindow: const InfoWindow(title: 'You are here'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    );

    return newMarkers;
  }

  static Future<Uint8List> _getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
