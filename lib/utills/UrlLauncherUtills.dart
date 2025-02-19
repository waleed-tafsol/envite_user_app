import 'package:url_launcher/url_launcher.dart';

Future<void> launchGoogleMaps(double latitude, double longitude) async {
    final String googleMapsUrl = 'https://www.google.com/maps/search/?q=$latitude,$longitude';
    final String appleMapsUrl = 'https://maps.apple.com/?q=$latitude,$longitude'; // For iOS compatibility

    if (await canLaunchUrl(Uri.parse( googleMapsUrl))) {
      await launchUrl(Uri.parse( googleMapsUrl));
    } else if (await canLaunchUrl(Uri.parse( googleMapsUrl))) {
      await launchUrl( Uri.parse( appleMapsUrl)); // Fallback to Apple Maps if on iOS
    } else {
      throw 'Could not launch Google Maps or Apple Maps';
    }
  }