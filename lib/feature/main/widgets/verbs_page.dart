import 'package:english_app/core/app_images.dart';
import 'package:flutter/material.dart';

class VerbsPage extends StatelessWidget {
  const VerbsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            AppImages.verbs1,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppImages.verbs2,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppImages.verbs3,
            fit: BoxFit.cover,
          ),
          Image.asset(
            AppImages.verbs4,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
