// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:weather_ap/forecast/cubit/forecast_cubit.dart';
// import 'package:weather_ap/forecast/cubit/forecast_state.dart';
// import 'package:weather_ap/forecast/model/day_model.dart';
// import 'package:weather_ap/forecast/repo/Forecast_repo.dart';
// import 'package:weather_ap/forecast/today/today_home.dart';
// import 'package:weather_ap/forecast/today/today_shimmer.dart';
// import 'package:weather_ap/homepage/bloc/model.dart';
// import 'package:weather_ap/homepage/bloc/state.dart';
// import 'package:weather_ap/location/access_current.location.dart';
// import 'package:weather_ap/location/model.dart';

// class Today extends StatefulWidget {
//   const Today({super.key});

//   @override
//   State<Today> createState() => _TodayState();
// }

// class _TodayState extends State<Today> {
//   late ForecastCubit _cubit;
//   late Future<LocationDetails> _locationDetails;

//   @override
//   void initState() {
//     super.initState();
//     _locationDetails = LocationService().getCurrentLocation();
//     _cubit = ForecastCubit(ForecastRepo());
//     _locationDetails.then((location) {
//       _cubit.fetchBothData(location.latitude, location.longitude);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocListener<ForecastCubit, ForecastState>(
//         bloc: _cubit,
//         listener: (context, state) {
//           if (state is DAyError) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.message),
//                 backgroundColor: Colors.grey,
//               ),
//             );
//           }
//         },
//         child: BlocBuilder<ForecastCubit, ForecastState>(
//           bloc: _cubit,
//           builder: (context, state) {
//             if (state is WeatherLoading) {
//               return Center(child: ShimmerEffectToday());
//             } else if (state is DayLoaded) {
//               Day weatherData = state.today;
//               LocationModel location = state.location;
//               return TodayHome(
//                 currentData: weatherData,
//                 location: location,
//               );
//             } else {
//               return Center(child: ShimmerEffectToday());
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
