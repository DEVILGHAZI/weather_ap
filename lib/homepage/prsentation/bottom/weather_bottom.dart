import 'package:flutter/material.dart';
import 'package:weather_ap/forecast.dart';
import 'package:weather_ap/homepage/bloc/model.dart';
import 'package:weather_ap/homepage/prsentation/current/current.dart';
import 'package:weather_ap/today.dart';
import 'package:weather_ap/astro.dart';
import 'package:weather_ap/logic/livelocation.dart';
import 'package:geolocator/geolocator.dart';

class Bottom extends StatefulWidget {
  final Current currentData;
  final LocationModel location;

  const Bottom({super.key, required this.currentData, required this.location});
  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  bool isButton1Active = true;
  bool isButton2Active = true;
  bool isButton3Active = true;

  LocationService locationService = LocationService();

  Widget _buildButton({
    required IconData icon,
    required String label,
    required bool isActive,
    required VoidCallback? onPressed,
  }) {
    return Container(
      width: 180,
      height: 40,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 22, 25, 53),
            Color(0xFF2E335A),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        onPressed: isActive ? onPressed : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      maxChildSize: 1,
      builder: (context, scrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: BoxDecoration(
                  gradient: isButton1Active
                      ? const LinearGradient(
                          colors: [
                            Color.fromARGB(255, 51, 48, 95),
                            Color(0xFF2E335A),
                            Color.fromARGB(255, 7, 13, 39),
                            Color(0xFF1C1B33),
                            Color.fromARGB(255, 59, 65, 115),
                          ],
                        )
                      : const LinearGradient(
                          colors: [Colors.grey, Colors.grey],
                        ),
                  border: const Border(
                    top: BorderSide(
                      width: 2,
                      color: Color.fromARGB(255, 204, 195, 195),
                    ),
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: Color.fromARGB(255, 196, 192, 192),
                        size: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildButton(
                            icon: Icons.sunny,
                            label: 'Current',
                            isActive: isButton1Active,
                            onPressed: isButton1Active
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        CurrentPage(currentData: widget.currentData, location: widget.location,)
                                      ),
                                    );
                                  }
                                : null,
                          ),
                          _buildButton(
                            icon: Icons.cloudy_snowing,
                            label: 'Forecast',
                            isActive: isButton2Active,
                            onPressed: isButton2Active
                                ? () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Forecast(),
                                      ),
                                    );
                                  }
                                : null,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildButton(
                            icon: Icons.brightness_2,
                            label: 'Astro',
                            isActive: isButton2Active,
                            onPressed: isButton2Active
                                ? () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Astro(),
                                    //   ),
                                    // );
                                  }
                                : null,
                          ),
                          _buildButton(
                            icon: Icons.location_on,
                            label: 'Location',
                            isActive: isButton3Active,
                            onPressed: isButton3Active
                                ? () => _openGoogleMaps(context)
                                : null,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _openGoogleMaps(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            height: 150,
            width: 200,
            decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.grey),
                borderRadius: BorderRadius.circular(15)),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'We are Opening Your Current ',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Location on Map',
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
        );
      },
    );

    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      await locationService.openGoogleMaps(
        position.latitude,
        position.longitude,
      );
    } catch (e) {
      print("position not fetch");
    } finally {
      Navigator.pop(context); // Close the loading indicator dialog
    }
  }
}
