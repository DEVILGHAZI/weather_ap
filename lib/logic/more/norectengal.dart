import 'package:flutter/material.dart';

class BoxWidget1 extends StatelessWidget {
  final String title;
  final IconData icon;
  final String min;
  final String maximum;
  final String average;
  final String iconUrl;
  final String text;

  const BoxWidget1({
    Key? key,
    required this.title,
    required this.icon,
    required this.min,
    required this.average,
    required this.maximum,
    required this.iconUrl,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7.0),
      height: 190,
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
                      Icon(
                        icon,
                        color: Colors.white60,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title,
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
                          maximum,
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
                          average,
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
                          min,
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
                          text,
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
              child: Image.network(
                Uri.encodeFull(iconUrl),
                width: 64,
                height: 64,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
