import 'package:flutter/material.dart';

class BoxWidget2 extends StatelessWidget {
  final String initialData;
  final String title;
  final IconData icon;
  final String text;

  const BoxWidget2(
      {super.key,
      required this.initialData,
      required this.title,
      required this.icon,
      required this.text});
  @override
  Widget build(BuildContext context) {
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
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          initialData,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          text,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(223, 175, 236, 216),
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
        ],
      ),
    );
  }
}
