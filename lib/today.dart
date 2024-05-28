// import 'package:flutter/material.dart';
// import 'package:weather_ap/logic/more/model.dart';
// import 'package:weather_ap/logic/more/rectangle.dart';
// import 'package:weather_ap/logic/more/modelslider.dart';
// import 'package:weather_ap/logic/more/newmodel.dart';
// import 'package:weather_ap/logic/current.dart';

// class Today extends StatefulWidget {
//   const Today({super.key});

//   @override
//   _TodayState createState() => _TodayState();
// }

// class _TodayState extends State<Today> {
//   Map<String, dynamic> weather = {};
//   BoxWidget1 airQualityBox = const BoxWidget1(
//     initialData: '',
//     title: 'AIR QUALITY',
//     icon: Icons.blur_on_rounded,
//     index: 0.0,
//     maximumvalue: 9,
//     isButtonActive: true,
//   );
//   BoxWidget windBox = const BoxWidget(
//     initialData: '',
//     title: 'WIND',
//     icon: Icons.air,
//     text: "",
//   );
//   SlideWidget uvBox = const SlideWidget(
//     initialData: '',
//     title: 'UV INDEX',
//     icon: Icons.sunny,
//     index: 0.0,
//     maximumvalue: 11,
//     text: "washid",
//   );
//   BoxWidget humidityBox = const BoxWidget(
//     initialData: '',
//     title: 'HUMIDITY',
//     icon: Icons.water,
//     text: "",
//   );
//   BoxWidget visibilityBox = const BoxWidget(
//     initialData: '',
//     title: 'VISIBILITY',
//     icon: Icons.visibility,
//     text: "",
//   );
//   BoxWidget sunriseBox = const BoxWidget(
//     initialData: '',
//     title: 'SUNRISE',
//     icon: Icons.sunny_snowing,
//     text: "",
//   );
//   BoxWidget rainfallBox = const BoxWidget(
//     initialData: '',
//     title: 'RAINFALL',
//     icon: Icons.water_drop_outlined,
//     text: "",
//   );

//   WeatherDataFetch weatherDataFetch = WeatherDataFetch();

//   String area = "";
//   String tempC = "";
//   String day = "";
//   String condition = "";
//   String icon = "";
//   double windSpeed = 0.0;
//   int windDegree = 0;
//   String windDirection = "";
//   String humidity = "";
//   String visibilityKm = "";
//   String uvIndex = "";
//   String cloud = "";
//   String precipitationMm = "";
//   String iconUrl = "";
//   int usEpaIndex = 0;
//   String airQuality = "";
//   String _uv = "";
//   bool isLoading = false;
//   double index = 0.0;
//   String feelslike = "";
//   String tempcondition = "";
//   @override
//   void initState() {
//     super.initState();
//     _fetchWeatherData();
//   }

//   String getUVText(int index) {
//     if (index >= 1 && index <= 2) {
//       return 'Low';
//     } else if (index >= 3 && index <= 5) {
//       return 'Moderate';
//     } else if (index >= 6 && index <= 7) {
//       return 'High';
//     } else if (index >= 8 && index <= 10) {
//       return 'Very high';
//     } else if (index >= 11) {
//       return 'Extreme';
//     } else {
//       return 'Unknown';
//     }
//   }

//   String getfeelslike(double tempc, double feelslike) {
//     double temp = tempc - feelslike;
//     temp = double.parse(temp.toStringAsFixed(2));
//     if (temp > 1) {
//       return '$temp °C Higher to actual temprature';
//     } else if (temp < 1) {
//       return '$temp °C Lower to actual temprature';
//     } else {
//       return 'Similar to actual temprature';
//     }
//   }

//   String getAirQualityText(int index) {
//     if (index == 1) {
//       return 'Low Health Risk';
//     } else if (index == 2) {
//       return 'Low Health Risk';
//     } else if (index == 3) {
//       return 'Moderate';
//     } else if (index == 4) {
//       return 'Unhealthy';
//     } else if (index == 5) {
//       return 'Very unhelthy';
//     } else if (index == 6) {
//       return 'Very high health risk (Hazardous)';
//     } else {
//       return 'Unknown';
//     }
//   }

//   _fetchWeatherData() async {
//     setState(() {
//       isLoading = true;
//     });
//     await weatherDataFetch.fetchWeatherData();

