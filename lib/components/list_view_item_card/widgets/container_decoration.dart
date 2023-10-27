import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

final containerDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  color: AppColors.cardColor,
  boxShadow: const [
    BoxShadow(
      color: AppColors.cardShadow,
      blurRadius: 10,
      offset: Offset(0, 10),
    ),
  ],
);
