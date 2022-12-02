import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SandBox extends StatefulWidget {
  const SandBox({super.key});

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _margin = 0;
  double _opacity = 1;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 2),
        margin: EdgeInsets.only(left: _margin),
        width: _width,
        color: _color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _margin = 70;
                });
              },
              child: const Text("Animate Margin"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.purple;
                });
              },
              child: const Text("Animate Color"),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _width = 400;
                });
              },
              child: const Text("Animate Width"),
            ),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: const Text(
                "Hide This Text",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _opacity = 0;
                });
              },
              child: const Text("Animate Opacity"),
            ),
          ],
        ),
      ),
    );
  }
}
