import 'package:flutter/material.dart';
import 'package:weather_ap/logic/current.dart';

class airquality extends StatefulWidget {
  const airquality({super.key});

  @override
  _airquality createState() => _airquality();
}

class _airquality extends State<airquality> {
  Map<String, dynamic> weather = {};
  WeatherDataFetch weatherDataFetch = WeatherDataFetch();

  String area = "";
  String tempC = "";
  String day = "";
  String condition = "";
  String icon = "";
  String iconUrl = "";
  int usEpaIndex = 0;
  String airQuality = "";
  bool isLoading = false;
  double _co = 0.0;
  double _o3 = 0.0;
  double _no2 = 0.0;
  double _so2 = 0.0;
  double _pm2_5 = 0.0;
  double _pm10 = 0.0;
  int _defraIndex = 0;

  String co = "";
  String o3 = "";
  String no2 = "";
  String so2 = "";
  String pm2_5 = "";
  String pm10 = "";
  String defraIndex = "";

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
      return 'Very Unhealthy';
    } else if (index == 6) {
      return 'Very High Health Risk (Hazardous)';
    } else {
      return 'Unknown';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeatherData();
  }

  _fetchWeatherData() async {
    setState(() {
      isLoading = true; // Set loading state to true before fetching data
    });

    await weatherDataFetch.fetchWeatherData();
    if (mounted) {
      setState(() {
        weather = weatherDataFetch.data;
        area = weatherDataFetch.area;
        double weatherData = weather['current']['temp_c'];
        int data = weatherData.toInt();
        tempC = '$data°C';
        day = 'Now ${weather['current']['is_day'] == 1 ? "Day" : "Night"}';
        condition = weather['current']['condition']['text'];
        icon = weather['current']['condition']['icon'];
        iconUrl = "https:$icon";
        usEpaIndex = weather['current']['air_quality']['us-epa-index'];
        airQuality = getAirQualityText(usEpaIndex);
        _co = weather['current']['air_quality']['co'];
        co = _co.toString();
        _no2 = weather['current']['air_quality']['no2'];
        no2 = _no2.toString();
        _o3 = weather['current']['air_quality']['o3'];
        o3 = _o3.toString();
        _so2 = weather['current']['air_quality']['so2'];
        so2 = _so2.toString();
        _pm2_5 = weather['current']['air_quality']['pm2_5'];
        pm2_5 = _pm2_5.toString();
        _pm10 = weather['current']['air_quality']['pm10'];
        pm10 = _pm10.toString();
        _defraIndex = weather['current']['air_quality']['gb-defra-index'];
        defraIndex = _defraIndex.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.blur_on_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Air Quality',
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
      body: isLoading
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
                ),
              ),
              child: const Center(
                child: LinearProgressIndicator(
                  backgroundColor: Colors.transparent,
                ),
              ),
            )
          : CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Container(
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
                                  area,
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
                                  tempC,
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
                                  condition,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                if (iconUrl.isNotEmpty)
                                  Image.network(
                                    iconUrl,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(0),
                                  border: Border.all(
                                    color: Colors.white38,
                                    width: 1.0,
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.air,
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            'AIR QUALITY INDEX',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 10.0),
                                      child: Text(
                                        '$usEpaIndex - $airQuality\n   US EPA INDEX',
                                        style: const TextStyle(
                                          fontSize: 22,
                                          color: Colors.white70,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$co [Carbon Monooxide (μg/m3)]',
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$no2 [Nitrogen Dioxide (μg/m3)]',
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$o3 [Ozone (μg/m3)]',
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$so2 [Sulphur Dioxide (μg/m3)]',
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$pm2_5 [PM2.5 (μg/m3)]',
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$pm10 [PM10 (μg/m3)]',
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            '$usEpaIndex [us-epa-index]',
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 5.0),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.ac_unit_sharp,
                                            color: Colors.white60,
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            "$defraIndex [gb-defra-index]",
                                            style: const TextStyle(
                                                color: Colors.white60,
                                                fontSize: 17),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Details',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Row(
                                children: [
                                  SizedBox(width: 8),
                                  Text(
                                    "Field Description \nco - Carbon Monoxide (μg/m3) \no3 - Ozone (μg/m3)  \nno2 - Nitrogen dioxide (μg/m3)  \nso2 - float	Sulphur dioxide (μg/m3) \npm2_5 - PM2.5 (μg/m3) \npm10 - PM10 (μg/m3)",
                                    /*

    Band	Low	Low	Low	Moderate	Moderate	Moderate	High	High	High	Very High
    µgm-3	0-11	12-23	24-35	36-41	42-47	48-53	54-58	59-64	65-70	71 or more"*/
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Us-Epa-Index in US - EPA standard.\n1 means Good\n2 means Moderate\n3 means Unhealthy for sensitive group\n4 means Unhealthy\n5 means Very Unhealthy\n6 means Hazardous',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 5),
                              child: Row(
                                children: [
                                  Text(
                                    'Gb-Defra-Index	in UK Defra Index (See table below)\nIndex           Band\n1 2 3           (Low)\n4	5	6           (Moderate)\n7	8	9           (High)\n10               (Very High)',
                                    style: TextStyle(
                                        fontSize: 10, color: Colors.white60),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
