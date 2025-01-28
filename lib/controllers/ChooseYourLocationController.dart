import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chooseyourlocationcontroller extends GetxController {
  final TextEditingController googlemapfieldController =
      TextEditingController();
  String? lat;
  String? lng;

  void autoCompleteSearch(String value) async {
    //   try {
    //     // EasyLoading.show(status: 'Searching');
    //     _googleMapsPlaces = GoogleMapsPlaces(
    //       apiKey: kGoogleApiKey,
    //       apiHeaders: await const GoogleApiHeaders().getHeaders(),
    //     );
    //     PlacesAutocompleteResponse result = await _googleMapsPlaces!.autocomplete(
    //         value,
    //         types: [],
    //         strictbounds: false,
    //         language: "en",
    //         components: [Component(Component.country, "AE")]);
    //     setPredictionList(result.predictions);
    //     EasyLoading.dismiss();
    //   } catch (e) {
    //     EasyLoading.showToast(e.toString());
    //   }
    // }
  }
}
