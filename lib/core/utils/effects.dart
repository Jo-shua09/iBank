import 'package:flutter/material.dart';

class AppEffects {
  static const List<BoxShadow> dropShadowCard = [
    BoxShadow(
      color: Color(0x123629B7), // 0xFF3629B7 with 7% opacity
      blurRadius: 30,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> dropShadowCardSmall = [
    BoxShadow(
      color: Color(0x123629B7), // 0xFF3629B7 with 7% opacity
      blurRadius: 30,
      offset: Offset(0, -5),
    ),
  ];
}
