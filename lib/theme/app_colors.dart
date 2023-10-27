import 'package:flutter/material.dart';

class AppColors {
  static const Color backgroundColor = Color.fromARGB(255, 23, 33, 69);
  static const Color backgroundColor2 = Color(0xFF607CE0);
  static const Color bottomColor = Color.fromARGB(255, 15, 35, 99);
  static const Color color4631D2 = Color(0xFF4631D2);
  static const Color colorE0E6ED = Color(0xFFE0E6ED);
  static const Color fillColor = Color(0xFFA9A9AC);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorBlack = Color(0xFF000000);
  static const Color color929292 = Color(0xFF929292);
  static const Color colorEC3A4D = Color(0xFFD50015);
  static const Color orangeDark = Color(0xffCE5A01);
  static const Color cardColor = Color(0xFF081A53);
  static const Color cardShadow = Color(0xFF080648);

  static Brightness getBrightness(Color color) {
    final double relativeLuminance = color.computeLuminance();
    const double kThreshold = 0.15;
    return ((relativeLuminance + 0.05) * (relativeLuminance + 0.05) >
            kThreshold)
        ? Brightness.light
        : Brightness.dark;
  }
}
