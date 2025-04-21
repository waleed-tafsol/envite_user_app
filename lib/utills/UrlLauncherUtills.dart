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
    } else {
      CustomSnackbar.showError("Error", "cannot launch GoogleMaps");
    }
  } else {
    if (await canLaunchUrl(Uri.parse(appleMapsUrl))) {
      await launchUrl(Uri.parse(appleMapsUrl));
    } else {
      CustomSnackbar.showError("Error", "cannot launch AppleMaps");
    }
  }
}

String validateAndCorrectUrl(String url) {
  // Check if the URL starts with "http://" or "https://"
  if (!url.startsWith('http://') && !url.startsWith('https://')) {
    // If not, prepend 'https://' (You can choose 'http://' or 'https://')
    url = 'https://$url';
  }

  // Validate the URL
  Uri? uri = Uri.tryParse(url);
  if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
    // If the URL is still invalid, you could throw an error or handle it in another way.
    throw 'Invalid URL: $url';
  }

  return url;
}

Future<void> launchUrlWeb(String urlData) async {
  final Uri url = Uri.parse(urlData);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    CustomSnackbar.showError("Error", 'incorrect link');
  }
}
