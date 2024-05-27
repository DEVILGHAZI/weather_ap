import 'package:flutter/material.dart';

class TodayMenu extends StatefulWidget {
  const TodayMenu({Key? key}) : super(key: key);

  @override
  State<TodayMenu> createState() => _TodayMenuState();
}

class _TodayMenuState extends State<TodayMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 5, bottom: 20, right: 15),
      width: MediaQuery.of(context)
          .size
          .width, // Use MediaQuery.of(context).size instead of MediaQuery.sizeOf(context)
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: [
            Color.fromARGB(255, 33, 29, 65),
            Color.fromARGB(192, 13, 22, 58),
            Color.fromARGB(255, 42, 40, 71),
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromARGB(160, 255, 255, 255),
              ),
              Text(
                '12 Hourly Forecast',
                style: TextStyle(
                  color: Color.fromARGB(160, 255, 255, 255),
                  fontSize: 18,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: Color.fromARGB(160, 255, 255, 255),
              )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                MenuWidget(
                  temprature: '22',
                  time: '12',
                  icon: '',
                ),
                SizedBox(width: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  final String time;
  final String icon;
  final String temprature;
  const MenuWidget(
      {Key? key,
      required this.time,
      required this.icon,
      required this.temprature})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(34, 63, 59, 99),
            Color.fromARGB(207, 89, 101, 151),
          ],
        ),
        border: Border.all(
          width: 0.5,
          color: const Color.fromARGB(255, 194, 194, 194),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '12 AM',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.sunny,
            color: Colors.white,
          ),
          Text(
            '22°',
            style: TextStyle(color: Colors.white, fontSize: 17),
          )
        ],
      ),
    );
  }
}
