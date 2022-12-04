import 'dart:ffi';

import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
      builder: (context, valuebetweenZerotoOne, child) {
        return Opacity(
          opacity: valuebetweenZerotoOne,
          child: Padding(
            padding: EdgeInsets.only(top: valuebetweenZerotoOne * 30),
            child: child,
          ),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 36,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
