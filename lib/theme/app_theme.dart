import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

final darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: AppColors.backgroundColor2,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
  ),
  dialogTheme: const DialogTheme(
    backgroundColor: AppColors.backgroundColor,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    hintStyle: TextStyle(color: Colors.grey[800]),
    filled: true,
    fillColor: AppColors.fillColor,
  ),
);


class FontFamily {
  static const String russoOne = 'RussoOne';
}