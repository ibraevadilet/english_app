import 'package:english_app/components/app_unfocuser.dart';
import 'package:english_app/components/list_view_item_card/widgets/container_decoration.dart';
import 'package:english_app/feature/online_transator/translate_cubit/translate_cubit.dart';
import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnlineTranslatorScreen extends StatelessWidget {
  const OnlineTranslatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TranslateCubit(),
      child: AppUnfocuser(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Builder(
                builder: (context) => TextFormField(
                  style: const TextStyle(color: AppColors.colorBlack),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[а-яА-Я]'))
                  ],
                  decoration: const InputDecoration(
                    hintText: 'Enter english word',
                  ),
                  onChanged: (String value) =>
                      context.read<TranslateCubit>().translate(text: value),
                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<TranslateCubit, TranslateState>(
                builder: (context, state) => state.when(
                  initial: (text) => Container(
                    alignment: Alignment.center,
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: containerDecoration,
                    child: Text(text),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
