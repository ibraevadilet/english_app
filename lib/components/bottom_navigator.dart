import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:english_app/components/floating_action_button.dart';
import 'package:english_app/components/on_tabs_tap.dart';
import 'package:english_app/routes/mobile_app_router.dart';
import 'package:english_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: AppColors.backgroundColor,
      routes: const [
        MainScreenNavigator(),
        FavoriteScreenNavigator(),
        AllWordsScreenNavigator(),
        BasketScreenNavigator(),
      ],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const FloatingActionButtonWidget(),
      bottomNavigationBuilder: (_, tabsRouter) => CurvedNavigationBar(
        backgroundColor: AppColors.backgroundColor,
        color: AppColors.bottomColor,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) => onTabsTap(tabsRouter, index, context),
        items: const [
          Icon(Icons.today, color: AppColors.colorWhite),
          Icon(Icons.favorite_border, color: AppColors.colorWhite),
          Icon(Icons.all_inbox, color: AppColors.colorWhite),
          Icon(Icons.auto_delete_outlined, color: AppColors.colorWhite),
        ],
      ),
    );
  }
}
