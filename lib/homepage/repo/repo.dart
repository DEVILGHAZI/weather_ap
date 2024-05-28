import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_ap/helper/api_keys.dart';
import 'package:weather_ap/homepage/bloc/model.dart'; // Adjust the import path according to your project structure

class WeatherRepository {
  Future<Current?> fetchWeather(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=$currentApiKey&q=${latitude},${longitude}&aqi=yes'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        final Current weatherData = Current.fromJson(jsonResponse['current']);
        return weatherData;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
  Future<LocationModel?> getLocation(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/current.json?key=$currentApiKey&q=${latitude},${longitude}&aqi=yes'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        final LocationModel weatherData = LocationModel.fromJson(jsonResponse['location']);
        return weatherData;
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      print(error);
      return null;
    }
  }
  
}
