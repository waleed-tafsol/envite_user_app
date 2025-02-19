import 'package:url_launcher/url_launcher.dart';

Future<void> launchGoogleMaps(double latitude, double longitude) async {
  final String googleMapsUrl =
      'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
  final String appleMapsUrl = 'http://maps.apple.com/?ll=$latitude,$longitude';

  if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    await launchUrl(Uri.parse(googleMapsUrl));
  } else if (await canLaunchUrl(Uri.parse(googleMapsUrl))) {
    await launchUrl(
        Uri.parse(appleMapsUrl)); // Fallback to Apple Maps if on iOS
  } else {
    throw 'Could not launch Google Maps or Apple Maps';
  }
}
