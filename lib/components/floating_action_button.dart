import 'package:english_app/components/list_view_item_card/widgets/add_redactor_dialog.dart';
import 'package:english_app/core/app_enum.dart';
import 'package:english_app/core/text_constants.dart';
import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppTextConstants.indexOfDrowerMenu,
      builder: (context, int indexOfDrowerMenu, _) {
        return ValueListenableBuilder(
          valueListenable: AppTextConstants.size,
          builder: (context, double value, _) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInQuart,
              width: value,
              height: value,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: indexOfDrowerMenu == 0 && value != 0
                    ? [
                        const BoxShadow(
                          color: AppColors.backgroundColor2,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ]
                    : null,
              ),
              child: indexOfDrowerMenu == 0 && value != 0
                  ? FloatingActionButton(
                      backgroundColor: AppColors.cardColor,
                      child: const Icon(
                        Icons.add,
                        size: 35,
                        color: Colors.white,
                      ),
                      onPressed: () => addDeleteDialog(
                          context: context,
                          title: 'Add new word',
                          enums: AppRedactorEnum.add),
                    )
                  : null,
            );
          },
        );
      },
    );
  }
}
