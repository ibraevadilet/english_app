import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BackGroundDecoration extends StatelessWidget {
  const BackGroundDecoration({this.value = 0, required this.child, Key? key})
      : super(key: key);
  final Widget child;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: value == 1
            ? const BorderRadius.only(
                topLeft: Radius.circular(16), bottomLeft: Radius.circular(16))
            : BorderRadius.circular(0),
        gradient: const LinearGradient(
          colors: [AppColors.backgroundColor, AppColors.backgroundColor2],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: child,
    );
  }
}