//     if (mounted) {
//       setState(() {
//         weather = weatherDataFetch.data;
//         area = weatherDataFetch.area;
//         double weatherData = weather['current']['temp_c'];
//         int data = weatherData.toInt();
//         tempC = "$data°C";
//         day = 'Now ${weather['current']['is_day'] == 1 ? "Day" : "Night"}';
//         condition = weather['current']['condition']['text'];
//         icon = weather['current']['condition']['icon'];
//         iconUrl = "https:$icon";
//         usEpaIndex = weather['current']['air_quality']['us-epa-index'];
//         airQuality = getAirQualityText(usEpaIndex);
//         windSpeed = weather['current']['wind_kph'];
//         windDegree = weather['current']['wind_degree'];
//         windDirection = weather['current']['wind_dir'];
//         double uv = weather['current']['uv'];
//         uvIndex = getUVText(uv.toInt());
//         _uv = uv.toString();
//         humidity = weather['current']['humidity'].toString();
//         visibilityKm = weather['current']['vis_km'].toString();
//         cloud = weather['current']['cloud'].toString();
//         double _precipitationMm = weather['current']['precip_mm'];
//         precipitationMm = _precipitationMm.toString();
//         index = usEpaIndex.toDouble();
//         feelslike = "${weather['current']['feelslike_c']}°C";
//         double feels = weather['current']['feelslike_c'];
//         tempcondition = getfeelslike(weatherData, feels);
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.sunny,
//               color: Colors.white,
//             ),
//             SizedBox(width: 8),
//             Text(
//               'Current',
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ),
//         elevation: 0.0,
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         iconTheme: const IconThemeData(color: Colors.white),
//         flexibleSpace: Container(
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
//             ),
//           ),
//         ),
//       ),
//       body: isLoading
//           ? Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
//                 ),
//               ),
//               child: const Center(
//                 child: LinearProgressIndicator(
//                   backgroundColor: Colors.transparent,
//                 ),
//               ),
//             )
//           : SingleChildScrollView(
//               child: Container(
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height,
//                 clipBehavior: Clip.antiAlias,
//                 decoration: const BoxDecoration(
//                   gradient: LinearGradient(
//                     begin: Alignment(0.20, -0.98),
//                     end: Alignment(-0.2, 0.98),
//                     colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
//                   ),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           area ?? '',
//                           style: const TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           tempC ?? '',
//                           style: const TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const Text(
//                           " | ",
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white,
//                           ),
//                         ),
//                         Text(
//                           condition ?? '',
//                           style: const TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                           ),
//                         ),
//                         if (iconUrl.isNotEmpty)
//                           Image.network(
//                             Uri.encodeFull(iconUrl),
//                             width: 50,
//                             height: 50,
//                             fit: BoxFit.cover,
//                           ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         airQualityBox = BoxWidget1(
//                           initialData: '$usEpaIndex - $airQuality',
//                           title: 'AIR QUALITY',
//                           icon: Icons.blur_on_rounded,
//                           index: usEpaIndex.toDouble(),
//                           maximumvalue: 9,
//                           isButtonActive: true,
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         BoxWidget(
//                           initialData:
//                               '$windSpeed km/h \n$windDirection \n $windDegree°',
//                           title: 'WIND',
//                           icon: Icons.air,
//                           text: "Wind Speed in Km/h",
//                         ),
//                         uvBox = SlideWidget(
//                           initialData: '$_uv\n$uvIndex',
//                           title: 'UV INDEX',
//                           icon: Icons.sunny,
//                           index: double.parse(_uv),
//                           maximumvalue: 11,
//                           text: "UV Level",
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         BoxWidget2(
//                           initialData: '$humidity%',
//                           title: 'HUMIDITY',
//                           icon: Icons.water,
//                           text: "Humidity Percentage",
//                         ),
//                         BoxWidget2(
//                           initialData: '$visibilityKm km',
//                           title: 'VISIBILITY',
//                           icon: Icons.visibility,
//                           text: "Visibility in km",
//                         ),
//                       ],
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         BoxWidget2(
//                           initialData: feelslike,
//                           title: 'FEELS LIKE',
//                           icon: Icons.device_thermostat_sharp,
//                           text: tempcondition,
//                         ),
//                         BoxWidget2(
//                           initialData: "$precipitationMm mm",
//                           title: 'PRECIPTATION',
//                           icon: Icons.change_circle_sharp,
//                           text: "Preciptation in mm\n$cloud% cover by cloud",
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//     );
//   }
// }
