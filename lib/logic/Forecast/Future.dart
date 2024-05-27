import 'package:flutter/material.dart';
import 'package:weather_ap/logic/more/model.dart';
import 'package:weather_ap/logic/more/rectangle.dart';
import 'package:weather_ap/logic/more/line.dart';

class Future extends StatelessWidget {
  BoxWidget box = const BoxWidget(
    initialData: 'washid',
    title: 'UV INDEX',
    text: "",
    icon: Icons.sunny,
  );
  BoxWidget1 box1 = const BoxWidget1(
      initialData: 'washid',
      title: 'current',
      icon: Icons.sunny,
      index: 0,
      maximumvalue: 9,
      isButtonActive: true);
  Line line = const Line();

  Future({super.key});
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
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Rampur',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '19° | Mostly clear',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [box1],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    box,
                    box,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    box,
                    box,
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    box,
                    box,
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
