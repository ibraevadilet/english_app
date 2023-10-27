import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/core/text_constants.dart';
import 'package:english_app/feature/main/cubit/drower_cubit.dart';
import 'package:english_app/feature/main/widgets/show_calendar.dart';
import 'package:english_app/feature/main/widgets/sort_cubit/sort_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DrowerCubit, DrowerState>(
      builder: (context, state) {
        return AppBar(
          title: state.index == 0
              ? ValueListenableBuilder(
                  valueListenable: AppTextConstants.toDayShow,
                  builder: (context, _, child) => TextButton(
                      onPressed: () => showCalendar(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppTextConstants.toDayShow.value,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      )))
              : state.index == 1
                  ? const Text('Basic Tenses')
                  : state.index == 2
                      ? const Text('Irregular Verbs')
                      : null,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () => context
                .read<DrowerCubit>()
                .getValue(state.value, index: state.index),
            icon: Icon(
              state.value == 0 ? Icons.menu : Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          actions: state.index == 0
              ? [
                  BlocProvider(
                    create: (context) => SortCubit(),
                    child: BlocBuilder<SortCubit, SortState>(
                      builder: (context, state) {
                        return IconButton(
                          onPressed: () {
                            context
                                .read<SortCubit>()
                                .getNumber(state.sortNumber);
                            context.read<WordsCubit>().getWordsByDay();
                          },
                          icon: Icon(
                            typeOfIcon(state.sortNumber),
                            color: Colors.white,
                          ),
                        );
                      },
                    ),
                  )
                ]
              : null,
        );
      },
    );
  }
}

typeOfIcon(int number) {
  switch (number) {
    case 1:
      return Icons.format_align_center;
    case 2:
      return Icons.sort_by_alpha_outlined;
    case 0:
      return Icons.sort;
  }
}
