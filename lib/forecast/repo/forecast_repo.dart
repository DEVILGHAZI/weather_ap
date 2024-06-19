
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_ap/forecast/model/day2_model.dart';
import 'package:weather_ap/forecast/model/day3_model.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/helper/api_keys.dart';
import 'package:weather_ap/homepage/bloc/model.dart';


class ForecastRepo {
  Future<Day?> fetchToday(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=$currentApiKey&q=${latitude},$longitude&days=10&aqi=yes&alerts=yes'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
          final Day weatherData = Day.fromJson(jsonResponse['forecast']);
          return weatherData;
        
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      print("Error fetching today's weather: $error");
      return null;
    }
  }
  Future<Day2?> fetchTomorrow(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=$currentApiKey&q=${latitude},$longitude&days=10&aqi=yes&alerts=yes'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
          final Day2 weatherData = Day2.fromJson(jsonResponse['forecast']);
          return weatherData;
        
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      print("Error fetching today's weather: $error");
      return null;
    }
  }
  Future<Day3?> fetchnexttonextDay(double latitude, double longitude) async {
    try {
      final response = await http.get(Uri.parse('https://api.weatherapi.com/v1/forecast.json?key=$currentApiKey&q=${latitude},$longitude&days=10&aqi=yes&alerts=yes'));
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
          final Day3 weatherData = Day3.fromJson(jsonResponse['forecast']);
          return weatherData;
        
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      print("Error fetching today's weather: $error");
      return null;
    }
  }
  Future<Current?> fetcCurrent(double latitude, double longitude) async {
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
        // Check if 'location' key exists in the response.
        if (jsonResponse.containsKey('location')) {
          final LocationModel weatherData = LocationModel.fromJson(jsonResponse['location']);
          return weatherData;
        } else {
          print("Weather data does not contain location details.");
          return null; // Return null if required data is missing.
        }
      } else {
        throw Exception('Failed to load weather data');
      }
    } catch (error) {
      print("Error getting location: $error");
      return null;
    }
  }
}
