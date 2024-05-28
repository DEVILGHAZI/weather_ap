import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_ap/bottom.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/prsentation/bottom/weather_bottom.dart';
import 'package:weather_ap/homepage/prsentation/current/widget/location_detail.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';
import 'package:weather_ap/logic/widgets/menu_widgets.dart';
import 'package:weather_ap/logic/widgets/search_widget.dart';

class CurrentData extends StatefulWidget {
  final Current current;
  final LocationModel location;
  const CurrentData({super.key, required this.current, required this.location});

  @override
  State<CurrentData> createState() => _CurrentDataState();
}

class _CurrentDataState extends State<CurrentData> {
  bool isButton1Active = true;
  late LocationDetails _location;
  @override
  void initState() {
    super.initState();
  }

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
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  left: 10,
                  top: 30,
                  child: CustomDropdownButton(location: widget.location)),
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.current.isDay ? 'Now Day ' : 'Now Night ',
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              widget.current.isDay
                                  ? Icons.wb_sunny_sharp
                                  : Icons.nights_stay_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Text(
                          widget.location.name,
                          style: const TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 89,
                              child: Stack(
                                children: [
                                  Text(
                                    widget.current.tempC.toStringAsFixed(0) ??
                                        '',
                                    style: const TextStyle(
                                      fontSize: 50,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Positioned(
                                    left: 60,
                                    top:
                                        10, // Adjust this value to fit your design
                                    right: 0,
                                    child: Text(
                                      '°C',
                                      style: const TextStyle(
                                        fontSize: 25,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Feels Like ' +
                                  widget.current.feelslikeC.toString() +
                                  '°C' ??
                              '',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Color(0x92EAEBF5),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.current.condition.text ?? '',
                              style: const TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                            CachedNetworkImage(
                              imageUrl:
                                  'https:' + widget.current.condition.icon,
                              width: 64,
                              height: 64,
                              fit: BoxFit.cover,
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 330),
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/house.png',
                        width: 400,
                        height: 500,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          width: 2, color: Color.fromARGB(255, 181, 182, 182)),
                    ),
                    gradient: LinearGradient(
                      begin: Alignment(0.20, -0.98),
                      end: Alignment(-0.2, 0.98),
                      colors: [
                        Color.fromARGB(255, 50, 47, 77),
                        Color.fromARGB(255, 13, 22, 58),
                        Color.fromARGB(255, 42, 40, 71),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchPage()));
                        },
                        icon: const Icon(
                          Icons.search_sharp,
                          size: 30,
                          color: Color.fromARGB(235, 201, 199, 199),
                        ),
                      ),
                      FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 160,
                                width: MediaQuery.sizeOf(context).width,
                                child: Bottom(currentData: widget.current, location: widget.location,),
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(255, 177, 171, 171),
                              width: 3,
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 40,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                height: 210,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                      Color.fromARGB(195, 88, 85, 117),
                                      Color.fromARGB(217, 43, 41, 71),
                                    ]),
                                    border: Border(
                                        top: BorderSide(
                                            width: 2,
                                            color: Color.fromARGB(
                                                255, 206, 204, 204))),
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30))),
                                width: MediaQuery.sizeOf(context).width,
                                child: TodayMenu(),
                              );
                            },
                          );
                        },
                        icon: const Icon(
                          Icons.menu,
                          size: 30,
                          color: Color.fromARGB(235, 201, 199, 199),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<LocationDetails> fetchLocality() async {
    LocationService locationService = LocationService();
    LocationDetails locationDetails =
        await locationService.getCurrentLocation();
    return locationDetails;
  }
}
