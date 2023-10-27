import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:translator/translator.dart';

part 'translate_state.dart';
part 'translate_cubit.freezed.dart';

class TranslateCubit extends Cubit<TranslateState> {
  TranslateCubit()
      : super(const TranslateState.initial(text: 'Введите слово')) {
    translate();
  }

  GoogleTranslator translator = GoogleTranslator();

  translate({String? text}) async {
    if (text != null && text != '' && text.isNotEmpty) {
      final translateWord = await translator.translate(text, to: 'ru');
      emit(TranslateState.initial(text: translateWord.text));
    } else {
      emit(const TranslateState.initial(text: 'Введите слово'));
    }
  }
}
