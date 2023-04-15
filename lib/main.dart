import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}): super(key: key);

  @override 
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelCardDemo(),
    );
  }
}