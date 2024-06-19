import 'package:flutter/material.dart';
import 'package:weather_ap/logic/more/model.dart';
import 'package:weather_ap/logic/more/box.dart';
import 'dart:async';
import 'package:weather_ap/logic/Forecast/forecastlogic.dart';
import 'package:intl/intl.dart';

class Hour extends StatelessWidget {
  Map<String, dynamic> weather = {};
  ForecastWeatherDataFetch forecst = ForecastWeatherDataFetch();

  Hour({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> hourlyForecastData =
        fetchHourlyForecastData(); // Fetching next 24 hours data
    return Scaffold(
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
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rampur',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '19° | Mostly clear',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  for (var data in hourlyForecastData)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoxWidget3(
                          day: data['day'],
                          time: data['time'],
                          iconUrl: data['iconUrl'],
                          text: data['text'],
                          temp: data['temp'],
                          feels: data['feels'], isday: 0,
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Map<String, dynamic>> fetchHourlyForecastData() {
    DateTime now = DateTime.now();

    List<Map<String, dynamic>> hourlyData = [];

    for (int i = 0; i < 24; i++) {
      DateTime forecastTime = now.add(Duration(hours: i));
      String formattedTime = DateFormat('hh:mm a').format(forecastTime);

      Map<String, dynamic> data = {
        'day': DateFormat('EEE').format(forecastTime),
        'time': formattedTime,
        'iconUrl':'https://cdn.weatherapi.com/weather/64x64/day/113.png',
        'text': "Sunny",
        'temp': "19°",
        'feels': "20°",
      };
      hourlyData.add(data);
    }
    return hourlyData;
  }
}
