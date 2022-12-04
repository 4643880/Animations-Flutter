import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation<double> _sizeAnimation;
  late Animation<double> _curve;

  bool isFav = false;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _curve = CurvedAnimation(
      parent: _controller,
      curve: Curves.slowMiddle,
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey[400],
      end: Colors.red,
    ).animate(_curve);

    _sizeAnimation = TweenSequence(
      [
        TweenSequenceItem(
          weight: 50,
          tween: Tween<double>(begin: 30, end: 50),
        ),
        TweenSequenceItem(
          weight: 50,
          tween: Tween<double>(begin: 50, end: 30),
        ),
      ],
    ).animate(_curve);

    // _controller.forward(); // Will start animation
    // _controller.reverse(); // Will reverse

    _controller.addListener(() {
      print(_controller.value);
      print(_colorAnimation.value);
    });

    // Checking the Status of Animation
    _controller.addStatusListener((status) {
      // print(status);
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _colorAnimation,
      builder: (context, child) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,
          ),
          onPressed: () {
            if (isFav == true) {
              _controller.reverse();
            } else if (isFav == false) {
              _controller.forward();
            }
          },
        );
      },
    );
  }
}
