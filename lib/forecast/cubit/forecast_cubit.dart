import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:weather_ap/forecast/cubit/forecast_state.dart';
import 'package:weather_ap/forecast/model/day1_model.dart';
import 'package:weather_ap/forecast/model/day2_model.dart';
import 'package:weather_ap/forecast/model/day3_model.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/forecast/repo/forecast_repo.dart';
import 'package:weather_ap/homepage/bloc/model.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastRepo forecastRepo;
  ForecastCubit(this.forecastRepo) : super(ForecastInitial());
  Future<void> fetchBothData(double latitude, double longitude) async {
    emit(ForecastLoading());
    try {
      final LocationModel? locationData = await forecastRepo.getLocation(latitude, longitude);
      final Current? currentData= await forecastRepo.fetcCurrent(latitude, longitude);
      final Day? weatherData = await forecastRepo.fetchToday(latitude, longitude);
      if (weatherData!= null && locationData!= null) {
        emit(ForecastLoaded(locationData, weatherData,currentData!));
      } else {
        emit(ForecastError('Failed to load weather or location data'));
      }
    } catch (error) {
      emit(ForecastError('Failed to load weather or location data'));
    }
  }

  Future<void> fetchBothDay3(double latitude, double longitude) async {
    emit(ForecastLoading());
    try {
      final LocationModel? locationData = await forecastRepo.getLocation(latitude, longitude);
      final Current? currentData= await forecastRepo.fetcCurrent(latitude, longitude);
      final Day2? weatherData2 = await forecastRepo.fetchTomorrow(latitude, longitude);
      final Day3? weatherData3 = await forecastRepo.fetchnexttonextDay(latitude, longitude);
      final Day? weatherData1 = await forecastRepo.fetchToday(latitude, longitude);
      if (weatherData1!= null && locationData!= null) {
        emit(ForecastnextLoaded(locationData, weatherData1, weatherData2!,weatherData3!,currentData!));
      } else {
        emit(ForecastError('Failed to load weather or location data'));
      }
    } catch (error) {
      emit(ForecastError('Failed to load weather or location data'));
    }
  }
}
