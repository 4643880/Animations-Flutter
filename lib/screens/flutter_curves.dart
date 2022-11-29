import 'dart:math';
import 'package:animations_flutter_snt/widgets/custom_button.dart';
import 'package:animations_flutter_snt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class FlutterCurvesExample extends StatefulWidget {
  const FlutterCurvesExample({Key? key}) : super(key: key);

  @override
  FlutterCurvesExampleState createState() => FlutterCurvesExampleState();
}

class FlutterCurvesExampleState extends State<FlutterCurvesExample> {
  var _width = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Animation Curves',
            style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurveDisplay(
              curveName: 'Linear',
              curve: Curves.linear,
              width: _width,
            ),
            CurveDisplay(
              curveName: 'Slow Middle',
              curve: Curves.slowMiddle,
              width: _width,
            ),
            CurveDisplay(
              curveName: 'Bounce In',
              curve: Curves.bounceIn,
              width: _width,
            ),
            CurveDisplay(
              curveName: 'Bounce out',
              curve: Curves.bounceOut,
              width: _width,
            ),
            CurveDisplay(
              curveName: 'Decelerate',
              curve: Curves.decelerate,
              width: _width,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              label: ' Animate 🔥',
              onTap: () {
                setState(() {
                  _width = 300;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(
              label: ' Re-set 🔁',
              onTap: () {
                setState(() {
                  _width = 80;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CurveDisplay extends StatelessWidget {
  const CurveDisplay({
    Key? key,
    required double width,
    required this.curveName,
    required this.curve,
  })  : _width = width,
        super(key: key);

  final double _width;
  final String curveName;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(curveName),
        AnimatedContainer(
          width: _width,
          height: 20,
          curve: curve,
          duration: const Duration(seconds: 2),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
        ),
      ],
    );
  }
}
