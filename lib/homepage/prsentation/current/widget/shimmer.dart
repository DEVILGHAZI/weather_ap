import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_ap/homepage/bloc/cubit.dart';
import 'package:weather_ap/homepage/repo/repo.dart';
import 'package:weather_ap/location/access_current.location.dart';
import 'package:weather_ap/location/model.dart';

class ShimmerEffectHome extends StatefulWidget {
  final bool failed;
  final bool loading;

  const ShimmerEffectHome(
      {super.key, required this.failed, required this.loading});

  @override
  State<ShimmerEffectHome> createState() => _ShimmerEffectHomeState();
}

class _ShimmerEffectHomeState extends State<ShimmerEffectHome> {
  late WeatherCubit _cubit;
  late Future<LocationDetails> _locationDetails;

  @override
  void initState() {
    super.initState();
    _cubit = WeatherCubit(WeatherRepository()); // Initialize _cubit here
  }

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
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: const Color.fromARGB(255, 82, 80, 80)!,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 10),
                        child: Container(
                          width: 160,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(82, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: const Color.fromARGB(255, 82, 80, 80)!,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100, left: 70),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(82, 0, 0, 0),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(82, 0, 0, 0),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 60,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(82, 0, 0, 0),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                width: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(82, 0, 0, 0),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: 30,
                                width: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(82, 0, 0, 0),
                                ),
                              ),
                            ]),
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
                                width: 2,
                                color: Color.fromARGB(255, 181, 182, 182)),
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Hold a Second We are Trying to fetch your Location'),
                                    backgroundColor:
                                        Color.fromARGB(74, 27, 27, 27),
                                  ),
                                );
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Hold a Second We are Trying to fetch your Location'),
                                    backgroundColor:
                                        Color.fromARGB(74, 27, 27, 27),
                                  ),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 177, 171, 171),
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
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'Hold a Second We are Trying to fetch your Location'),
                                    backgroundColor:
                                        Color.fromARGB(74, 27, 27, 27),
                                  ),
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
                    ),
                    if (widget.loading == false && widget.failed == true)
                      Positioned(
                        top: 200,
                        left: 100,
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/cloud_failed.png',
                              scale: 4,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                                height: 40,
                                width: 200,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Color.fromARGB(255, 22, 25,
                                                53)), // Dark blue background
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white), // White text color
                                    shadowColor:
                                        MaterialStateProperty.all<Color>(Colors
                                            .transparent), // Transparent shadow
                                    side: MaterialStateProperty.all(BorderSide(
                                        color:
                                            Colors.transparent)), // No border
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            50), // Rounded corners
                                      ),
                                    ),
                                  ),
                                  onPressed: () {
                                    _locationDetails =
                                        LocationService().getCurrentLocation();
                                    _locationDetails.then((location) {
                                      _cubit.fetchBothData(location.latitude,
                                          location.longitude);
                                    });
                                  },
                                  child: MouseRegion(
                                    cursor: SystemMouseCursors.click,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.refresh),
                                        SizedBox(
                                            width:
                                                8), // Space between icon and text
                                        Text('Reload'),
                                      ],
                                    ),
                                  ),
                                )

                                // ElevatedButton(

                                //   style: ButtonStyle(backgroundColor:
                                //       Color.fromARGB(255, 22, 25, 53),
                                //     //  Color(0xFF2E335A),
                                //     ),
                                //   onPressed: () {
                                //     _locationDetails =
                                //         LocationService().getCurrentLocation();
                                //     _locationDetails.then((location) {
                                //       _cubit.fetchBothData(
                                //           location.latitude, location.longitude);
                                //     });
                                //   },
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       Icon(Icons.refresh),
                                //       Text('Reload'),
                                //     ],
                                //   ),
                                // ),
                                ),
                          ],
                        ),
                      ),
                    if (widget.loading == true && widget.failed == false)
                      Padding(
                        padding: EdgeInsets.only(left: 90, top: 110),
                        child: Container(
                          height: 150,
                          width: 200,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'We are Fetching ',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Your Current Location',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              CircularProgressIndicator(
                                color: Colors.white,
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
        ),
      ),
    );
  }
}
