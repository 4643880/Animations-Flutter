import 'package:animations_flutter_snt/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({Key? key}) : super(key: key);

  @override
  TweenAnimationExampleState createState() => TweenAnimationExampleState();
}

class TweenAnimationExampleState extends State<TweenAnimationExample> {
  var _scale = 1.0;
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TweenAnimationBuilder(
            tween: Tween(begin: 0, end: _scale),
            duration: const Duration(milliseconds: 400),
            builder: (context, value, child) {
              return Transform.scale(
                alignment: FractionalOffset.center,
                scale: value.toDouble(),
                child: child,
              );
            },
            child: const Center(child: CustomText('🍑', size: 40)),
          ),
          const SizedBox(
            height: 20,
          ),
          Slider.adaptive(
              value: _scale,
              max: 3,
              min: 0,
              onChanged: (value) {
                setState(() {
                  _scale = value;
                });
              })
        ],
      ),
    );
  }
}
