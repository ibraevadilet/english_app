import 'package:english_app/feature/main/widgets/tenses_screen/widgets/formula_widget.dart';
import 'package:flutter/material.dart';

Widget affirmative(String tense) {
  switch (tense) {
    case 'Present Simple':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormulaWidget('S + V1 (s/es) + O'),
          FormulaWidget('S + am / is / are + O'),
        ],
      );
    case 'Past Simple':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormulaWidget('S + V2'),
          FormulaWidget('S + was / were'),
        ],
      );
    case 'Future Simple':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormulaWidget('S + will / shall + be + compliment'),
          FormulaWidget('S + will / will + V1 + O'),
        ],
      );
    case 'Present Continuous':
      return const FormulaWidget('S + is / am / are + V1-ing + O');
    case 'Past Continuous':
      return const FormulaWidget('S + was / were + V1-ing + O');
    case 'Future Continuous':
      return const FormulaWidget('S + will / shall + be + V1-ing + O');
    case 'Present Perfect':
      return const FormulaWidget('S + has / have + V3 + O');
    case 'Past Perfect':
      return const FormulaWidget('S + had + V3 + O');
    case 'Future Perfect':
      return const FormulaWidget('S + will / shall + have + V3 + O');
    case 'Present Perfect Continuous':
      return const FormulaWidget('S + has/have + been + V1-ing + O');
    case 'Past Perfect Continuous':
      return const FormulaWidget('S + had + been + V1-ing + O');
    case 'Future Perfect Continuous':
      return const FormulaWidget(
          'S + will / shall + have + been + \nV1-ing + O');
    default:
      return const FormulaWidget('');
  }
}

Widget negative(String tense) {
  switch (tense) {
    case 'Present Simple':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormulaWidget('S + do / does + not + V1 + O'),
          FormulaWidget('S + am / is / are + V1 + O'),
        ],
      );
    case 'Past Simple':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormulaWidget('S + did + not + V2'),
          FormulaWidget('S + was / were + not + V1'),
        ],
      );
    case 'Future Simple':
      return const FormulaWidget('S + will / shall + not + V1');
    case 'Present Continuous':
      return const FormulaWidget('S + is / am / are + not + V1-ing + O');
    case 'Past Continuous':
      return const FormulaWidget('S + was / were + not + V1-ing');
    case 'Future Continuous':
      return const FormulaWidget('S + will / shall + not + be + V1-ing');
    case 'Present Perfect':
      return const FormulaWidget('S + has / have + not + V3 + O');
    case 'Past Perfect':
      return const FormulaWidget('S + had + not + V3 + O');
    case 'Future Perfect':
      return const FormulaWidget('S + will / shall + not + have + V3 + O');
    case 'Present Perfect Continuous':
      return const FormulaWidget('S + has / have + not + V1-ing + O');
    case 'Past Perfect Continuous':
      return const FormulaWidget('S + had + not + been + V1-ing + O');
    case 'Future Perfect Continuous':
      return const FormulaWidget(
          'S + will / shall + not + have + been + \nV1-ing + O');
    default:
      return const FormulaWidget('');
  }
}

Widget question(String tense) {
  switch (tense) {
    case 'Present Simple':
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          FormulaWidget('Do / Does + S + V1 + O?'),
          FormulaWidget('am / is / are + S + V1 + O?'),
        ],
      );
    case 'Past Simple':
      return const FormulaWidget('Did + S + V1 + O?');
    case 'Future Simple':
      return const FormulaWidget('Will / Shall + S + V1 + O?');
    case 'Present Continuous':
      return const FormulaWidget('am / is / are + S + V-ing + O?');
    case 'Past Continuous':
      return const FormulaWidget('was / were + S + V1-ing + O?');
    case 'Future Continuous':
      return const FormulaWidget('will / shall + S + be + V1-ing + O?');
    case 'Present Perfect':
      return const FormulaWidget('Have / Has + S + V3 + O?');
    case 'Past Perfect':
      return const FormulaWidget('Had + S + V3 + O?');
    case 'Future Perfect':
      return const FormulaWidget('Will / Shall + S + have + V3 + O?');
    case 'Present Perfect Continuous':
      return const FormulaWidget('Has / Have + S + been + \nV1-ing + O?');
    case 'Past Perfect Continuous':
      return const FormulaWidget('Had + S + been + V1-ing + O?');
    case 'Future Perfect Continuous':
      return const FormulaWidget(
          'Will / shall + S + have + been + \nV1-ing + O?');
    default:
      return const FormulaWidget('');
  }
}
