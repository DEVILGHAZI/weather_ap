import 'package:flutter/material.dart';

class SliderExample extends StatefulWidget {
  final double initialValue;
  final double maximumValue;
  const SliderExample({
    super.key,
    required this.initialValue,
    required this.maximumValue,
  });

  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 0;

  @override
  void initState() {
    super.initState();
    _currentSliderValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    Color activeColor = _currentSliderValue > 5 ? Colors.red : Colors.green;
    return Slider(
      value: _currentSliderValue,
      activeColor: activeColor,
      secondaryTrackValue: 5,
      inactiveColor: Colors.redAccent.withOpacity(0.7),
      secondaryActiveColor: Colors.green.withOpacity(0.7),
      min: 0,
      max: widget.maximumValue,
      divisions: widget.maximumValue.toInt(),
      label: _currentSliderValue.round().toString(),
      onChanged: (double newValue) {
        setState(() {
          _currentSliderValue = newValue;
        });
      },
    );
  }
}
