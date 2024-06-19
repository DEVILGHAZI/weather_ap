import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_ap/forecast/cubit/forecast_cubit.dart';
import 'package:weather_ap/forecast/model/day2_model.dart';
import 'package:weather_ap/forecast/model/day3_model.dart';
import 'package:weather_ap/forecast/model/day_model.dart';

class Day3Widget extends StatelessWidget {
  final Day3 day;
  const Day3Widget({
    Key? key,
    required this.day,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      height: 200,
      width: 385,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white38,
                width: 1.0,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CachedNetworkImage(
                  imageUrl: 'https:' + day.condition!.icon!,
                  width: 35,
                  height: 35,
                  fit: BoxFit.cover,
                ),
                      
                      const SizedBox(width: 8),
                      Text(
                        day.Hourly1?.time.substring(0, 10) ?? '',
                        style: const TextStyle(
                            color: Colors.white60, fontSize: 17),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/high_temp.png',
                        width: 25,
                        height: 25,
                      ),
                      Expanded(
                        child: Text(
                          day.maxtempC.toString() + "°C" + " Highest",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 241, 119, 119),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/average_temp.png',
                        width: 25,
                        height: 25,
                      ),
                      Expanded(
                        child: Text(
                          day.avgtempC.toString() + "°C" + " Avarage",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(212, 255, 255, 255),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Image.asset(
                        'assets/low_temp.png',
                        width: 25,
                        height: 25,
                      ),
                      Expanded(
                        child: Text(
                          day.mintempC.toString() + "°C" + " Lowest",
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 130, 221, 241),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      const SizedBox(width: 8),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          day.condition?.text ?? '',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 149, 214, 151),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
            child: Align(
                alignment: Alignment.topRight, // Align to top right
                child: CachedNetworkImage(
                  imageUrl: 'https:' + day.condition!.icon!,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
    );
  }
}
