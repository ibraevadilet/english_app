import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';

abstract class WordsRepo {
  Future<List<WordsModel>> getWordsByDay();
  Future<List<WordsModel>> getAllWords({String? searhText});
  Future<List<WordsModel>> getFavoriteWords();
  Future<List<WordsModel>> getWordsInBasket();
  Future deleteWords(int id);
  Future addToBasket(int id);
  Future removeFromBasket(int id);
  Future doFavorite(bool isFavorite, int id);
  Future addWords({required WordsModel model});
  Future editWords(
      {required String english, required String russian, required int id});
}
