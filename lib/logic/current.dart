import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:weather_ap/logic/livelocation.dart';

class WeatherDataFetch {
  Map<String, dynamic> data = {};
  String location = "Location not available";
  String weatherData = "Weather data not fetched yet";
  String iconUrl = "";
  LocationService locationService = LocationService();

  String get area => _area;
  String get name => _name;

  String _area = "";
  String _name = "";

  Future<void> fetchWeatherData() async {
    weatherData = "Fetching weather data...";
    const apiKey = '054a1657816e4d4dbf465032241601';
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks.isNotEmpty ? placemarks[0] : Placemark();

      _area = place.locality ?? '';
      _name = place.administrativeArea ?? '';

      var apiUrl =
          'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=${position.latitude},${position.longitude}&aqi=yes';

      var request = http.Request('GET', Uri.parse(apiUrl));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        data = json.decode(await response.stream.bytesToString());

        weatherData = "Weather in $_area, $_name";
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (e) {
      weatherData = "Failed to fetch weather data: $e";
    }
  }
}
