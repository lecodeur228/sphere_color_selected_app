import 'package:flutter/material.dart';
import 'package:sphere_color_selected_app/widgets/sphere_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _sliderValue = 0.5;

  Color _getColor(double value) {
    return HSVColor.fromAHSV(1.0, 360.0 * value, 1.0, 1.0).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF092635),
      appBar: AppBar(
        backgroundColor: const Color(0XFF092635),
        centerTitle: true,
        title: const Text("Color Sphere Selected",
            style: TextStyle(color: Colors.grey)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: _getColor(_sliderValue).withOpacity(0.5),
                    spreadRadius: 15,
                    blurRadius: 30,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: CustomPaint(
                painter: SphereWidget(_sliderValue),
              ),
            ),
            const SizedBox(height: 70),
            Slider(
              value: _sliderValue,
              onChanged: (value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              min: 0.0,
              max: 1.0,
              divisions: 100,
              label:
                  _getColor(_sliderValue).value.toRadixString(16).toUpperCase(),
              activeColor: _getColor(_sliderValue),
            ),
          ]),
        ),
      ),
    );
  }
}
