part of 'words_cubit.dart';

@freezed
class WordsState with _$WordsState {
  const factory WordsState.success(List<WordsModel> model) = _Success;
  const factory WordsState.loading() = _Loading;
}
