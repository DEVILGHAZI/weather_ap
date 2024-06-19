import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffectAstro extends StatelessWidget {
  const ShimmerEffectAstro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment(0.20, -0.98),
                    end: Alignment(-0.2, 0.98),
                    colors: [Color(0xFF2E335A), Color(0xFF1C1B33)],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: const Color.fromARGB(255, 82, 80, 80),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 100),
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(82, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: const Color.fromARGB(255, 82, 80, 80),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60),
                        child: Container(
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: const Color.fromARGB(82, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    shimmerBox(context),
                    const SizedBox(height: 10),
                    shimmerBox(context),
                    const SizedBox(height: 10),
                    shimmerBox(context),
                    const SizedBox(height: 10),
                    shimmerBox(context),
                    const SizedBox(height: 10),
                    shimmerBox(context),
                    const SizedBox(height: 10),
                    shimmerBox(context),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 100,top: 200),
                child: Container(
                        height: 150,
                        width: 200,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.brightness_3,
                              size: 40,
                              color: Color.fromARGB(255, 179, 180, 180),
                            ),
                            Text(
                              'Please wait while we fetch astro\'s Data...',
                              style: TextStyle(color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
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
      ),
    );
  }

  Widget shimmerBox(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: const Color.fromARGB(255, 82, 80, 80),
      child: Container(
        height: 45,
        width: 330,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color.fromARGB(93, 0, 0, 0),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: Colors.white38,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}