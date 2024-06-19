import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TodayMenuShimmer extends StatelessWidget {
  const TodayMenuShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          24,
          (index) {
            return Row(
              children: [
                Container(
                  child: menu(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(width: 1, color: Colors.white),
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(34, 63, 59, 99),
                        Color.fromARGB(207, 89, 101, 151),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget menu(context) {
    return Shimmer.fromColors(
      baseColor: Color.fromARGB(34, 63, 59, 99),
      highlightColor: Color.fromARGB(207, 89, 101, 151),
      child: Container(
        height: 150,
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: const LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(128, 99, 94, 143),
              Color.fromARGB(207, 89, 101, 151),
            ],
          ),
        ),
      ),
    );
  }
}
