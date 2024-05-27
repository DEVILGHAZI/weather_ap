import 'dart:async';
import 'package:flutter/material.dart';
import 'package:weather_ap/logic/Forecast/forecastlogic.dart';
import 'package:weather_ap/logic/more/model.dart';
import 'package:weather_ap/logic/more/modelslider.dart';
import 'package:weather_ap/logic/more/newmodel.dart';
import 'package:weather_ap/logic/more/norectengal.dart';
import 'package:intl/intl.dart';

class Todays extends StatefulWidget {
  const Todays({Key? key}) : super(key: key);

  @override
  _TodaysState createState() => _TodaysState();
}

class _TodaysState extends State<Todays> {
  Map<String, dynamic> weather = {};
  ForecastWeatherDataFetch forecst = ForecastWeatherDataFetch();
  String _area = ""; // Initialize with loading state
  String date = "";
  String _avgtemp = "";
  String mintemp = "";
  String maxtemp = "";
  String day = "";
  String condition = "";
  String icon = "";
  String windSpeed = "";
  int windDegree = 0;
  String windDirection = "";
  String humidity = "";
  String visibilityKm = "";
  String uvIndex = "";
  String cloud = "";
  String precipitationMm = "";
  String Url = "";
  int usEpaIndex = 0;
  String airQuality = "";
  String _uv = "";
  bool isLoading = false;
  double index = 0.0;
  String feelslike = "";
  String formattedDay = '';
  String currentTime = '';
  String rain = "";
  String willrain = "";

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

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
    DateTime now = DateTime.now();
    formattedDay = DateFormat('EEEE').format(now);
    updateTime();
    Timer.periodic(Duration(seconds: 60), (timer) {
      updateTime();
    });
  }

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

  void updateTime() {
    setState(() {
      currentTime = DateFormat('hh:mm a').format(DateTime.now());
    });
  }

  _fetchWeatherData() async {
    try {
      setState(() {
        isLoading = true;
      });
      await forecst.fetchWeatherforecastData();
      setState(() {
        if (mounted) {
          weather = forecst.data;
          _area = forecst.area;
          List<dynamic> forecastDays = weather['forecast']['forecastday'];
          date = forecastDays.isNotEmpty
              ? forecastDays[0]['date']
              : "No date available";
          _avgtemp = forecastDays.isNotEmpty
              ? forecastDays[0]['day']['avgtemp_c'].toString() +
                  "°C" +
                  " Average"
              : "No temperature available";
          icon = forecastDays[0]['day']['condition']['icon'];
          Url = icon.isNotEmpty ? "https:$icon" : '';
          mintemp =
              forecastDays[0]['day']['mintemp_c'].toString() + "°C" + " Lowest";
          maxtemp = forecastDays[0]['day']['maxtemp_c'].toString() +
              "°C" +
              " Highest";
          condition = forecastDays[0]['day']['condition']['text'];
          windSpeed = forecastDays[0]['day']['maxwind_kph'].toString();
          visibilityKm = forecastDays[0]['day']['avgvis_km'].toString();
          humidity = forecastDays[0]['day']['avghumidity'].toString();
          double uv = forecastDays[0]['day']['uv'];
          uvIndex = getUVText(uv.toInt());
          _uv = uv.toString();
          rain = forecastDays[0]['day']['daily_chance_of_rain'].toString();
          willrain = forecastDays[0]['day']['daily_will_it_rain'].toString();
          precipitationMm = forecastDays[0]['day']['totalprecip_mm'].toString();
          isLoading = false;
        }
      });
    } catch (e) {
      print("Error fetching weather data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.20, -0.98),
              end: Alignment(-0.2, 0.98),
              colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
            ),
          ),
          child: isLoading
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF2E335A), Colors.black87],
                    ),
                  ),
                  child: const Center(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _area,
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
                          min: mintemp,
                          maximum: maxtemp,
                          average: _avgtemp,
                          iconUrl: Url,
                          text: condition,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoxWidget2(
                          initialData: windSpeed + " km/h",
                          title: 'WIND SPEED',
                          icon: Icons.air,
                          text: "This is Maximum wind speed",
                        ),
                        BoxWidget2(
                          initialData: visibilityKm + " km",
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
                            initialData: humidity + "%",
                            title: 'HUMIDITY',
                            icon: Icons.water,
                            text: 'This is average humidity'),
                        SlideWidget(
                          initialData: _uv + "\n" + uvIndex,
                          title: 'UV INDEX',
                          icon: Icons.sunny,
                          index: double.parse(_uv),
                          maximumvalue: 11,
                          text: "Today's",
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BoxWidget2(
                            initialData: "$precipitationMm mm",
                            title: 'PRECIPITION',
                            icon: Icons.change_circle,
                            text: "Total precipitation in milimeter"),
                        BoxWidget2(
                          initialData: '$rain% Chance',
                          title: 'RAINFALL',
                          icon: Icons.cloudy_snowing,
                          text: willrain == 1
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
}
