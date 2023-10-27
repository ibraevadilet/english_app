import 'package:english_app/components/container_with_background_decoration.dart';
import 'package:english_app/core/app_images.dart';
import 'package:english_app/feature/main/widgets/tenses_screen/widgets/detail_card_widget.dart';
import 'package:english_app/feature/main/widgets/tenses_screen/widgets/times_function_widget.dart';
import 'package:flutter/material.dart';

class DetailTenseScreen extends StatelessWidget {
  const DetailTenseScreen({required this.tense, Key? key}) : super(key: key);
  final String tense;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tense),
        elevation: 0,
        centerTitle: true,
      ),
      body: BackGroundDecoration(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              DetailCardWidget(
                image: AppImages.plusIcon,
                type: 'Affirmative',
                formula: affirmative(tense),
              ),
              const SizedBox(height: 20),
              DetailCardWidget(
                image: AppImages.minusIcon,
                type: 'Negative',
                formula: negative(tense),
              ),
              const SizedBox(height: 20),
              DetailCardWidget(
                image: AppImages.questionIcon,
                type: 'Question',
                formula: question(tense),
                isQuestion: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
