import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ap/forecast/cubit/forecast_cubit.dart';
import 'package:weather_ap/forecast/cubit/forecast_state.dart';
import 'package:weather_ap/forecast/datewise/day_home.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/forecast/presentation/horly_home.dart';
import 'package:weather_ap/forecast/repo/forecast_repo.dart';
import 'package:weather_ap/forecast/today/today_home.dart';
import 'package:weather_ap/forecast/today/today_shimmer.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';

class ForecastHome extends StatefulWidget {
  const ForecastHome({super.key});

  @override
  _ForecastHomeState createState() => _ForecastHomeState();
}

class _ForecastHomeState extends State<ForecastHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ForecastCubit _cubit1;
  late Future<LocationDetails> _locationDetails;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _locationDetails = LocationService().getCurrentLocation();
    _cubit1 = ForecastCubit(ForecastRepo());
    _locationDetails.then((location) {
      _cubit1.fetchBothData(location.latitude, location.longitude);
      setState(() {});
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_sunny_sharp,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Forecast',
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
                colors: [Color(0xFF2E335A), Color(0xFF1C1B31)],
              ),
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.sunny_snowing, color: Colors.white),
                text: 'Today',
              ),
              Tab(
                icon: Icon(Icons.cloudy_snowing, color: Colors.white),
                text: 'Future',
              ),
              Tab(
                icon: Icon(Icons.access_time, color: Colors.white),
                text: 'Hour',
              ),
            ],
          ),
        ),
        body: BlocBuilder<ForecastCubit, ForecastState>(
          bloc: _cubit1,
          builder: (context, state) {
            if (state is ForecastLoading) {
              return Center(child: ShimmerEffectToday());
            } else if (state is ForecastLoaded) {
              Day weatherData = state.today;
              LocationModel location = state.location;
              Current currentData = state.current;
              return TabBarView(
                controller: _tabController,
                children: [
                  TodayHome(
                    currentData: weatherData,
                    location: location,
                  ),
                  // Pass the same data to the "Future" tab
                  // Pass the same data to the "Hour" tab
                 // Hour(),
                  DayHome(),
                  HourlyHome(
                    hourlyWeather: weatherData,
                    location: location,
                    currentData: currentData,
                  ),
                ],
              );
            } else {
              return Center(child: ShimmerEffectToday());
            }
          },
        ),
      ),
    );
  }
}
