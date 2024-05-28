import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/bloc/state.dart';
import 'package:weather_ap/homepage/repo/repo.dart';

class WeatherCubit extends Cubit<WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());
  Future<void> fetchBothData(double latitude, double longitude) async {
    emit(WeatherLoading());
    try {
      final Current? weatherData = await weatherRepository.fetchWeather(latitude, longitude);
      final LocationModel? locationData = await weatherRepository.getLocation(latitude, longitude);
      if (weatherData!= null && locationData!= null) {
        emit(CombinedWeatherAndLocationData(weatherData, locationData));
      } else {
        emit(WeatherError('Failed to load weather or location data'));
      }
    } catch (error) {
      emit(WeatherError('Failed to load weather or location data'));
    }
  }
}
