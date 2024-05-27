import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  final double initialValue; // Rename to initialValue for clarity
  final double maximumValue; // Rename to maximumValue for clarity
  const SliderExample({
    Key? key,
    required this.initialValue, // Use initialValue here
    required this.maximumValue, // Use maximumValue here
  }) : super(key: key);

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 0; // Initialize with a default value

  // Define colors
  static const Color greenColor = Colors.green;
  static const Color whiteColor = Colors.white;
  static const Color redColor = Colors.red;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue; // Use initialValue here
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor;
    if (_currentSliderValue > 5) {
      activeColor = redColor;
    } else {
      activeColor = greenColor;
    }
    return Slider(
      value: _currentSliderValue,
      activeColor: activeColor,
      secondaryTrackValue: 5,
      inactiveColor: Colors.redAccent.withOpacity(0.7),
      secondaryActiveColor: Colors.green.withOpacity(0.7),
      min: 0,
      max: widget.maximumValue, // Use maximumValue here
      divisions: widget.maximumValue.toInt(), // Use maximumValue here
      label: _currentSliderValue.round().toString(),
      onChanged: (double newValue) {
        setState(() {
          _currentSliderValue = newValue;
        });
      },
    );
  }
}
