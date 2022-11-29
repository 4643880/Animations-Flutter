import 'package:flutter/material.dart';

class ImageAnimation extends StatefulWidget {
  const ImageAnimation({super.key});

  @override
  State<ImageAnimation> createState() => _ImageAnimationState();
}

class _ImageAnimationState extends State<ImageAnimation> {
  @override
  var _width = 320;
  Offset _offset = const Offset(-0.2, 0);

  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        setState(() {
          _width = 420;
          _offset = const Offset(0, 0);
        });
      },
    );
    Future.delayed(
      const Duration(seconds: 1),
      () {
        setState(() {
          _offset = const Offset(0, 0);
        });
      },
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Image Animation")),
      body: Center(
          child: AnimatedSlide(
        duration: const Duration(seconds: 2),
        offset: _offset,
        child: AnimatedContainer(
            width: _width.toDouble(),
            duration: const Duration(seconds: 4),
            curve: Curves.easeInSine,
            child: Image.network(
              "https://play-lh.googleusercontent.com/1-hPxafOxdYpYZEOKzNIkSP43HXCNftVJVttoo4ucl7rsMASXW3Xr6GlXURCubE1tA=w3840-h2160-rw",
            )),
      )),
    );
  }
}
