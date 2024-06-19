import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerDayEffectToday extends StatelessWidget {
  const ShimmerDayEffectToday({super.key});
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
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: const Color.fromARGB(255, 82, 80, 80)!,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 5, left: 120),
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
                      highlightColor: const Color.fromARGB(255, 82, 80, 80),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40, left: 60),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 27,
                                width: 280,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color.fromARGB(82, 0, 0, 0),
                                ),
                              ),
                            ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: box(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 210),
                      child: box(context),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 410),
                      child: box(context),
                    ),
                     Padding(
                      padding: const EdgeInsets.only(top: 610),
                      child: box(context),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 90, top: 240),
                      child: Container(
                        height: 150,
                        width: 200,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.cloud_queue,
                              size: 40,
                              color: Colors.blue,
                            ),
                            Text(
                              'Please wait while we fetch forecast\'s weather...',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
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

  Widget box(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.only(top: 70),
                      child: Container(
                        padding: const EdgeInsets.all(7.0),
                        height: 200,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 5.0),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor:
                                          const Color.fromARGB(255, 82, 80, 80),
                                      child: Container(
                                        height: 28,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color.fromARGB(82, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor:
                                          const Color.fromARGB(255, 82, 80, 80),
                                      child: Container(
                                        height: 28,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color.fromARGB(82, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor:
                                          const Color.fromARGB(255, 82, 80, 80),
                                      child: Container(
                                        height: 28,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color.fromARGB(82, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[300]!,
                                      highlightColor:
                                          const Color.fromARGB(255, 82, 80, 80),
                                      child: Container(
                                        height: 28,
                                        width: 170,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color.fromARGB(82, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Shimmer.fromColors(
                                              baseColor: Colors.grey[300]!,
                                              highlightColor:
                                                  const Color.fromARGB(
                                                      255, 82, 80, 80),
                                              child: Container(
                                                height: 25,
                                                width: 130,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  color: Color.fromARGB(
                                                      82, 0, 0, 0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15.0),
                              child: Align(
                                alignment:
                                    Alignment.topRight, // Align to top right
                                child: Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor:
                                      const Color.fromARGB(255, 82, 80, 80),
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(82, 0, 0, 0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
  }
}
