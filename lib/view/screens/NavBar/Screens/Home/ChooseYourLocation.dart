import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/ChooseYourLocationController.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Home/nearby_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/ApiConstant.dart';

class ChooseyourlocationScreen extends GetView<Chooseyourlocationcontroller> {
  const ChooseyourlocationScreen({super.key});
  static const routeName = "ChooseyourlocationScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your location",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.kTextBlack)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Image.asset(Assets.location),
            ),
            GooglePlaceAutoCompleteTextField(
              textEditingController: controller.googlemapfieldController,
              googleAPIKey: ApiConstants.googleAPIKey,
              inputDecoration: InputDecoration(
                  prefixIcon: Icon(Icons.location_on_outlined),
                  hintText: "Search event in...",
                  fillColor: Colors.transparent),
              boxDecoration: BoxDecoration(
                color: AppColors.kTextfieldColor,
                borderRadius: BorderRadius.circular(10),
              ),
              debounceTime: 800,
              isLatLngRequired: true,
              getPlaceDetailWithLatLng: (Prediction prediction) {
                controller.lat = prediction.lat;
                controller.lng = prediction.lng;
              },
              itemClick: (Prediction prediction) {
                String description = prediction.description ?? "";

                // Set the text in the controller
                controller.googlemapfieldController.text = description;

                // Ensure the cursor is within the valid range
                int cursorPosition = description.length;

                // Set the cursor to the end of the text
                controller.googlemapfieldController.selection =
                    TextSelection.fromPosition(
                  TextPosition(offset: cursorPosition),
                );
                Get.toNamed(NearbyEvents.routeName);
              },
              itemBuilder: (context, index, Prediction prediction) {
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppColors.kTextfieldColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColors.kIconColor,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                          child: Text(prediction.description ?? "",
                              style: TextStyle(color: Colors.black))),
                    ],
                  ),
                );
              },
              seperatedBuilder: Divider(),
              isCrossBtnShown: true,
              containerHorizontalPadding: 10,
              placeType: PlaceType.geocode,
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
                "Let’s find your next event! Search for a location to get started or enable your current location below.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.kTextBlack)),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: OutlinedButton(
                onPressed: () {
                  Get.toNamed(NearbyEvents.routeName);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(
                      width: 1, color: AppColors.kBerkeleyBlue),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_searching_outlined,
                      color: AppColors.kIconColor,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('Use my current location',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: AppColors.kBluedarkShade)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
