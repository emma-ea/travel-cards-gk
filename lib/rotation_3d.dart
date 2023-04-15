import 'dart:math';

import 'package:flutter/material.dart';

class Rotation3d extends StatelessWidget {
  
  static const double degrees2Radius  = pi/180;

  final Widget child;
  final double rotationX;
  final double rotationY;
  final double rotationZ;
  
  const Rotation3d({super.key, required this.child, this.rotationX = 0, this.rotationY = 0, this.rotationZ = 0});

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: FractionalOffset.center,
      transform: Matrix4.identity()
        ..setEntry(3, 2, 0.001)
        ..rotateX(rotationX * degrees2Radius)
        ..rotateY(rotationY * degrees2Radius)
        ..rotateZ(rotationZ * degrees2Radius),
        child: child,
    );
  }
}