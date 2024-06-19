import 'package:weather_ap/forecast/model/day2_model.dart';
import 'package:weather_ap/forecast/model/day3_model.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/bloc/state.dart';

abstract class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final LocationModel location;
  final Day today;
  final Current current;
  ForecastLoaded(this.location, this.today, this.current);
}

class ForecastTommorowLoaded extends ForecastState {
  final LocationModel location;
  final Day2 today;
  final Current current;
  ForecastTommorowLoaded(this.location, this.today, this.current);
}

class ForecastnextLoaded extends ForecastState {
  final LocationModel location;
  final Day day1;
  final Day2 day2;
  final Day3 day3;
  final Current current;
  ForecastnextLoaded(
      this.location, this.day1, this.day2, this.day3, this.current);
}

class ForecastError extends ForecastState {
  final String message;

  ForecastError(this.message);
}
