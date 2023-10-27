import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:english_app/routes/mobile_app_router.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2400),
        () => context.router.replace(const BottomNavigatorRoute()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/british_flag.json', height: 200),
            const SizedBox(height: 20),
            AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  'English App',
                  textStyle: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.white,
                    Colors.red,

                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
