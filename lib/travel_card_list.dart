import 'package:flutter/material.dart';
import 'package:travel_cards_gk/constants.dart';
import 'demo_data.dart';
import 'rotation_3d.dart';
import 'travel_card_renderer.dart';

class TravelCardList extends StatefulWidget {
  
  final List<City> cities;
  final Function(City city) onCityChange;

  const TravelCardList({super.key, required this.cities, required this.onCityChange});

  @override
  State<TravelCardList> createState() => _TravelCardListState();
}

class _TravelCardListState extends State<TravelCardList> with SingleTickerProviderStateMixin {

  final double _maxRotation = 20;

  late PageController _pageController;

  double _cardHeight = 200;
  double _cardWidth = 100;
  double _normalizedOffset = 0;
  double _prevScrollX = 0;
  bool _isScrolling = false;

  AnimationController? _tweenController;
  Tween<double>? _tween;
  late Animation<double> _tweenAnim;


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    _cardHeight = (size.height *  .48).clamp(300.0, 400.0);
    _cardWidth = (size.width * .8);
    _pageController = PageController(initialPage: kInitialCity, viewportFraction: _cardWidth / size.width);

    Widget listContent = SizedBox(
      height: _cardHeight,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => _buildItemRenderer(i),
      ),
    );

    return Listener(
      onPointerUp: _handlePointerUp,
      child: NotificationListener(
        onNotification: _handleScrollNotifications,
        child: listContent,
      ),
    );
  }

  Widget _buildItemRenderer(int itemIndex) {
    return Rotation3d(
      rotationY: _normalizedOffset * _maxRotation,
      child: TravelCardRenderer(
        _normalizedOffset,
        city: widget.cities[itemIndex % widget.cities.length],
        cardWidth: _cardWidth,
        cardHeight: _cardHeight,
      ),
    );
  }

  bool _handleScrollNotifications(Notification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_isScrolling) {
        double dx = notification.metrics.pixels - _prevScrollX;
        double scrollFactor = .01;
        double newOffset = (_normalizedOffset + dx * scrollFactor);
        _setOffset(newOffset.clamp(-1.0, 1.0));
      }
      _prevScrollX = notification.metrics.pixels;
      widget.onCityChange(widget.cities.elementAt(_pageController.page!.round() % widget.cities.length));
    } else if(notification is ScrollStartNotification) {
      _isScrolling = true;
      _prevScrollX = notification.metrics.pixels;
      if (_tween != null) {
        _tweenController!.stop();
      }
    }
    return true;
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_isScrolling) {
      _isScrolling = false;
      _startOffsetTweenToZero();
    }
  }

  void _setOffset(double value) {
    setState(() {
      _normalizedOffset = value;
    });
  }

  void _startOffsetTweenToZero() {
    int tweenTime = 1000;
    if (_tweenController == null) {
      _tweenController = AnimationController(vsync: this,  duration: Duration(milliseconds: tweenTime));
      _tween = Tween<double>(begin: -1, end: 0);
      _tweenAnim = _tween!.animate(CurvedAnimation(parent: _tweenController!, curve: Curves.elasticOut))
        ..addListener(() {
          _setOffset(_tweenAnim.value);
        });
    }
    _tween!.begin = _normalizedOffset;
    _tweenController!.reset();
    _tween!.end = 0;
    _tweenController!.forward();
  }

}