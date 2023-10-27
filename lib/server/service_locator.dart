import 'package:english_app/components/favorite_icon/cubit/icon_cubit.dart';
import 'package:english_app/components/list_view_item_card/cubit/item_card_cubit.dart';
import 'package:english_app/components/universal_repo/bloc/words_cubit/words_cubit.dart';
import 'package:english_app/components/universal_repo/data/words_model/words_model.dart';
import 'package:english_app/components/universal_repo/data/words_repo_impl.dart';
import 'package:english_app/components/universal_repo/domain/words_repo.dart';
import 'package:english_app/components/universal_repo/domain/words_use_case.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

final sl = GetIt.instance;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(WordsModelAdapter());
  final box = await Hive.openBox<WordsModel>('wordsBox');
  sl.registerLazySingleton(() => box);

  /// Repository
  sl.registerLazySingleton<WordsRepo>(
    () => WordsRepoImpl(box: sl()),
  );

  /// UseCases
  sl.registerLazySingleton<WordsUseCase>(
    () => WordsUseCase(
      repo: sl(),
    ),
  );

  /// BLoCs / Cubits

  sl.registerFactory(
    () => WordsCubit(
      useCase: sl(),
    ),
  );

  sl.registerFactory(
    () => IconCubit(useCase: sl()),
  );
  sl.registerFactory(
    () => ItemCardCubit(),
  );
}
