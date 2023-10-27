import 'package:english_app/components/list_view_item_card/widgets/container_decoration.dart';
import 'package:english_app/feature/main/widgets/tenses_screen/widgets/times_row_widget.dart';
import 'package:english_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TensesScreen extends StatelessWidget {
  const TensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 3 - 12,
                decoration: containerDecoration,
                alignment: Alignment.center,
                child: const Text(
                  'Present',
                  style:
                      TextStyle(fontSize: 14, fontFamily: FontFamily.russoOne),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 3 - 12,
                decoration: containerDecoration,
                alignment: Alignment.center,
                child: const Text(
                  'Past',
                  style:
                      TextStyle(fontSize: 14, fontFamily: FontFamily.russoOne),
                ),
              ),
              const SizedBox(width: 10),
              Container(
                height: 30,
                width: MediaQuery.of(context).size.width / 3 - 12,
                decoration: containerDecoration,
                alignment: Alignment.center,
                child: const Text(
                  'Future',
                  style:
                      TextStyle(fontSize: 14, fontFamily: FontFamily.russoOne),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const TimesRowWidget(tense: 'Simple'),
          const SizedBox(height: 20),
          const TimesRowWidget(tense: 'Continuous'),
          const SizedBox(height: 20),
          const TimesRowWidget(tense: 'Perfect'),
          const SizedBox(height: 20),
          const TimesRowWidget(tense: 'Perfect Continuous'),
        ],
      ),
    );
  }
}
