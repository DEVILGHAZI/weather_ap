import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/prsentation/current/home.dart';
import 'package:weather_ap/logic/more/modelslider.dart';
import 'package:weather_ap/logic/more/newmodel.dart';
import 'package:weather_ap/logic/more/rectangle.dart';
import '../../../logic/more/model.dart';

class CurrentPage extends StatefulWidget {
  final Current currentData;
  final LocationModel location;
  const CurrentPage(
      {super.key, required this.currentData, required this.location});

  @override
  State<CurrentPage> createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  int usEpaIndex = 0;
  String airQuality = "";
  late BoxWidget1 airQualityBox;
  @override
  void initState() {
    usEpaIndex = widget.currentData.airQuality.usEpaIndex;
    airQuality = getAirQualityText(usEpaIndex);
    airQualityBox = BoxWidget1(
      initialData: '',
      title: 'AIR QUALITY',
      icon: Icons.blur_on_rounded,
      index: 0.0,
      maximumvalue: 9,
      isButtonActive: true,
      currentData: widget.currentData,
      location: widget.location,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sunny,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Current',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.location.name.toString(),
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
                    widget.currentData.tempC.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const Text(
                    " | ",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    widget.currentData.condition.text,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: 'https:' + widget.currentData.condition.icon,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  airQualityBox = BoxWidget1(
                    initialData: '$usEpaIndex - $airQuality',
                    title: 'AIR QUALITY',
                    icon: Icons.blur_on_rounded,
                    index: widget.currentData.airQuality.usEpaIndex.toDouble(),
                    maximumvalue: 9,
                    isButtonActive: true,
                    currentData: widget.currentData,
                    location: widget.location,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxWidget(
                    initialData: widget.currentData.windKph.toString() +
                        ' km/h \n ' +
                        widget.currentData.windDir +
                        ' \n' +
                        widget.currentData.windDegree.toString() +
                        '°',
                    title: 'WIND',
                    icon: Icons.air,
                    text: "Wind Speed in Km/h",
                  ),
                  uvBox = SlideWidget(
                    initialData: widget.currentData.uv.toString() +
                        '\n' +
                        getUVText(widget.currentData.uv.toInt()),
                    title: 'UV INDEX',
                    icon: Icons.sunny,
                    index: widget.currentData.uv,
                    maximumvalue: 11,
                    text: "UV Level",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxWidget2(
                    initialData: widget.currentData.humidity.toString() + '%',
                    title: 'HUMIDITY',
                    icon: Icons.water,
                    text: "Humidity Percentage",
                  ),
                  BoxWidget2(
                    initialData: widget.currentData.visKm.toString() + ' km',
                    title: 'VISIBILITY',
                    icon: Icons.visibility,
                    text: "Visibility in km",
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BoxWidget2(
                    initialData: widget.currentData.feelslikeC.toString(),
                    title: 'FEELS LIKE',
                    icon: Icons.device_thermostat_sharp,
                    text: getfeelslike(widget.currentData.tempC,
                        widget.currentData.feelslikeC),
                  ),
                  BoxWidget2(
                    initialData: widget.currentData.precipMm.toString() + " mm",
                    title: 'PRECIPTATION',
                    icon: Icons.change_circle_sharp,
                    text: 'Preciptation in mm\n' +
                        widget.currentData.cloud.toString() +
                        '% cover by cloud',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxWidget windBox = const BoxWidget(
    initialData: '',
    title: 'WIND',
    icon: Icons.air,
    text: "",
  );
  SlideWidget uvBox = const SlideWidget(
    initialData: '',
    title: 'UV INDEX',
    icon: Icons.sunny,
    index: 0.0,
    maximumvalue: 11,
    text: "washid",
  );
  BoxWidget humidityBox = const BoxWidget(
    initialData: '',
    title: 'HUMIDITY',
    icon: Icons.water,
    text: "",
  );
  BoxWidget visibilityBox = const BoxWidget(
    initialData: '',
    title: 'VISIBILITY',
    icon: Icons.visibility,
    text: "",
  );
  BoxWidget sunriseBox = const BoxWidget(
    initialData: '',
    title: 'SUNRISE',
    icon: Icons.sunny_snowing,
    text: "",
  );
  BoxWidget rainfallBox = const BoxWidget(
    initialData: '',
    title: 'RAINFALL',
    icon: Icons.water_drop_outlined,
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

  String getfeelslike(double tempc, double feelslike) {
    double temp = tempc - feelslike;
    temp = double.parse(temp.toStringAsFixed(2));
    if (temp > 1) {
      return '$temp °C Higher to actual temprature';
    } else if (temp < 1) {
      return '$temp °C Lower to actual temprature';
    } else {
      return 'Similar to actual temprature';
    }
  }

  String getAirQualityText(int index) {
    if (index == 1) {
      return 'Low Health Risk';
    } else if (index == 2) {
      return 'Low Health Risk';
    } else if (index == 3) {
      return 'Moderate';
    } else if (index == 4) {
      return 'Unhealthy';
    } else if (index == 5) {
      return 'Very unhelthy';
    } else if (index == 6) {
      return 'Very high health risk (Hazardous)';
    } else {
      return 'Unknown';
    }
  }
}
