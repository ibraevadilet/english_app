import 'package:english_app/components/list_view_item_card/widgets/container_decoration.dart';
import 'package:english_app/routes/mobile_app_router.dart';
import 'package:english_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class NameTensesCad extends StatelessWidget {
  const NameTensesCad({
    required this.time,
    required this.tense,
    Key? key,
  }) : super(key: key);
  final String time;
  final String tense;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.router.push(DetailTenseScreenRoute(tense: '$time $tense')),
      child: Container(
        decoration: containerDecoration,
        width: MediaQuery.of(context).size.width / 3 - 12,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              time,
              style: const TextStyle(
                  fontSize: 16, fontFamily: FontFamily.russoOne),
            ),
            Text(
              tense,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18, fontFamily: FontFamily.russoOne),
            ),
          ],
        ),
      ),
    );
  }
}
