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
}
