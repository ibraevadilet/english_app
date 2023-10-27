import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';
import 'package:english_app/components/universal_repo/domain/words_repo.dart';
import 'package:english_app/core/date_time.dart';
import 'package:english_app/core/text_constants.dart';

class WordsUseCase {
  WordsUseCase({required this.repo});
  final WordsRepo repo;

  Future<List<WordsModel>> getWordsByDay() async {
    return await repo.getWordsByDay();
  }

  Future<List<WordsModel>> getAllWords({String? searhText}) async {
    return await repo.getAllWords(searhText: searhText);
  }

  Future<List<WordsModel>> getFavoriteWords() async {
    return await repo.getFavoriteWords();
  }

  Future doFavoriteWord(bool isFavorite, int id) async {
    await repo.doFavorite(isFavorite, id);
  }

  Future addToBasket(int id) async {
    await repo.addToBasket(id);
  }

  Future removeFromBasket(int id) async {
    await repo.removeFromBasket(id);
  }

  Future<List<WordsModel>> getWordsInBasket() async {
    return await repo.getWordsInBasket();
  }

  Future deleteWords(int id) async {
    await repo.deleteWords(id);
  }

  Future addWords({required String english, required String russian}) async {
    await repo.addWords(
      model: WordsModel(
        english: english,
        russian: russian,
        createDate: AppTextConstants.toDayShow.value.contains('Сегодня')
            ? today
            : AppTextConstants.toDayShow.value,
        id: int.parse(
          DateTime.now().microsecondsSinceEpoch.toString(),
        ),
      ),
    );
  }

  Future editWords(
      {required String english,
      required String russian,
      required int id}) async {
    await repo.editWords(english: english, russian: russian, id: id);
  }
}
