import 'package:weather_ap/homepage/bloc/model.dart';

abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final Current weatherData;

  WeatherLoaded(this.weatherData);
}

class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}

class Location extends WeatherState {}

class LocationLoading extends WeatherState {}

class LocationLoaded extends WeatherState {
  final LocationModel locatioData;

  LocationLoaded(this.locatioData);
}

class LocationError extends WeatherState {
  final String message;

  LocationError(this.message);
}
class CombinedWeatherAndLocationData extends WeatherState {
  final Current weatherData;
  final LocationModel locationData;

  CombinedWeatherAndLocationData(this.weatherData, this.locationData);
}
