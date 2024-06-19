import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_ap/forecast/model/day1_model.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/prsentation/current/home.dart';
import 'package:weather_ap/logic/more/box.dart';

class HourlyHome extends StatelessWidget {
  final Day hourlyWeather;
  final LocationModel location;
  final Current currentData;
  HourlyHome({super.key, required this.hourlyWeather, required this.location, required this.currentData});

  List getHourlyData() {
    return [
      hourlyWeather.Hourly1,
      hourlyWeather.Hourly2,
      hourlyWeather.Hourly3,
      hourlyWeather.Hourly4,
      hourlyWeather.Hourly5,
      hourlyWeather.Hourly6,
      hourlyWeather.Hourly7,
      hourlyWeather.Hourly8,
      hourlyWeather.Hourly9,
      hourlyWeather.Hourly10,
      hourlyWeather.Hourly11,
      hourlyWeather.Hourly12,
      hourlyWeather.Hourly13,
      hourlyWeather.Hourly14,
      hourlyWeather.Hourly15,
      hourlyWeather.Hourly16,
      hourlyWeather.Hourly17,
      hourlyWeather.Hourly18,
      hourlyWeather.Hourly19,
      hourlyWeather.Hourly20,
      hourlyWeather.Hourly21,
      hourlyWeather.Hourly22,
      hourlyWeather.Hourly23,
      hourlyWeather.Hourly24
    ];
  }

  @override
  Widget build(BuildContext context) {
    var hourlyData = getHourlyData();

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
                  Text(
                    location.name,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${currentData.tempC}°C | ${currentData.condition.text}',
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                              currentData.isDay ? ' Day ' : ' Night ',
                              style: const TextStyle(
                                fontSize: 22,
                                color: Colors.white,
                              ),
                            ),
                      CachedNetworkImage(
                        imageUrl:
                            'http:'+ currentData.condition.icon,
                        height: 40,
                        width: 40,
                      ),
                     
                    ],
                  ),
                  for (var hourly in hourlyData)
                    BoxWidget3(
                      day: DateFormat('EEE').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              hourly.timeEpoch * 1000)),
                      time: hourly.time.substring(10, 16),
                      iconUrl: 'https:' + hourly.condition.icon.toString(),
                      text: hourly.condition.text,
                      temp: '${hourly.tempC.toStringAsFixed(0)}°C',
                      feels: '${hourly.feelslikeC.toStringAsFixed(0)}°C',
                      isday: hourly.isDay,
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
