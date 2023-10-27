import 'package:hive_flutter/hive_flutter.dart';

part 'words_model.g.dart';

@HiveType(typeId: 0)
class WordsModel extends HiveObject {
  @HiveField(0)
  String english;

  @HiveField(1)
  String russian;

  @HiveField(2)
  String createDate;

  @HiveField(3)
  bool isFavorite;

  @HiveField(4)
  bool isInBasket;

  @HiveField(5)
  int id;
  WordsModel(
      {required this.english,
      required this.russian,
      required this.createDate,
      this.isFavorite = false,
      this.isInBasket = false,
      required this.id});

  @override
  String toString() {
    return '$english, $russian, $createDate, $isFavorite, $isInBasket';
  }
}
