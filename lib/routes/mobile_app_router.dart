import 'package:english_app/components/bottom_navigator.dart';
import 'package:english_app/feature/all_words/all_words_screen.dart';
import 'package:english_app/feature/basket/basket_screen.dart';
import 'package:english_app/feature/favorite/favorite_screen.dart';
import 'package:english_app/feature/main/main_screen.dart';
import 'package:english_app/feature/main/widgets/tenses_screen/widgets/detail_tense_screen.dart';
import 'package:english_app/feature/splash/splash_screen.dart';
import 'package:english_app/routes/mobile_app_router.dart';

export 'package:auto_route/auto_route.dart';

export 'mobile_app_router.gr.dart';

@CupertinoAutoRouter(
  routes: <AutoRoute>[
    AdaptiveRoute(
      page: SplashScreen,
      initial: true,
      path: '/',
    ),
    AdaptiveRoute(
      page: DetailTenseScreen,
      path: 'DetailTenseScreen',
    ),
    
    AdaptiveRoute(
      page: BottomNavigator,
      path: '/navigator',
      children: [
        AutoRoute(
          path: 'main',
          page: EmptyRouterPage,
          name: 'MainScreenNavigator',
          children: [
            AutoRoute(
              path: '',
              page: MainScreen,
            ),
            RedirectRoute(
              path: '*',
              redirectTo: '',
            ),
          ],
        ),
        AutoRoute(
          path: 'favorite',
          page: EmptyRouterPage,
          name: 'FavoriteScreenNavigator',
          children: [
            AutoRoute(
              path: '',
              page: FavoriteScreen,
            ),
            RedirectRoute(
              path: '*',
              redirectTo: '',
            ),
          ],
        ),
        AutoRoute(
          path: 'all_words',
          page: EmptyRouterPage,
          name: 'AllWordsScreenNavigator',
          children: [
            AutoRoute(
              path: '',
              page: AllWordsScreen,
            ),
            RedirectRoute(
              path: '*',
              redirectTo: '',
            ),
          ],
        ),
        AutoRoute(
          path: 'basket',
          page: EmptyRouterPage,
          name: 'BasketScreenNavigator',
          children: [
            AutoRoute(
              path: '',
              page: BasketScreen,
            ),
            RedirectRoute(
              path: '*',
              redirectTo: '',
            ),
          ],
        ),
      ],
    )
  ],
)
class $MobileAppRouter {}
