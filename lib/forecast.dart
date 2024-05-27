import 'package:flutter/material.dart';
import 'package:weather_ap/logic/Forecast/todays.dart';
import 'package:weather_ap/logic/Forecast/Future.dart';
import 'package:weather_ap/logic/Forecast/Hour.dart';

class Forecast extends StatelessWidget {
  const Forecast({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_sunny_sharp,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(
                'Forecast',
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
                colors: [Color(0xFF2E335A), Color(0xFF1C1B31)],
              ),
            ),
          ),
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            tabs: [
              Tab(
                icon: Icon(Icons.sunny_snowing, color: Colors.white),
                text: 'Today',
              ),
              Tab(
                icon: Icon(Icons.cloudy_snowing, color: Colors.white),
                text: 'Future',
              ),
              Tab(
                icon: Icon(Icons.access_time, color: Colors.white),
                text: 'Hour',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const Todays(),
            Future(),
            Hour(),
          ],
        ),
      ),
    );
  }
}
