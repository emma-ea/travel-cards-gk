import 'package:flutter/material.dart';

class City {
  final String name;
  final String title;
  final String description;
  final Color color;
  final List<Hotel> hotels;

  const City({
    required this.name,
    required this.description,
    required this.color,
    required this.hotels,
    required this.title,
  });
}

class Hotel {
  final String name;
  double rate;
  final int reviews;
  final int price;

  Hotel(this.name, {this.reviews = 0, this.price = 0}) : rate = 5.0;
}

class DemoData {
  final List<City> _cites = [
    City(
        name: 'Pisa',
        title: 'Pisa, Italy',
        description: 'Discover a beautiful city where ancient and modern meet',
        color: const Color(0xffdee5cf),
        hotels: [
          Hotel('Hotel Bologna', reviews: 201, price: 120),
          Hotel('Tree House', reviews: 85, price: 98),
          Hotel('Allegroitalia Pisa Tower Plaza', reviews: 128, price: 119),
        ]),
    City(
        name: 'Budapest',
        title: 'Budapest, Hungary',
        description: 'Meet the city with rich history and indescribable culture',
        color: const Color(0xffdaf3f7),
        hotels: [
          Hotel('Hotel Estilo Budapest', reviews: 762, price: 87),
          Hotel('Danubius Hotel', reviews: 3122, price: 196),
          Hotel('Golden Budapest Condominium', reviews: 213, price: 217),
        ]),
    City(
        name: 'London',
        title: 'London, England',
        description: 'A diverse and exciting city with the world’s best sights and attractions!',
        color: const Color(0xfff9d9e2),
        hotels: [
          Hotel('InterContinental London Hotel', reviews: 1624, price: 418),
          Hotel('Brick Lane Hotel', reviews: 101, price: 101),
          Hotel('Park Villa Boutique House', reviews: 161, price: 128),
        ]),
  ];

  List<City> getCities() => _cites;
  List<Hotel> getHotels(City city) => city.hotels;
}