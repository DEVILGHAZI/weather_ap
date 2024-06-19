import 'package:flutter/material.dart';

class BoxWidget3 extends StatelessWidget {
  final String time;
  final String day;
  final String temp;
  final String feels;
  final String iconUrl;
  final String text;
  final int isday;

  const BoxWidget3(
      {super.key,
      required this.time,
      required this.day,
      required this.temp,
      required this.feels,
      required this.iconUrl,
      required this.text, required this.isday});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 80,
      width: 385,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white38,
                width: 1.0,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 1.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: [
                  const SizedBox(width: 8),
                  Text(
                    time,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 20),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    day,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(223, 200, 255, 0),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    temp + "/" + feels,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 229, 232, 238),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  if (iconUrl.isNotEmpty)
                    Image.network(
                      Uri.encodeFull(iconUrl),
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 2.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Text(
                        text,
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 0.671),
                            fontSize: 18),
                      ),
                       Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              isday==1 ? ' Day ' : 'Night ',
                              style: const TextStyle(
                                fontSize: 18,
                                color:  Color.fromRGBO(255, 255, 255, 0.671),
                              ),
                            ),
                          ],
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
