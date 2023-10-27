import 'package:english_app/feature/main/widgets/tenses_screen/widgets/name_tenses_card.dart';
import 'package:flutter/material.dart';

class TimesRowWidget extends StatelessWidget {
  const TimesRowWidget({
    required this.tense,
    Key? key,
  }) : super(key: key);
  final String tense;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NameTensesCad(time: 'Present', tense: tense),
        const SizedBox(width: 10),
        NameTensesCad(time: 'Past', tense: tense),
        const SizedBox(width: 10),
        NameTensesCad(time: 'Future', tense: tense),
      ],
    );
  }
}
