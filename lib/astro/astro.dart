// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:weather_ap/astro/rectangel.dart';
// import 'package:weather_ap/forecast/model/day_model.dart';
// import 'package:weather_ap/homepage/bloc/model.dart';
// import 'package:weather_ap/homepage/prsentation/current/home.dart';
// import 'package:weather_ap/logic/more/model.dart';
// import 'package:weather_ap/logic/more/rectangle.dart';
// import 'package:weather_ap/logic/more/line.dart';

// class AstroPage extends StatefulWidget {
//   final Day data;
//   final LocationModel location;
//   final Current currentData;
//   const AstroPage({
//     Key? key,
//     required this.data,
//     required this.location,
//     required this.currentData,
//   }) : super(key: key);

//   @override
//   _AstroState createState() => _AstroState();
// }

// class _AstroState extends State<AstroPage> {
  
//   @override
//   void initState() {
//     super.initState();
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
//           child: ListView(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         widget.location.name,
//                         style: TextStyle(
//                           fontSize: 30,
//                           color: Colors.white,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         widget.currentData.tempC.toString() +
//                             '°C | ' +
//                             widget.currentData.condition.text,
//                         style: TextStyle(
//                           fontSize: 25,
//                           color: Colors.white,
//                         ),
//                       ),
//                       CachedNetworkImage(
//                         imageUrl: 'https:' + widget.currentData.condition.icon,
//                         height: 40,
//                         width: 40,
//                       )
//                     ],
//                   ),
                  
                   
//                   RectangleWidget(day: widget.data,icon: Icons.sunny,),
                  
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     box,
//                   //     box,
//                   //   ],
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     box,
//                   //     box,
//                   //   ],
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     box,
//                   //     box,
//                   //   ],
//                   // ),
//                   // Row(
//                   //   mainAxisAlignment: MainAxisAlignment.center,
//                   //   children: [
//                   //     box,
//                   //     box,
//                   //   ],
//                   // ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/homepage/bloc/model.dart';

class AstroPage extends StatelessWidget {
  final Day data;
  final LocationModel location;
  final Current currentData;

  const AstroPage({
    super.key,
    required this.data,
    required this.location,
    required this.currentData,
  });

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 5),
              Text(
                location.name,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${currentData.tempC}°C | ${currentData.condition.text}',
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 10),
                  CachedNetworkImage(
                    imageUrl: 'https:${currentData.condition.icon}',
                    height: 40,
                    width: 40,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    AstroWidget(
                      icon: Icons.sunny,
                      title: 'Sunrise',
                      value: data.astro!.sunrise!,
                    ),
                    const SizedBox(height: 10),
                    AstroWidget(
                      icon: Icons.wb_sunny,
                      title: 'Sunset',
                      value: data.astro!.sunset!,
                    ),
                    const SizedBox(height: 10),
                    AstroWidget(
                      icon: Icons.brightness_3,
                      title: 'Moonrise',
                      value: data.astro!.moonrise!,
                    ),
                    const SizedBox(height: 10),
                    AstroWidget(
                      icon: Icons.brightness_3,
                      title: 'Moonset',
                      value: data.astro!.moonset!,
                    ),
                    const SizedBox(height: 10),
                    AstroWidget(
                      icon: Icons.brightness_1,
                      title: 'Moon Phase',
                      value: data.astro!.moonPhase!,
                    ),
                    const SizedBox(height: 10),
                    AstroWidget(
                      icon: Icons.brightness_7,
                      title: 'Moon Illumination',
                      value: '${data.astro!.moonIllumination}%',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AstroWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const AstroWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(
          color: Colors.white38,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white60,
              fontSize: 17,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}