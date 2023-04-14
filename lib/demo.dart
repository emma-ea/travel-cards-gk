import 'package:flutter/material.dart';
import 'styles.dart';
import 'demo_data.dart';


class TravelCardDemo extends StatefulWidget {
  const TravelCardDemo({super.key});

  @override
  State<TravelCardDemo> createState() => _TravelCardDemoState();
}

class _TravelCardDemoState extends State<TravelCardDemo> {

  late List<City> _cityList;
  late City _currentCity;

  @override
  void initState() {
    super.initState();
    var data = DemoData();
    _cityList = data.getCities();
    _currentCity = _cityList[1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: Icon(Icons.menu, color: Colors.black),
      backgroundColor: Colors.white,
      brightness: Brightness.light,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
          child: Icon(Icons.search, color: Colors.black),
        ),
      ],
    );
  }
}