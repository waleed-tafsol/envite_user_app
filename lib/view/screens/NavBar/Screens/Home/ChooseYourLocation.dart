import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/GoogleMapController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widgets/custom_place_search_field.dart';

class ChooseYourLocationScreen extends StatelessWidget {
  const ChooseYourLocationScreen({super.key});
  static const routeName = "ChooseYourLocationScreen";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChooseYourLocationController());

    return Scaffold(
      appBar: AppBar(title: const Text("Choose Your Location")),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: Stack(
            children: [
              Obx(() {
                return GoogleMap(
                  mapType: MapType.normal,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  markers: controller.markers.toSet(),
                  initialCameraPosition:
                      CameraPosition(target: LatLng(0, 0), zoom: 16),
                  onMapCreated: controller.setMapController,
                );
              }),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 1.5.h),
                  child: SizedBox(
                    width: 60.w,
                    child: CustomPlaceSearchField(
                      onPlaceSelected: (name, coordinates) {
                        // print("Place selected: $name");
                        // print(
                        //     "Coordinates: ${coordinates.latitude}, ${coordinates.longitude}");
                        controller.updateLocation(LatLng(
                            coordinates.latitude, coordinates.longitude));

                        // Do whatever you want here!
                        // e.g. controller.getNearByEvents(coordinates);
                      },
                      suggestionColor: AppColors.kBlueLightShade,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.determinePosition();
                    },
                    icon: Icon(Icons.location_searching_outlined)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
