import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ap/homepage/bloc/cubit.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/bloc/state.dart';
import 'package:weather_ap/homepage/prsentation/current/home.dart';
import 'package:weather_ap/homepage/prsentation/current/widget/shimmer.dart';
import 'package:weather_ap/homepage/repo/repo.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late WeatherCubit _cubit;
  late Future<LocationDetails> _locationDetails;

  @override
  void initState() {
    super.initState();
    _locationDetails = LocationService().getCurrentLocation();
    _cubit = WeatherCubit(WeatherRepository());
    _locationDetails.then((location) {
      _cubit.fetchBothData(location.latitude, location.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<WeatherCubit, WeatherState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is WeatherError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: BlocBuilder<WeatherCubit, WeatherState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is WeatherLoading) {
              return Center(child: ShimmerEffectHome());
            } else if (state is CombinedWeatherAndLocationData ) {
             Current weatherData = state.weatherData;
             LocationModel location = state.locationData;
              return CurrentData(current: weatherData, location: location,);
            } else {
              return Center(child: ShimmerEffectHome());
            }
          },
        ),
      ),
    );
  }
}
