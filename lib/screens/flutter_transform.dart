import 'dart:math';

import 'package:flutter/material.dart';

class FlutterTransformExample extends StatefulWidget {
  const FlutterTransformExample({Key? key}) : super(key: key);

  @override
  FlutterTransformExampleState createState() => FlutterTransformExampleState();
}

class FlutterTransformExampleState extends State<FlutterTransformExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Transform Widget',
            style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Align(
                  child: Transform(
                    transform: Matrix4.skewX(-50),
                    alignment: FractionalOffset.center,
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Align(
                  child: Transform.translate(
                    offset: const Offset(-100, 100),
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Align(
                  child: Transform.rotate(
                    angle: pi / 2,
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(.5),
                    borderRadius: BorderRadius.circular(8)),
                child: Align(
                  child: Transform.scale(
                    scale: 0.5,
                    child: Container(
                      width: 150,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(.5),
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
