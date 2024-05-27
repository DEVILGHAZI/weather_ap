import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ap/logic/livelocation.dart';

class ForecastWeatherDataFetch {
  Map<String, dynamic> data = {};
  String location = "Location not available";
  String weatherData = "Weather data not fetched yet";
  String iconUrl = "";
  LocationService locationService = LocationService();

  // Getter methods for the variables
  String get area => _area;
  String get name => _name;

  // Private variables to store the values
  String _area = "";
  String _name = "";

  Future<void> fetchWeatherforecastData() async {
    weatherData = "Fetching weather data...";

    const apiKey =
        '054a1657816e4d4dbf465032241601'; // Replace with your actual API key

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Reverse geocoding to get locality based on latitude and longitude
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks.isNotEmpty ? placemarks[0] : Placemark();

      _area =
          place.locality ?? ''; // Use locality obtained from reverse geocoding
      _name = place.administrativeArea ?? '';
      final country = place.country ?? '';

      // Encode latitude and longitude for the API URL
      final latitude = position.latitude.toString();
      final longitude = position.longitude.toString();
      final encodedLatitude = Uri.encodeComponent(latitude);
      final encodedLongitude = Uri.encodeComponent(longitude);

      final apiUrl =
          'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=$encodedLatitude,$encodedLongitude&days=10&aqi=yes&alerts=yes';

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        weatherData = "Weather in $_area, $_name";
      } else {
        throw Exception(
            'Failed to load weather data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      weatherData = "Failed to fetch weather data: $e";
    }
  }
}
