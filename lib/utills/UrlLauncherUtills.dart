import 'dart:io';

import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchMaps(double latitude, double longitude) async {
  final String googleMapsUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  final String appleMapsUrl = 'https://maps.apple.com/?q=$latitude,$longitude';


if (Platform.isAndroid) {
  if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    await launchUrl(Uri.parse(googleMapsUrl));
  }else{
    CustomSnackbar.showError("Error", "cannot launch GoogleMaps");
  }
}else{
if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
  await launchUrl(Uri.parse(appleMapsUrl));
}else{
    CustomSnackbar.showError("Error", "cannot launch AppleMaps");
  }
}
  
}

Future<void> launchUrlUtill(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    CustomSnackbar.showError("Error", 'incorrect link');
  }
}
