import 'package:english_app/core/text_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'drower_state.dart';
part 'drower_cubit.freezed.dart';

class DrowerCubit extends Cubit<DrowerState> {
  DrowerCubit() : super(const DrowerState.initial(0, 0)) {
    getValue(1, index: 0);
  }

  getValue(double value, {int? index}) {
    AppTextConstants.indexOfDrowerMenu.value = index ?? 0;
    emit(DrowerState.initial(value == 0 ? 1 : 0, index ?? 0));
  }
}
