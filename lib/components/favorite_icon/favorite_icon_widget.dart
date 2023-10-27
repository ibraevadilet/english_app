import 'package:english_app/components/favorite_icon/cubit/icon_cubit.dart';
import 'package:english_app/server/service_locator.dart';
import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:like_button/like_button.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({required this.isFavorite, required this.id, Key? key})
      : super(key: key);
  final bool isFavorite;
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<IconCubit>()..getIsFavorite(isFavorite, id),
      child: BlocBuilder<IconCubit, IconState>(
        builder: (context, state) => state.when(
          initial: (isFavorite) => LikeButton(
            onTap: (_) =>
                context.read<IconCubit>().getIsFavorite(!isFavorite, id),
            bubblesColor: const BubblesColor(
              dotPrimaryColor: AppColors.colorEC3A4D,
              dotSecondaryColor: AppColors.colorEC3A4D,
            ),
            likeBuilder: (bool isLiked) => Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline,
                size: 30,
                color: AppColors.colorEC3A4D,
              ),
          ),
        ),
      ),
    );
  }
}
