import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/logic/more/model.dart';
import 'package:weather_ap/logic/more/modelslider.dart';
import 'package:weather_ap/logic/more/newmodel.dart';
import 'package:weather_ap/logic/more/norectengal.dart';
import 'package:intl/intl.dart';

class TodayHome extends StatefulWidget {
  final Day currentData;
  final LocationModel location;
  const TodayHome({Key? key, required this.currentData, required this.location})
      : super(key: key);
  @override
  _TodayHomeState createState() => _TodayHomeState();
}

class _TodayHomeState extends State<TodayHome> {
  String date = "";
  String uvIndex = "";
  String formattedDay = '';
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    uvIndex= getUVText(widget.currentData.uv!);
    DateTime now = DateTime.now();
    formattedDay = DateFormat('EEEE').format(now);
    var formatter = DateFormat('yyyy-MM-dd');
    date = formatter.format(now);
    updateTime();
    Timer.periodic(Duration(seconds: 60), (timer) {
      updateTime();
    });
  }

  
  void updateTime() {
    setState(() {
      currentTime = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
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
                    widget.location.name,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date + ' | ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    formattedDay + ' | ',
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    currentTime,
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxWidget1(
                    title: 'CONDITION',
                    icon: Icons.thermostat,
                    min: widget.currentData. mintempC.toString() +
                        "°C" +
                        " Lowest",
                    maximum: widget.currentData.maxtempC.toString() +
                        "°C" +
                        " Highest",
                    average: widget.currentData.avgtempC.toString() +
                        "°C" +
                        " Average",
                    iconUrl: 'https:' +
                        widget.currentData.condition!.icon.toString(),
                    text: widget.currentData.condition!.text ?? '',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxWidget2(
                    initialData:
                        widget.currentData.maxwindKph.toString() + " km/h",
                    title: 'WIND SPEED',
                    icon: Icons.air,
                    text: "This is Maximum wind speed",
                  ),
                  BoxWidget2(
                    initialData: widget.currentData.avgvisKm.toString() + " km",
                    title: "VISIBILITY",
                    icon: Icons.visibility,
                    text: "This is average visibility",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxWidget2(
                      initialData: widget.currentData.avghumidity.toString() + "%",
                      title: 'HUMIDITY',
                      icon: Icons.water,
                      text: 'This is average humidity'),
                  SlideWidget(
                    initialData: widget.currentData.uv.toString() + "\n" + uvIndex,
                    title: 'UV INDEX',
                    icon: Icons.sunny,
                    index: double.parse(widget.currentData.uv.toString()),
                    maximumvalue: 11,
                    text: uvIndex,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxWidget2(
                      initialData:
                          widget.currentData.totalprecipMm.toString() + " mm",
                      title: 'PRECIPITION',
                      icon: Icons.change_circle,
                      text: "Total precipitation in milimeter"),
                  BoxWidget2(
                    initialData:
                        widget.currentData.dailyChanceOfSnow.toString() +
                            '% Chance',
                    title: 'RAINFALL',
                    icon: Icons.cloudy_snowing,
                    text: widget.currentData.dailyWillItRain == 1
                        ? "Yes, it's a rainy day"
                        : "No, it's not a rainy day",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  BoxWidget box1 = const BoxWidget(
    initialData: 'washid',
    title: 'WIND SPEED',
    icon: Icons.wind_power,
    text: "",
  );

  BoxWidget box2 = const BoxWidget(
    initialData: 'washid',
    title: 'UV INDEX',
    icon: Icons.sunny,
    text: "",
  );
  BoxWidget box3 = const BoxWidget(
    initialData: 'washid',
    title: 'UV INDEX',
    icon: Icons.sunny,
    text: "",
  );
  BoxWidget box4 = const BoxWidget(
    initialData: 'washid',
    title: 'UV INDEX',
    icon: Icons.sunny,
    text: "",
  );
  BoxWidget box5 = const BoxWidget(
    initialData: 'washid',
    title: 'UV INDEX',
    icon: Icons.sunny,
    text: "",
  );
  BoxWidget box6 = const BoxWidget(
    initialData: 'washid',
    title: 'UV INDEX',
    icon: Icons.sunny,
    text: "",
  );

String getUVText(int index) {
    if (index >= 1 && index <= 2) {
      return 'Low';
    } else if (index >= 3 && index <= 5) {
      return 'Moderate';
    } else if (index >= 6 && index <= 7) {
      return 'High';
    } else if (index >= 8 && index <= 10) {
      return 'Very high';
    } else if (index >= 11) {
      return 'Extreme';
    } else {
      return 'Unknown';
    }
  }

}
