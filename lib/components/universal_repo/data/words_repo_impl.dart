import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';
import 'package:english_app/components/universal_repo/domain/words_repo.dart';
import 'package:english_app/core/app_enum.dart';
import 'package:english_app/core/date_time.dart';
import 'package:english_app/core/text_constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WordsRepoImpl implements WordsRepo {
  WordsRepoImpl({required this.box});
  final Box<WordsModel> box;
  @override
  Future<List<WordsModel>> getWordsByDay() async {
    if (AppTextConstants.sortNumber == 1) {
      List<WordsModel> sortByAZ = returnWordsBySortDay(box.values.toList());
      sortByAZ.sort(
        (a, b) => a.english.toString().toLowerCase().compareTo(
              b.english.toString().toLowerCase(),
            ),
      );
      return sortByAZ;
    } else if (AppTextConstants.sortNumber == 2) {
      List<WordsModel> sortByReversed =
          returnWordsBySortDay(box.values.toList());
      Iterable<WordsModel> sortByAZ = sortByReversed.reversed;

      return sortByAZ.toList();
    } else {
      return returnWordsBySortDay(box.values.toList());
    }
  }

  @override
  Future<List<WordsModel>> getAllWords({String? searhText}) async {
    List<WordsModel> allWords = box.values.toList();
    if (searhText != null) {
      allWords.removeWhere(
        (element) =>
            !element.english.toLowerCase().contains(searhText.toLowerCase()) &&
            !element.russian.toLowerCase().contains(searhText.toLowerCase()),
      );
    }

    return allWords;
  }

  @override
  Future<List<WordsModel>> getFavoriteWords() async {
    List<WordsModel> allWords = box.values.toList();
    allWords.removeWhere(
        (element) => element.isFavorite == false || element.isInBasket == true);

    return allWords;
  }

  @override
  Future<List<WordsModel>> getWordsInBasket() async {
    List<WordsModel> allWords = box.values.toList();
    allWords.removeWhere((element) => element.isInBasket == false);

    return allWords;
  }

  @override
  Future doFavorite(bool isFavorite, int id) async {
    var word = box.values.singleWhere((element) => element.id == id);
    word.isFavorite = isFavorite;
    await word.save();
    await box.compact();
  }

  @override
  Future deleteWords(int id) async {
    await box.delete(box.values.singleWhere((element) => element.id == id).key);
    await box.compact();
  }

  @override
  Future addToBasket(int id) async {
    var word = box.values.singleWhere((element) => element.id == id);
    word.isInBasket = true;
    await word.save();
    await box.compact();
  }

  @override
  Future removeFromBasket(int id) async {
    var word = box.values.singleWhere((element) => element.id == id);
    word.isInBasket = false;
    await word.save();
    await box.compact();
  }

  @override
  Future addWords({required WordsModel model}) async {
    await box.add(model);
  }

  @override
  Future editWords(
      {required String english,
      required String russian,
      required int id}) async {
    var word = box.values.singleWhere((element) => element.id == id);

    word.english = english;
    word.russian = russian;
    await word.save();
    await box.compact();
  }
}

returnWordsBySortDay(List<WordsModel> allWords) {
  if (isContains()) {
    allWords.removeWhere(
        (element) => element.createDate != today || element.isInBasket == true);
  } else {
    allWords.removeWhere((element) =>
        element.createDate != AppTextConstants.toDayShow.value ||
        element.isInBasket == true);
  }

  return allWords;
}
