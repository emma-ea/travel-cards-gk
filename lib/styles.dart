import 'package:flutter/material.dart';

class Styles {

  static const double hzScreenPadding = 18;

  static const TextStyle baseTitle = TextStyle(fontSize: 11, fontFamily: 'DMSerifDisplay');
  static const TextStyle baseBody = TextStyle(fontSize: 11, fontFamily: 'OpenSans');

  static final TextStyle appHeader = baseTitle.copyWith(color: const Color(0xFF0e0e0e), fontSize: 38, height: 1);

  static final TextStyle cardTitle = baseTitle.copyWith(height: 1, color: const Color(0xFF1a1a1a), fontSize: 25);
  static final TextStyle cardSubtitle = baseBody.copyWith(color: const Color(0xFF666666), height: 1.5, fontSize: 12);
  static final TextStyle cardAction = baseBody.copyWith(color: const Color(0xFFa6998b), fontSize: 10, fontWeight: FontWeight.w600, letterSpacing: 0.1);

  
}