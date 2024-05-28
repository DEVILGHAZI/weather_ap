import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_ap/location/model.dart';

class LocationService {
  Future<LocationDetails> getCurrentLocation() async {
  bool locationPermissionGranted =
      await Geolocator.isLocationServiceEnabled();
  if (!locationPermissionGranted) {
    return LocationDetails(
      latitude: 28.7041, // Example coordinates for Delhi
      longitude: 77.1025,
      locality: "Delhi",
      administrativeArea: "Delhi",
      country: "India",
    );
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

    return LocationDetails(
      latitude: position.latitude,
      longitude: position.longitude,
      locality: place.locality?? "",
      administrativeArea: place.administrativeArea?? "",
      country: place.country?? "",
    );
  } catch (e) {
    print("Error getting current location: $e");
    return LocationDetails(
      latitude: 0, // Default values in case of error
      longitude: 0,
      locality: "",
      administrativeArea: "",
      country: "",
    );
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
