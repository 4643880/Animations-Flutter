import 'package:animations_flutter_snt/screens/home.dart';
import 'package:animations_flutter_snt/screens/sandBox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Animations',
      home: SandBox(),
    );
  }
}
