import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationService {
  Future<String> getCurrentLocation() async {
    bool locationPermissionGranted =
        await Geolocator.isLocationServiceEnabled();
    if (!locationPermissionGranted) {
      return "Delhi, Delhi, India";
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      return "${place.locality}, ${place.administrativeArea}, ${place.country}";
    } catch (e) {
      print("Error getting current location: $e");
      return "Error fetching location";
    }
  }

  Future<void> openGoogleMaps(double latitude, double longitude) async {
    String url =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";

    try {
      await launch(url);
    } catch (e) {
      print("Error launching Google Maps: $e");
      throw 'Could not launch Google Maps';
    }
  }
}
