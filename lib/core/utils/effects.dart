import 'package:flutter/material.dart';

class AppEffects {
  static List<BoxShadow> dropShadowCard = [
    BoxShadow(
      color: const Color(0xFF3629B7).withOpacity(0.07),
      blurRadius: 30,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> dropShadowCardSmall = [
    BoxShadow(
      color: const Color(0xFF3629B7).withOpacity(0.07),
      blurRadius: 30,
      offset: const Offset(0, -5),
    ),
  ];
}
