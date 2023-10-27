import 'package:english_app/core/app_images.dart';
import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinderTextField extends StatelessWidget {
  const FinderTextField({required this.onChange, Key? key}) : super(key: key);
  final Function(String value) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
          style: const TextStyle(color: AppColors.colorBlack),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: EdgeInsets.zero,
            hintText: 'Поиск',
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12),
              child: SvgPicture.asset(
                AppImages.finderIcon,
                color: Colors.grey[700],
              ),
            ),
          ),
          onChanged: onChange),
    );
  }
}
