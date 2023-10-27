import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DismissibleWidget extends StatelessWidget {
  const DismissibleWidget(
      {required this.child,
      required this.id,
      required this.isInBasket,
      Key? key})
      : super(key: key);
  final Widget child;
  final int id;
  final bool isInBasket;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      onDismissed: (direction) => isInBasket
          ? context.read<WordsCubit>().deleteFromBasket(
                id: id,
              )
          : context.read<WordsCubit>().addToBasket(
                id: id,
              ),
      background: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Icon(Icons.auto_delete_outlined, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              isInBasket ? 'Из архива' : 'В архив',
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
      child: child,
    );
  }
}



 