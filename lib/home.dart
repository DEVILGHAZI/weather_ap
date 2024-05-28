// import 'package:flutter/material.dart';
// import 'package:weather_ap/bottom.dart';
// import 'package:weather_ap/logic/current.dart';
// import 'package:weather_ap/logic/widgets/menu_widgets.dart';

// import 'package:weather_ap/logic/widgets/search_widget.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   WeatherDataFetch weatherDataFetch = WeatherDataFetch();
//   Map<String, dynamic> weather = {};
//   String _location = "";
//   String _weatherData = "";
//   String _dayperiod = "";
//   String _condition = "";
//   String _icon = "";
//   String iconUrl = "";
//   String today = "";
//   String feelslike = "";
//   bool isLoading = false;
//   int day = 0;
//   bool isButton1Active = true;
//   bool isButton2Active = true;
//   bool isButton3Active = true;

//   @override
//   void initState() {
//     super.initState();
//     _fetchWeatherData();
//   }

//   _fetchWeatherData() async {
//     try {
//       setState(() {
//         isLoading = true;
//       });
//       await weatherDataFetch.fetchWeatherData();
//       setState(() {
//         weather = weatherDataFetch.data ?? {};
//         _location = weatherDataFetch.area ?? "";
//         if (weather.isNotEmpty) {
//           double weatherData = weather['current']['temp_c']?.toDouble() ?? 0.0;
//           _weatherData = "${weatherData.toStringAsFixed(0)}°C";
//           _dayperiod =
//               'Now ${weather['current']['is_day'] == 1 ? "Day" : "Night"}';
//           day = weather['current']['is_day'];
//           _condition = weather['current']['condition']['text'] ?? '';
//           _icon = weather['current']['condition']['icon'] ?? '';
//           iconUrl = _icon.isNotEmpty ? "https:$_icon" : '';
//           feelslike =
//               'Feels Like ${weather['current']['feelslike_c']?.toString() ?? '0'}°C';

//           isLoading = false;
//         } else {
//           _weatherData = "23°C";
//           _dayperiod = "Now Day";
//           _condition = "";
//           _icon = "";
//           iconUrl = "";
//           feelslike = "";
//         }
//       });
//     } catch (e) {
//       print("Error fetching weather data: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           clipBehavior: Clip.antiAlias,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment(0.20, -0.98),
//               end: Alignment(-0.2, 0.98),
//               colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
//             ),
//           ),
//           child: Stack(
//             children: [
//               Container(
//                 decoration: const BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/background.png"),
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 100),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(top: 0),
//                         child: isLoading
//                             ? const CircularProgressIndicator()
//                             : Column(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         _dayperiod + " ",
//                                         style: const TextStyle(
//                                           fontSize: 20,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       Icon(
//                                         day == 1
//                                             ? Icons.wb_sunny_sharp
//                                             : Icons.nights_stay_outlined,
//                                         color: Colors.white,
//                                       ),
//                                     ],
//                                   ),
//                                   Text(
//                                     _location,
//                                     style: const TextStyle(
//                                       fontSize: 25,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     _weatherData ?? '',
//                                     style: const TextStyle(
//                                       fontSize: 50,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                   Text(
//                                     feelslike ?? '',
//                                     style: const TextStyle(
//                                       fontSize: 20,
//                                       color: Color(0x92EAEBF5),
//                                     ),
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         _condition ?? '',
//                                         style: const TextStyle(
//                                           fontSize: 17,
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                       if (iconUrl.isNotEmpty)
//                                         Image.network(
//                                           Uri.encodeFull(iconUrl),
//                                           width: 64,
//                                           height: 64,
//                                           fit: BoxFit.cover,
//                                         ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 20),
//                                 ],
//                               ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 330),
//                   child: Stack(
//                     children: [
//                       Image.asset(
//                         'assets/house.png',
//                         width: 400,
//                         height: 500,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 bottom: 0,
//                 child: Container(
//                   height: 100,
//                   width: MediaQuery.sizeOf(context).width,
//                   decoration: const BoxDecoration(
//                     border: Border(
//                       top: BorderSide(
//                           width: 2, color: Color.fromARGB(255, 181, 182, 182)),
//                     ),
//                     gradient: LinearGradient(
//                       begin: Alignment(0.20, -0.98),
//                       end: Alignment(-0.2, 0.98),
//                       colors: [
//                         Color.fromARGB(255, 50, 47, 77),
//                         Color.fromARGB(255, 13, 22, 58),
//                         Color.fromARGB(255, 42, 40, 71),
//                       ],
//                     ),
//                     borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(40),
//                         topRight: Radius.circular(40)),
//                     color: Colors.white,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       IconButton(
//                         onPressed: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SearchPage()));
//                         },
//                         icon: const Icon(
//                           Icons.search_sharp,
//                           size: 30,
//                           color: Color.fromARGB(235, 201, 199, 199),
//                         ),
//                       ),
//                       FloatingActionButton(
//                         backgroundColor: Colors.transparent,
//                         onPressed: () {
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return SizedBox(
//                                 height: 160,
//                                 width: MediaQuery.sizeOf(context).width,
//                                 child: BottomWidget(
//                                   isButton1Active: isButton1Active,
//                                   isButton2Active: isButton2Active,
//                                   isButton3Active: isButton3Active,
//                                 ),
//                               );
//                             },
//                           );
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             border: Border.all(
//                               color: const Color.fromARGB(255, 177, 171, 171),
//                               width: 3,
//                             ),
//                           ),
//                           child: const Icon(
//                             Icons.add,
//                             size: 40,
//                             color: Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                       ),
//                       IconButton(
//                         onPressed: () {
//                           showModalBottomSheet(
//                             context: context,
//                             builder: (BuildContext context) {
//                               return Container(
//                                 height: 210,
//                                 decoration: BoxDecoration(
//                                     gradient: LinearGradient(colors: [
//                                       Color.fromARGB(195, 88, 85, 117),
//                                       Color.fromARGB(217, 43, 41, 71),
//                                     ]),
//                                     border: Border(
//                                         top: BorderSide(
//                                             width: 2,
//                                             color: Color.fromARGB(
//                                                 255, 206, 204, 204))),
//                                     borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(30),
//                                         topRight: Radius.circular(30))),
//                                 width: MediaQuery.sizeOf(context).width,
//                                 child: TodayMenu(),
//                               );
//                             },
//                           );
//                         },
//                         icon: const Icon(
//                           Icons.menu,
//                           size: 30,
//                           color: Color.fromARGB(235, 201, 199, 199),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
