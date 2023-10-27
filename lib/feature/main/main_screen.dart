import 'dart:math';

import 'package:english_app/components/container_with_background_decoration.dart';
import 'package:english_app/feature/main/widgets/list_words_home_page.dart';
import 'package:english_app/feature/main/widgets/tenses_screen/tenses_screen.dart';
import 'package:english_app/feature/main/widgets/verbs_page.dart';
import 'package:english_app/feature/main/cubit/drower_cubit.dart';
import 'package:english_app/feature/main/widgets/app_bar.dart';
import 'package:english_app/feature/main/widgets/drower_menu.dart';
import 'package:english_app/feature/online_transator/online_translator_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DrowerCubit(),
      child: Scaffold(
        appBar: const MainAppBar(),
        body: Stack(
          children: [
            const DrowerMenu(),
            BlocBuilder<DrowerCubit, DrowerState>(
              builder: (context, state) => GestureDetector(
                onHorizontalDragUpdate: (e) => e.delta.dx > 0
                    ? context
                        .read<DrowerCubit>()
                        .getValue(0, index: state.index)
                    : context
                        .read<DrowerCubit>()
                        .getValue(1, index: state.index),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 0, end: state.value),
                  duration: const Duration(milliseconds: 250),
                  builder: (_, double val, __) => Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..setEntry(0, 3, 200 * val)
                      ..rotateY((pi / 6) * val),
                    child: BackGroundDecoration(
                      value: state.value,
                      child: pages(state.index),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget pages(int index) {
  switch (index) {
    case 1:
      return const TensesScreen();
    case 2:
      return const VerbsPage();
    case 3:
      return const OnlineTranslatorScreen();
    default:
      return const ListWordsHomePage();
  }
}
