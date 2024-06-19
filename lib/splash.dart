import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2E335A),
      body: Center(
        
        child:ClipOval(
          child: Image.asset(
            'assets/logo.jpg',
            width: 300.0, // Set the width of the image
            height: 300.0, // Set the height of the image
            fit: BoxFit.cover, // Make the image cover the circle
          ),
        ),
      ),
    );
  }
}
