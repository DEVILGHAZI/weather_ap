import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ap/forecast/cubit/forecast_cubit.dart';
import 'package:weather_ap/forecast/cubit/forecast_state.dart';
import 'package:weather_ap/forecast/datewise/day1_widget.dart';
import 'package:weather_ap/forecast/datewise/day2_widget.dart';
import 'package:weather_ap/forecast/datewise/day3_widget.dart';
import 'package:weather_ap/forecast/datewise/day_shimmer.dart';
import 'package:weather_ap/forecast/datewise/days_forecast/nextday_forecast.dart';
import 'package:weather_ap/forecast/datewise/days_forecast/today_forecast.dart';
import 'package:weather_ap/forecast/datewise/days_forecast/tommorow_forecast.dart';
import 'package:weather_ap/forecast/model/day2_model.dart';
import 'package:weather_ap/forecast/model/day3_model.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/forecast/repo/forecast_repo.dart';
import 'package:weather_ap/forecast/today/today_home.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';

class DayHome extends StatefulWidget {
  const DayHome({super.key});

  @override
  _DayHomeState createState() => _DayHomeState();
}

class _DayHomeState extends State<DayHome> {
  late ForecastCubit _cubit;
  late Future<LocationDetails> _locationDetails;

  @override
  void initState() {
    super.initState();
    _locationDetails = LocationService().getCurrentLocation();
    _cubit = ForecastCubit(ForecastRepo());
    _locationDetails.then((location) {
      _cubit.fetchBothDay3(location.latitude, location.longitude);
    });
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ForecastCubit, ForecastState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is ForecastError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ForecastLoading) {
            return const Center(child: ShimmerDayEffectToday());
          } else if (state is ForecastnextLoaded) {
            return _buildHomeScreen(state.day1, state.day2, state.day3,
                state.current, state.location);
          } else {
            return const Center(child: ShimmerDayEffectToday());
          }
        },
      ),
    );
  }

  Widget _buildHomeScreen(Day today, Day2 tomorrow, Day3 nextToNext,
      Current current, LocationModel location) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.20, -0.98),
            end: Alignment(-0.2, 0.98),
            colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Now in ',
                  style: TextStyle(
                    fontSize: 20,
                    color: const Color.fromARGB(255, 162, 157, 157),
                  ),
                ),
                Text(
                  location.name,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  current.tempC.toString() + '°C | ' + current.condition.text,
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
                CachedNetworkImage(
                  imageUrl: 'https:' + current.condition.icon,
                  height: 40,
                  width: 40,
                )
              ],
            ),
            GestureDetector(
              child: Day1Widget(day: today),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodayforHome(
                      currentData: today,
                      location: location,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 5),
            GestureDetector(
              child: Day2Widget(day: tomorrow),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => TomorrowPage(
                            currentData: tomorrow,
                            location: location,
                          )),
                );
              },
            ),
            const SizedBox(height: 5),
            GestureDetector(
              child: Day3Widget(day: nextToNext),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NextDay(
                      currentData: nextToNext,
                      location: location,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
