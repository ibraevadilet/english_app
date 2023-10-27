import 'package:flutter/material.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    Key? key,
    this.color = Colors.red,
    this.title = 'Cancel',
    this.height = 50,
    required this.onTap,
  }) : super(key: key);
  final Color color;
  final String title;
  final Function() onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: height,
        child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(color),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: color)))),
            child: Text(title)),
      ),
    );
  }
}
