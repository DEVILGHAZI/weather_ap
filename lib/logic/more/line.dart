import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      width: 300,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white38,
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );
  }
}
