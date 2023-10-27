import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_card_state.dart';
part 'item_card_cubit.freezed.dart';

class ItemCardCubit extends Cubit<ItemCardState> {
  ItemCardCubit() : super(const ItemCardState.initial(false)) {
    getIsOpen(false);
  }

  getIsOpen(bool isOpen) {
    emit(ItemCardState.initial(isOpen));
  }
}
