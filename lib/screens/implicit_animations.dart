import 'dart:math';

import 'package:animations_flutter_snt/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationsExample extends StatefulWidget {
  const ImplicitAnimationsExample({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationsExampleState createState() =>
      _ImplicitAnimationsExampleState();
}

class _ImplicitAnimationsExampleState extends State<ImplicitAnimationsExample> {
  var _width = 120.0;
  var _height = 140.0;
  var _opacity = 0.0;
  var _angle = 0.0;
  var _animationDuration = Duration(seconds: 2);
  late Color _color;
  late double _borderRadius;
  late double _margin;

  double _randomValue({int max = 80}) {
    return Random().nextDouble() * max;
  }

  Color _randomColor() {
    return Color(0xffffffff & Random().nextInt(0xffffffff));
  }

  @override
  void initState() {
    super.initState();
    _color = _randomColor();
    _margin = _randomValue();
    _borderRadius = _randomValue();
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _opacity = 1.0;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('implicit Animations',
            style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: _animationDuration,
              opacity: _opacity,
              child: AnimatedContainer(
                duration: _animationDuration,
                transform: Matrix4.identity()..rotateZ(_angle),
                transformAlignment: FractionalOffset.center,
                width: _width,
                height: _height,
                margin: EdgeInsets.all(_margin),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  _color = _randomColor();
                  _margin = _randomValue();
                  _borderRadius = _randomValue();
                });
              },
              label: ' Change look 👀',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  _width = _randomValue(max: 200);
                  _height = _randomValue(max: 300);
                });
              },
              label: ' Change Size 🤏🏻',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  _angle = _randomValue();
                });
              },
              label: ' Rotate 🔁',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
