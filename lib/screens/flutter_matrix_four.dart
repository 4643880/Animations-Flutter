import 'package:flutter/material.dart';

// x,y,z,scale ofa all sides
// 1,0,0,0,
// 0,1,0,0,
// 0,0,1,0,
// 0,0,0,1,
class FlutterMatrixFourExample extends StatefulWidget {
  const FlutterMatrixFourExample({Key? key}) : super(key: key);

  @override
  FlutterMatrixFourExampleState createState() =>
      FlutterMatrixFourExampleState();
}

class FlutterMatrixFourExampleState extends State<FlutterMatrixFourExample> {
  double x = 0;
  double y = 0;
  double z = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          '4D MATRIX',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Center(
        child: Transform(
          transform: Matrix4(
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            1,
            0,
            0,
            0,
            0,
            1,
          )
            ..rotateX(x)
            ..rotateY(y)
            ..rotateZ(z),
          alignment: FractionalOffset.center,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                y = y - details.delta.dx / 100;
                x = x + details.delta.dy / 100;
              });
            },
            child: Container(
              color: Colors.red,
              height: 200.0,
              width: 200.0,
            ),
          ),
        ),
      ),
    );
  }
}
