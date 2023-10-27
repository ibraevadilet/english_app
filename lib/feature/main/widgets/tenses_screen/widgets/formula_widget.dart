import 'package:flutter/material.dart';

class FormulaWidget extends StatelessWidget {
  const FormulaWidget(
    this.text, {
    Key? key,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 18),
    );
  }
}
