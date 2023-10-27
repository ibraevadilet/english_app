import 'package:english_app/components/universal_repo/domain/words_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'icon_state.dart';
part 'icon_cubit.freezed.dart';

class IconCubit extends Cubit<IconState> {
  IconCubit({required this.useCase}) : super(const IconState.initial(false));
  final WordsUseCase useCase;
  Future<bool> getIsFavorite(bool isFavorite, int id) async {
    await useCase.doFavoriteWord(isFavorite, id);
    emit(IconState.initial(isFavorite));
    return isFavorite;
  }
}
