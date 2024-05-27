import 'package:flutter/material.dart';
import 'package:weather_ap/logic/more/slider.dart';

class SlideWidget extends StatelessWidget {
  final String initialData;
  final String title;
  final IconData icon;
  final double index;
  final double maximumvalue;
  final String text;

  const SlideWidget({
    Key? key,
    required this.initialData,
    required this.title,
    required this.icon,
    required this.index,
    required this.maximumvalue,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SliderExample slide = SliderExample(
      initialValue: index,
      maximumValue: maximumvalue,
    );
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 190,
      width: 190,
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
                  fontSize: 25,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 0.0, vertical: 130.0),
            child: slide,
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(223, 175, 236, 216),
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
