import 'package:event_planner_light/controllers/GoogleMapController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ChooseYourLocationScreen extends StatelessWidget {
  const ChooseYourLocationScreen({super.key});
  static const routeName = "ChooseYourLocationScreen";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseYourLocationController());

    return Scaffold(
      appBar: AppBar(title: const Text("Choose Your Location")),
      body: SafeArea(
        child: Obx(() {
          final currentLoc = controller.currentLocation.value;
          return GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: controller.markers.toSet(),
            initialCameraPosition: currentLoc != null
                ? CameraPosition(target: currentLoc, zoom: 16)
                : controller.defaultPosition,
            onMapCreated: controller.setMapController,
          );
        }),
      ),
    );
  }
}
