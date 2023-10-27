import 'package:english_app/components/list_view_item_card/cubit/item_card_cubit.dart';
import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';
import 'package:english_app/server/service_locator.dart';
import 'package:english_app/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContainerChildText extends StatelessWidget {
  const ContainerChildText({required this.model, Key? key}) : super(key: key);
  final WordsModel model;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocProvider(
        create: (context) => sl<ItemCardCubit>(),
        child: BlocBuilder<ItemCardCubit, ItemCardState>(
          builder: (context, state) => state.when(
            initial: (isOpen) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.english,
                  style: TextStyle(
                    fontSize: 25,
                    color: !model.isInBasket
                        ? Colors.grey.shade400
                        : Colors.grey.shade700,
                    fontFamily: FontFamily.russoOne,
                  ),
                ),
                SizedBox(height: isOpen ? 15 : 0),
                isOpen
                    ? AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              model.russian,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey.shade500,
                                  fontFamily: FontFamily.russoOne),
                            ),
                            IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () => context
                                    .read<ItemCardCubit>()
                                    .getIsOpen(!isOpen),
                                icon: const RotatedBox(
                                    quarterTurns: 1,
                                    child: Icon(Icons.arrow_back_ios_new)))
                          ],
                        ),
                      )
                    : AnimatedSize(
                        duration: const Duration(milliseconds: 200),
                        child: IconButton(
                            onPressed: () => context
                                .read<ItemCardCubit>()
                                .getIsOpen(!isOpen),
                            icon: const RotatedBox(
                                quarterTurns: -1,
                                child: Icon(Icons.arrow_back_ios_new))),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
