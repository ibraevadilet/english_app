import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.hintText,
    required this.controller,
    required this.inputFormatters,
    this.autoFocus = false,
    Key? key,
  }) : super(key: key);
  final String hintText;
  final TextEditingController controller;
  final List<TextInputFormatter> inputFormatters;
  final bool autoFocus;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: AppColors.colorBlack),
      controller: controller,
      autofocus: autoFocus,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
