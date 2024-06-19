import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ap/forecast/cubit/forecast_cubit.dart';
import 'package:weather_ap/forecast/cubit/forecast_state.dart';
import 'package:weather_ap/forecast/repo/forecast_repo.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';
import 'package:weather_ap/today_menu/today_menu_shimmer.dart';

class TodayMenu extends StatefulWidget {
  const TodayMenu({Key? key}) : super(key: key);

  @override
  State<TodayMenu> createState() => _TodayMenuState();
}

class _TodayMenuState extends State<TodayMenu> {
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
    return BlocProvider(
      create: (context) => _cubit,
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 5, bottom: 20, right: 15),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 33, 29, 65),
              const Color.fromARGB(192, 13, 22, 58),
              const Color.fromARGB(255, 42, 40, 71),
            ],
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(160, 255, 255, 255),
                ),
                Text(
                  '12 Hourly Forecast',
                  style: TextStyle(
                    color: Color.fromARGB(160, 255, 255, 255),
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  color: Color.fromARGB(160, 255, 255, 255),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            BlocBuilder<ForecastCubit, ForecastState>(
              builder: (context, state) {
                if (state is ForecastnextLoaded) {
                  final currentTimePrefix = getCurrentTimePrefix();
                  int startIndex = 0;
                  for (int i = int.parse(currentTimePrefix); i <= int.parse(currentTimePrefix)+11; i++) {
                    final hourlyWeather = state.day1.getHourlyWeather(i);
                    if (hourlyWeather?.time.startsWith(currentTimePrefix) ??
                        false) {
                      startIndex = i - 1;
                      break;
                    }
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                       int.parse(currentTimePrefix)+ 12,
                        (index) {
                          final hourlyIndex = (index + startIndex) % 12;
                          final hourlyData =
                              state.day1.getHourlyWeather(hourlyIndex + 1);
                          return hourlyData != null
                              ? Row(
                                children: [
                                  MenuWidget(
                                      time: hourlyData.time.substring(10,16),
                                      icon: hourlyData.condition.icon ?? '',
                                      temperature:
                                          hourlyData.tempC.toStringAsFixed(0),
                                    ),
                                    SizedBox(width: 10,)
                                ],
                                
                              )
                              : const SizedBox.shrink();
                        },
                      ),
                    ),
                  );
                } else if (state is ForecastError) {
                  return Text(state.message);
                }
                return  Center(child: TodayMenuShimmer());
              },
            )
          ],
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final String time;
  final String icon;
  final String temperature;

  const MenuWidget({
    Key? key,
    required this.time,
    required this.icon,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(
          begin: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(34, 63, 59, 99),
            Color.fromARGB(207, 89, 101, 151),
          ],
        ),
        border: Border.all(
          width: 0.5,
          color: const Color.fromARGB(255, 194, 194, 194),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            time,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          CachedNetworkImage(imageUrl: 'https:$icon'),
          Text(
            '$temperature°',
            style: const TextStyle(color: Colors.white, fontSize: 17),
          )
        ],
      ),
    );
  }
}

String getCurrentTimePrefix() {
  final now = DateTime.now();
  final hourString = now.hour.toString().padLeft(2, '0');
  return hourString.substring(0, 2);
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_ap/forecast/cubit/forecast_cubit.dart';
// import 'package:weather_ap/forecast/cubit/forecast_state.dart';
// import 'package:weather_ap/forecast/model/day_model.dart';
// import 'package:weather_ap/forecast/repo/forecast_repo.dart';
// import 'package:weather_ap/location/access_current.location.dart';
// import 'package:weather_ap/location/model.dart';
// import 'package:weather_ap/today_menu/today_menu_shimmer.dart';

// class TodayMenu extends StatefulWidget {
//   const TodayMenu({Key? key}) : super(key: key);

//   @override
//   State<TodayMenu> createState() => _TodayMenuState();
// }

// class _TodayMenuState extends State<TodayMenu> {
//   late ForecastCubit _cubit;
//   late Future<LocationDetails> _locationDetails;

//   @override
//   void initState() {
//     super.initState();
//     _locationDetails = LocationService().getCurrentLocation();
//     _cubit = ForecastCubit(ForecastRepo());
//     _locationDetails.then((location) {
//       _cubit.fetchBothDay3(location.latitude, location.longitude);
//     });
//   }

//   @override
//   void dispose() {
//     _cubit.close();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => _cubit,
//       child: Container(
//         padding: const EdgeInsets.only(left: 15, top: 5, bottom: 20, right: 15),
//         width: MediaQuery.of(context).size.width,
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(30),
//             topRight: Radius.circular(30),
//           ),
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             colors: [
//               const Color.fromARGB(255, 33, 29, 65),
//               const Color.fromARGB(192, 13, 22, 58),
//               const Color.fromARGB(255, 42, 40, 71),
//             ],
//           ),
//         ),
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Color.fromARGB(160, 255, 255, 255),
//                 ),
//                 Text(
//                   '12 Hourly Forecast',
//                   style: TextStyle(
//                     color: Color.fromARGB(160, 255, 255, 255),
//                     fontSize: 18,
//                   ),
//                 ),
//                 Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Color.fromARGB(160, 255, 255, 255),
//                 )
//               ],
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             BlocBuilder<ForecastCubit, ForecastState>(
//               builder: (context, state) {
//                 if (state is ForecastnextLoaded) {
//                   final currentHour = DateTime.now().hour;
//                   final hourlyWeathers = state.day1.hourly;

//                   return SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: List.generate(
//                         24,
//                         (index) {
//                           final hourIndex = currentHour + index;
//                           final hourlyData = hourlyWeathers
//                               .firstWhere((weather) => weather!.time.substring(10, 12) == (hourIndex % 24).toString().padLeft(2, '0'), orElse: () => hourlyWeathers.first);
//                           return Row(
//                             children: [
//                               MenuWidget(
//                                 time: hourlyData!.time.substring(10, 16),
//                                 icon: hourlyData.condition.icon ?? '',
//                                 temperature: hourlyData.tempC.toStringAsFixed(0),
//                               ),
//                               const SizedBox(width: 10),
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                   );
//                 } else if (state is ForecastError) {
//                   return Text(state.message);
//                 }
//                 return const Center(child: TodayMenuShimmer());
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MenuWidget extends StatelessWidget {
//   final String time;
//   final String icon;
//   final String temperature;

//   const MenuWidget({
//     Key? key,
//     required this.time,
//     required this.icon,
//     required this.temperature,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       width: 55,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(50),
//         gradient: const LinearGradient(
//           begin: Alignment.bottomCenter,
//           colors: [
//             Color.fromARGB(34, 63, 59, 99),
//             Color.fromARGB(207, 89, 101, 151),
//           ],
//         ),
//         border: Border.all(
//           width: 0.5,
//           color: const Color.fromARGB(255, 194, 194, 194),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Text(
//             time,
//             style: const TextStyle(
//               color: Colors.white,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           CachedNetworkImage(imageUrl: 'https:$icon'),
//           Text(
//             '$temperature°',
//             style: const TextStyle(color: Colors.white, fontSize: 17),
//           )
//         ],
//       ),
//     );
//   }
// }