import 'dart:ui';

import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color primary = Color(0xFFFE8C00);
  static const Color beige = Color(0xFFFAF0E6);
  static const Color red = Color(0xFFCC1010);

  static const MaterialColor _black = MaterialColor(0xFF242424, {
    10: Color(0xFFE9E9E9),
    20: Color(0xFFD3D3D3),
    30: Color(0xFFBDBDBD),
    40: Color(0xFFA7A7A7),
    50: Color(0xFF919191),
    60: Color(0xFF7C7C7C),
    70: Color(0xFF666666),
    80: Color(0xFF505050),
    90: Color(0xFF3A3A3A),
    100: Color(0xFF242424),
  });

  static MaterialColor black = _black;
}
