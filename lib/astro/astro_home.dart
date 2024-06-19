import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ap/astro/astro.dart';
import 'package:weather_ap/astro/astro_shimmer.dart';
import 'package:weather_ap/forecast/cubit/forecast_cubit.dart';
import 'package:weather_ap/forecast/cubit/forecast_state.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/forecast/repo/forecast_repo.dart';
import 'package:weather_ap/forecast/today/today_home.dart';
import 'package:weather_ap/forecast/today/today_shimmer.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';

class AstroHome extends StatefulWidget {
  const AstroHome({super.key});

  @override
  State<AstroHome> createState() => _AstroHomeState();
}

class _AstroHomeState extends State<AstroHome> {
   late ForecastCubit _cubit1;
  late Future<LocationDetails> _locationDetails;

  @override
  void initState() {
    super.initState();
    _locationDetails = LocationService().getCurrentLocation();
    _cubit1 = ForecastCubit(ForecastRepo());
    _locationDetails.then((location) {
      _cubit1.fetchBothData(location.latitude, location.longitude);
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.brightness_2,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Astro',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.20, -0.98),
              end: Alignment(-0.2, 0.98),
              colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
            ),
          ),
          child: BlocBuilder<ForecastCubit, ForecastState>(
          bloc: _cubit1,
          builder: (context, state) {
            if (state is ForecastLoading) {
              return Center(child: ShimmerEffectAstro());
            } else if (state is ForecastLoaded) {
              Day weatherData = state.today;
              LocationModel location = state.location;
              Current currentData = state.current;
              return AstroPage(location: location, data: weatherData, currentData: currentData,);      
            } else {
              return Center(child: ShimmerEffectAstro());
            }
          },
        ),
        ),
      ),
    );

  }
}