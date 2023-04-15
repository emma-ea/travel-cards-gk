import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'travel_card_list.dart';
import 'styles.dart';
import 'demo_data.dart';
import 'hotel_list.dart';


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
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
              child: Text(
                'Where are you going next?',
                overflow: TextOverflow.ellipsis,
                style: Styles.appHeader,
                maxLines: 2,
              ),
            ),
            TravelCardList(
              cities: _cityList,
              onCityChange: _handleCityChange,
            ),
            HotelList(_currentCity.hotels),
            const Expanded(child: SizedBox(),),
          ],
        ),
      ),
    );
  }

  void _handleCityChange(City city) {
    setState(() {
      _currentCity = city;
    });
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0.0,
      leading: const Icon(Icons.menu, color: Colors.black),
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding),
          child: Icon(Icons.search, color: Colors.black),
        ),
      ],
    );
  }
}