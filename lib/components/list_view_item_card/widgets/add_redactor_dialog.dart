import 'package:english_app/components/custom_alert_dialog.dart';
import 'package:english_app/components/custom_text_field.dart';
import 'package:english_app/components/dialog_button.dart';
import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';
import 'package:english_app/core/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

addDeleteDialog(
    {required BuildContext context,
    required String title,
    required AppRedactorEnum enums,
    WordsModel? model}) async {
  final TextEditingController englishController = TextEditingController();
  final TextEditingController russianController = TextEditingController();

  if (enums == AppRedactorEnum.redactor && model != null) {
    englishController.text = model.english;
    russianController.text = model.russian;
  }

  await showDialog(
    context: context,
    builder: (context) => CustomAlertDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'English',
            controller: englishController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[а-яА-Я]'))
            ],
            autoFocus: true,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Русский',
            controller: russianController,
            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r'[a-zA-Z]'))
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              DialogButton(onTap: () => Navigator.pop(context)),
              const SizedBox(width: 10),
              DialogButton(
                onTap: () {
                  if (enums == AppRedactorEnum.add) {
                    if (englishController.text != '' &&
                        russianController.text != '') {
                      context.read<WordsCubit>().addWords(
                          english: englishController.text,
                          russian: russianController.text);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text(
                            'Вы не заполнили все поля',
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Ok'),
                            ),
                          ],
                        ),
                      );
                    }
                  } else {
                    context.read<WordsCubit>().editWords(
                          english: englishController.text,
                          russian: russianController.text,
                          id: model!.id,
                        );
                  }
                  Navigator.pop(context);
                },
                title: enums == AppRedactorEnum.add ? 'Add new word' : 'Save',
                color: Colors.green,
              )
            ],
          )
        ],
      ),
    ),
  ).then((value) => context.read<WordsCubit>().getWordsForDifferentEnums());
  // whatFromEnum != null && whatFromEnum == AppWhatFromEnum.favorite
  //     ? context.read<WordsCubit>().getFavoriteWords()
  //     : whatFromEnum != null && whatFromEnum == AppWhatFromEnum.all
  //         ? context.read<WordsCubit>().getAllWords()
  //         : whatFromEnum != null && whatFromEnum == AppWhatFromEnum.basket
  //             ? context.read<WordsCubit>().getWordsInBasket()
  //             : context.read<WordsCubit>().getWordsByDay());
}
