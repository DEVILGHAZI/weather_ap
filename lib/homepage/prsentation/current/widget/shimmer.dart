import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_ap/bottom.dart';
import 'package:weather_ap/logic/widgets/menu_widgets.dart';
import 'package:weather_ap/logic/widgets/search_widget.dart';

class ShimmerEffectHome extends StatelessWidget {
  const ShimmerEffectHome({super.key});
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
                                ();
                              },
                              icon: const Icon(
                                Icons.search_sharp,
                                size: 30,
                                color: Color.fromARGB(235, 201, 199, 199),
                              ),
                            ),
                            FloatingActionButton(
                              backgroundColor: Colors.transparent,
                              onPressed: () {},
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
                              onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
