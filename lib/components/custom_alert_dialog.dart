import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({required this.child, Key? key, this.color})
      : super(key: key);
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      contentPadding: const EdgeInsets.all(15),
      insetPadding: const EdgeInsets.symmetric(horizontal: 12),
      content: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      ),
    );
  }
}
