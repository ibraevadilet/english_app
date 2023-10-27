import 'package:english_app/core/text_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_state.dart';
part 'sort_cubit.freezed.dart';

class SortCubit extends Cubit<SortState> {
  SortCubit() : super(const SortState.initial(0)) {
    getNumber(0);
  }

  getNumber(int sortNumber) {
    AppTextConstants.sortNumber = sortNumber;
    emit(
      SortState.initial(setNumber(sortNumber)),
    );
  }

  setNumber(int sortNumber) {
    switch (sortNumber) {
      case 0:
        return 1;
      case 1:
        return 2;
      case 2:
        return 0;
    }
  }
}
