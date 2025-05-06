import 'package:event_planner_light/services/customPrint.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future<Position> getCurrentLocation() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return _defaultPosition();
      }

      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Return default position if permission is denied
          return _defaultPosition();
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are permanently denied, return default position
        return _defaultPosition();
      }

      // Get the current position
      return await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
          distanceFilter: 10,
        ),
      );
    } catch (e) {
      // Log the error and return default position
      ColoredPrint.red("Error fetching location: $e");
      return _defaultPosition();
    }
  }

  static Future<String> getCurrentAddress() async {
    try {
      Position position = await getCurrentLocation();
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        return '${place.street}, ${place.locality}';
      } else {
        return 'No address found.';
      }
    } catch (e) {
      ColoredPrint.red('Failed to get address: $e');
      return 'Failed to get address: $e';
    }
  }

  /// Default position with latitude and longitude as 0.0
  static Position _defaultPosition() {
    return Position(
      altitudeAccuracy: 0.0,
      headingAccuracy: 0.0,
      latitude: 0.0,
      longitude: 0.0,
      timestamp: DateTime.now(),
      accuracy: 0.0,
      altitude: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
  }
}
