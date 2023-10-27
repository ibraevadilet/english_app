import 'package:english_app/components/custom_alert_dialog.dart';
import 'package:english_app/components/dialog_button.dart';
import 'package:english_app/components/favorite_icon/favorite_icon_widget.dart';
import 'package:english_app/components/list_view_item_card/widgets/add_redactor_dialog.dart';
import 'package:english_app/components/list_view_item_card/widgets/container_child_text.dart';
import 'package:english_app/components/list_view_item_card/widgets/container_decoration.dart';
import 'package:english_app/components/list_view_item_card/widgets/dismis_widget.dart';
import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';
import 'package:english_app/core/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewItemCard extends StatelessWidget {
  const ListViewItemCard({
    required this.model,
    Key? key,
  }) : super(key: key);

  final WordsModel model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () => showDialog(
        context: context,
        builder: (context) => CustomAlertDialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Do you really want to delete this word?'),
              const SizedBox(height: 15),
              Row(
                children: [
                  DialogButton(
                    onTap: () => Navigator.pop(context),
                    color: Colors.green,
                  ),
                  const SizedBox(width: 5),
                  DialogButton(
                    onTap: () {
                      context.read<WordsCubit>().deleteWords(
                            id: model.id,
                          );
                      Navigator.pop(context);
                    },
                    title: 'Yes',
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      onDoubleTap: () => addDeleteDialog(
          context: context,
          title: 'Redactor word',
          enums: AppRedactorEnum.redactor,
          model: model),
      child: DismissibleWidget(
        isInBasket: model.isInBasket,
        id: model.id,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: model.isInBasket
              ? containerDecoration.copyWith(color: Colors.grey.shade400)
              : containerDecoration,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ContainerChildText(model: model),
              Text('(${model.createDate})'),
              FavoriteWidget(
                isFavorite: model.isFavorite,
                id: model.id,
              )
            ],
          ),
        ),
      ),
    );
  }
}
