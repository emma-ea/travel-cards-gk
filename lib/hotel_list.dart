import 'package:flutter/material.dart';
import 'styles.dart';
import 'demo_data.dart';

class HotelList extends StatefulWidget {

  final List<Hotel> hotels;

  const HotelList(this.hotels, {super.key});

  @override
  State<HotelList> createState() => _HotelListState();
}

class _HotelListState extends State<HotelList> with TickerProviderStateMixin {

  late AnimationController _anim;

  List<Hotel> _oldHotels = [];

  @override
  void initState() {
    _anim = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _anim.addListener(() => setState(() {}));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (_oldHotels != widget.hotels) {
      _anim.forward(from: 0);
    }
    _oldHotels = widget.hotels;
    Size size = MediaQuery.of(context).size;
    return Opacity(
      opacity: _anim.value,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Styles.hzScreenPadding * 1.5, vertical: 10),
        child: SizedBox(
          width: 400,
          height: size.height * .25,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Hotels'.toUpperCase(), style: Styles.hotelsTitleSection,),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (Hotel hotel in widget.hotels) _buildHotelData(hotel),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHotelData(Hotel hotel) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(hotel.name, style: Styles.hotelTitle,),
            const SizedBox(height: 3,),
            Row(
              children: [
                _buildStars(hotel.rate.toInt()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(hotel.rate.toString(), style: Styles.hotelScore,),
                ),
                Text('(${hotel.reviews})', style: Styles.hotelData,)
              ],
            ),            
          ],
        ),
        Text('\$${hotel.price}', style: Styles.hotelPrice,),
      ],
    );
  }

  Widget _buildStars(int count) {
    List<Widget> stars = [];
    for (int i = 0; i < count; i++){
      stars.add(const Icon(Icons.star, color: Color(0xFFfeda7d), size: 13,));
    }
    return Row(children: stars,);
  }
}