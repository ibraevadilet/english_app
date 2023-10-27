import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';
import 'package:english_app/components/universal_repo/domain/words_use_case.dart';
import 'package:english_app/core/app_enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'words_state.dart';
part 'words_cubit.freezed.dart';

class WordsCubit extends Cubit<WordsState> {
  WordsCubit({required this.useCase}) : super(const WordsState.success([]));
  final WordsUseCase useCase;

  Future getWordsByDay() async {
    emit(const WordsState.loading());
    emit(WordsState.success(await useCase.getWordsByDay()));
  }

  Future getAllWords({String? searhText}) async {
    emit(const WordsState.loading());
    emit(WordsState.success(await useCase.getAllWords(searhText: searhText)));
  }

  Future getFavoriteWords() async {
    emit(const WordsState.loading());
    emit(WordsState.success(await useCase.getFavoriteWords()));
  }

  Future getWordsInBasket() async {
    emit(const WordsState.loading());
    emit(WordsState.success(await useCase.getWordsInBasket()));
  }

  Future deleteWords({
    required int id,
  }) async {
    emit(const WordsState.loading());
    await useCase.deleteWords(id);
    emit(WordsState.success(await getWordsForDifferentEnums()));
  }

  Future addWords({required String english, required String russian}) async {
    emit(const WordsState.loading());
    await useCase.addWords(english: english, russian: russian);
    emit(WordsState.success(await useCase.getWordsByDay()));
  }

  Future addToBasket({
    required int id,
  }) async {
    emit(const WordsState.loading());
    await useCase.addToBasket(id);
    emit(WordsState.success(await getWordsForDifferentEnums()));
  }

  Future deleteFromBasket({
    required int id,
  }) async {
    emit(const WordsState.loading());
    await useCase.removeFromBasket(id);
    emit(WordsState.success(await getWordsForDifferentEnums()));
  }

  Future editWords({
    required String english,
    required String russian,
    required int id,
  }) async {
    emit(const WordsState.loading());
    await useCase.editWords(english: english, russian: russian, id: id);
    emit(WordsState.success(await getWordsForDifferentEnums()));
  }

  Future getWordsForDifferentEnums() async {
    switch (appWhatFromEnum) {
      case AppWhatFromEnum.favorite:
        return await useCase.getFavoriteWords();
      case AppWhatFromEnum.day:
        return await useCase.getWordsByDay();

      case AppWhatFromEnum.all:
        return await useCase.getAllWords();
      default:
        return await useCase.getWordsInBasket();
    }
  }
}

//////////////////////////////////

