import 'package:english_app/components/list_view_item_card/widgets/container_decoration.dart';
import 'package:english_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class DetailCardWidget extends StatelessWidget {
  const DetailCardWidget({
    required this.image,
    required this.type,
    required this.formula,
    this.isQuestion = false,
    Key? key,
  }) : super(key: key);
  final String image;
  final String type;
  final bool isQuestion;
  final Widget formula;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            decoration: containerDecoration,
            width: MediaQuery.of(context).size.width - 60,
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Text(
                  type,
                  style: const TextStyle(
                      fontSize: 25, fontFamily: FontFamily.russoOne),
                ),
                const SizedBox(height: 10),
                formula
              ],
            ),
          ),
          Positioned(
            right: isQuestion ? 20 : 0,
            bottom: 0,
            child: Stack(
              children: [
                Image.asset(
                  image,
                  color: Colors.white,
                  height: 105,
                ),
                Image.asset(
                  image,
                  color: Colors.grey.shade400,
                  height: 100,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
