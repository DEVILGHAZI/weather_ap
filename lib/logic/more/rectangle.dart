import 'package:flutter/material.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/prsentation/current/widget/air_quality.dart';
import 'package:weather_ap/logic/more/slider.dart';
import 'package:weather_ap/logic/more/airquality.dart';

class BoxWidget1 extends StatelessWidget {
  final String initialData;
  final String title;
  final IconData icon;
  final double index;
  final double maximumvalue;
  final bool isButtonActive;
  final Current currentData;
  final LocationModel location;

  const BoxWidget1({
    super.key,
    required this.initialData,
    required this.title,
    required this.icon,
    required this.index,
    required this.maximumvalue,
    required this.isButtonActive, 
    required this.currentData, required this.location,
  });

  @override
  Widget build(BuildContext context) {
    SliderExample slide =
        SliderExample(initialValue: index, maximumValue: maximumvalue);

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
                  Icon(
                    icon,
                    color: Colors.white60,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
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
                initialData,
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
                const EdgeInsets.symmetric(horizontal: 5.0, vertical: 110.0),
            child: slide,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                SizedBox(
                  width: 350,
                  height: 40,
                  child: TextButton(
                    onPressed: isButtonActive
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>  AirQualityView(currentData: currentData, location: location,),
                              ),
                            );
                          }
                        : null,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SEE MORE',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        SizedBox(width: 200),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Colors.white30,
                        ),
                      ],
                    ),
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
