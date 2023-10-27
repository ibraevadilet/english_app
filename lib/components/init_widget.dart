import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/server/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InitWidget extends StatelessWidget {
  const InitWidget({
    required this.child,
    Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<WordsCubit>()..getWordsByDay(),
      child: child,
    );
  }
}
