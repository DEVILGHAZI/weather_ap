import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_ap/forecast/model/day_model.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/prsentation/current/widget/air_quality.dart';
import 'package:weather_ap/logic/more/slider.dart';

class RectangleWidget extends StatelessWidget {
  final Day day;
  final IconData icon;

  const RectangleWidget({
    super.key, required this.day, required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.all(7.0),
      height: 180,
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
              child: Row(
                children: [
                  Icon(icon,color: Color.fromARGB(255, 255, 255, 255),),
                  const SizedBox(width: 8),
                  Text(
                    'Sunrise',
                    style: const TextStyle(color: Colors.white60, fontSize: 17),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                day.astro!.sunrise!,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                day.astro!.sunrise!,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 10,left: 290),
            child: Align(
              alignment: Alignment.topLeft,
              child: CachedNetworkImage(imageUrl: 'https://cdn.weatherapi.com/weather/64x64/day/116.png')
            ),
          ),
        ],
      ),
    );
  }
}
