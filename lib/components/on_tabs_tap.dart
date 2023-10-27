import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/core/app_enum.dart';
import 'package:english_app/core/text_constants.dart';
import 'package:english_app/routes/mobile_app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

onTabsTap(TabsRouter tabsRouter, int index, BuildContext context) {
  switch (index) {
    case 0:
      context.read<WordsCubit>().getWordsByDay();
      tabsRouter.setActiveIndex(index);
      appWhatFromEnum = AppWhatFromEnum.day;
      AppTextConstants.size.value = 60;
      break;
    case 1:
      context.read<WordsCubit>().getFavoriteWords();
      tabsRouter.setActiveIndex(index);
      appWhatFromEnum = AppWhatFromEnum.favorite;
      AppTextConstants.size.value = 0;
      break;
    case 2:
      context.read<WordsCubit>().getAllWords();
      tabsRouter.setActiveIndex(index);
      appWhatFromEnum = AppWhatFromEnum.all;
      AppTextConstants.size.value = 0;
      break;
    default:
      context.read<WordsCubit>().getWordsInBasket();
      tabsRouter.setActiveIndex(index);
      appWhatFromEnum = AppWhatFromEnum.basket;
      AppTextConstants.size.value = 0;
      break;
  }
}
