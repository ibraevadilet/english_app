import 'package:english_app/components/animation.dart';
import 'package:english_app/components/app_indicator.dart';
import 'package:english_app/components/app_unfocuser.dart';
import 'package:english_app/components/container_with_background_decoration.dart';
import 'package:english_app/components/custom_app_bar.dart';
import 'package:english_app/components/finder_text_field.dart';
import 'package:english_app/components/list_view_item_card/list_view_item_card.dart';
import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/core/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllWordsScreen extends StatelessWidget {
  const AllWordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'All Words'),
      body: Column(
        children: [
          FinderTextField(
            onChange: (value) =>
                context.read<WordsCubit>().getAllWords(searhText: value),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: BackGroundDecoration(
              child: NotificationListener<UserScrollNotification>(
                onNotification: (UserScrollNotification notification) {
                  if (notification.direction == ScrollDirection.forward ||
                      notification.direction == ScrollDirection.reverse) {
                    scrollDirectionNotifier.value = notification.direction;
                  }
                  return true;
                },
                child: AppUnfocuser(
                  child: BlocBuilder<WordsCubit, WordsState>(
                    builder: (context, state) {
                      return state.when(
                        loading: () => const AppIndicator(),
                        success: (model) => model.isEmpty
                            ? const Center(
                                child: Text(
                                  'У вас нет слов',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : ListView.separated(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                itemCount: model.length,
                                separatorBuilder: (context, index) =>
                                    const SizedBox(height: 15),
                                itemBuilder: (context, index) =>
                                    ValueListenableBuilder(
                                  valueListenable: scrollDirectionNotifier,
                                  child: ListViewItemCard(model: model[index]),
                                  builder: (context,
                                      ScrollDirection scrollDirection, child) {
                                    return CardsAnimation(
                                      scrollDirection: scrollDirection,
                                      child: child!,
                                    );
                                  },
                                ),
                              ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
