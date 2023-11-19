import 'package:flutter/material.dart';

class AppColors {
  // info
  static const int _primary = 0xFFE65A1F;
  static const MaterialColor primary = MaterialColor(
    _primary,
    <int, Color>{
      100: Color(_primary),
      200: Color(_primary),
      300: Color(_primary),
      400: Color(_primary),
      500: Color(_primary),
      600: Color(0xFFDD0023),
      700: Color(0xFFDD0023),
      800: Color(0xFFDD0023),
      900: Color(0xFFDD0023)
    },
  );

  // info
  static const int _accent = 0xFF008DDD;
  static const MaterialColor accent = MaterialColor(
    _accent,
    <int, Color>{
      100: Color(_accent),
      200: Color(_accent),
      300: Color(_accent),
      400: Color(_accent),
      500: Color(_accent),
      600: Color(0xFF5056EC),
      700: Color(0xFF5056EC),
      800: Color(0xFF5056EC),
      900: Color(0xFF5056EC)
    },
  );
}
