import 'package:flutter/material.dart';
import 'package:weather_ap/logic/more/model.dart';
import 'package:weather_ap/logic/more/rectangle.dart';
import 'package:weather_ap/logic/more/line.dart';

class Astro extends StatelessWidget {
  BoxWidget box = const BoxWidget(
    initialData: 'washid',
    title: 'moon',
    text: "",
    icon: Icons.brightness_2,
  );
  BoxWidget1 box1 = const BoxWidget1(
    initialData: 'washid',
    title: 'astro',
    icon: Icons.sunny,
    index: 0,
    maximumvalue: 9,
    isButtonActive: true,
  );
  Line line = const Line();

  Astro({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.brightness_2,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text(
              'Astro',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
            ),
          ),
        ),
      ),
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
          child: ListView(
            children: [
              Column(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      box,
                      box,
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
