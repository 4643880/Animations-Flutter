import 'dart:math';
import 'package:animations_flutter_snt/screens/flutter_transform.dart';
import 'package:animations_flutter_snt/screens/image_animation.dart';
import 'package:animations_flutter_snt/screens/implicit_animations.dart';
import 'package:animations_flutter_snt/screens/tween_animation.dart';
import 'package:animations_flutter_snt/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'flutter_curves.dart';
import 'flutter_matrix_four.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Flutter App Design',
            style: TextStyle(color: Colors.black)),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const CustomText(
              '👉',
              size: 30,
            ),
            title: const CustomText(
              'Image Animation',
              size: 18,
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ImageAnimation()));
            },
          ),
          ListTile(
            leading: const CustomText(
              '👉',
              size: 30,
            ),
            title: const CustomText(
              'Implicit Animated',
              size: 18,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const ImplicitAnimationsExample()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CustomText(
              '👉',
              size: 30,
            ),
            title: const CustomText(
              'Flutter transform',
              size: 18,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const FlutterTransformExample()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CustomText(
              '👉',
              size: 30,
            ),
            title: const CustomText(
              'Flutter Matrix4',
              size: 18,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const FlutterMatrixFourExample()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CustomText(
              '👉',
              size: 30,
            ),
            title: const CustomText(
              'Flutter Animation curves',
              size: 18,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const FlutterCurvesExample()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const CustomText(
              '👉',
              size: 30,
            ),
            title: const CustomText(
              'Flutter Tween Animations',
              size: 18,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const TweenAnimationExample()));
            },
          ),
        ],
      ),
    );
  }
}
