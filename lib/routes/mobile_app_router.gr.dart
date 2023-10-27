// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;

import '../components/bottom_navigator.dart' as _i3;
import '../feature/all_words/all_words_screen.dart' as _i7;
import '../feature/basket/basket_screen.dart' as _i8;
import '../feature/favorite/favorite_screen.dart' as _i6;
import '../feature/main/main_screen.dart' as _i5;
import '../feature/main/widgets/tenses_screen/widgets/detail_tense_screen.dart'
    as _i2;
import '../feature/splash/splash_screen.dart' as _i1;
import 'mobile_app_router.dart' as _i4;

class MobileAppRouter extends _i9.RootStackRouter {
  MobileAppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
      );
    },
    DetailTenseScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailTenseScreenRouteArgs>();
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailTenseScreen(
          tense: args.tense,
          key: args.key,
        ),
      );
    },
    BottomNavigatorRoute.name: (routeData) {
      return _i9.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.BottomNavigator(),
      );
    },
    MainScreenNavigator.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    FavoriteScreenNavigator.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    AllWordsScreenNavigator.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    BasketScreenNavigator.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i5.MainScreen(),
      );
    },
    FavoriteScreenRoute.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i6.FavoriteScreen(),
      );
    },
    AllWordsScreenRoute.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i7.AllWordsScreen(),
      );
    },
    BasketScreenRoute.name: (routeData) {
      return _i9.CupertinoPageX<dynamic>(
        routeData: routeData,
        child: const _i8.BasketScreen(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          SplashScreenRoute.name,
          path: '/',
        ),
        _i9.RouteConfig(
          DetailTenseScreenRoute.name,
          path: 'DetailTenseScreen',
        ),
        _i9.RouteConfig(
          BottomNavigatorRoute.name,
          path: '/navigator',
          children: [
            _i9.RouteConfig(
              MainScreenNavigator.name,
              path: 'main',
              parent: BottomNavigatorRoute.name,
              children: [
                _i9.RouteConfig(
                  MainScreenRoute.name,
                  path: '',
                  parent: MainScreenNavigator.name,
                ),
                _i9.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: MainScreenNavigator.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i9.RouteConfig(
              FavoriteScreenNavigator.name,
              path: 'favorite',
              parent: BottomNavigatorRoute.name,
              children: [
                _i9.RouteConfig(
                  FavoriteScreenRoute.name,
                  path: '',
                  parent: FavoriteScreenNavigator.name,
                ),
                _i9.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: FavoriteScreenNavigator.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i9.RouteConfig(
              AllWordsScreenNavigator.name,
              path: 'all_words',
              parent: BottomNavigatorRoute.name,
              children: [
                _i9.RouteConfig(
                  AllWordsScreenRoute.name,
                  path: '',
                  parent: AllWordsScreenNavigator.name,
                ),
                _i9.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: AllWordsScreenNavigator.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i9.RouteConfig(
              BasketScreenNavigator.name,
              path: 'basket',
              parent: BottomNavigatorRoute.name,
              children: [
                _i9.RouteConfig(
                  BasketScreenRoute.name,
                  path: '',
                  parent: BasketScreenNavigator.name,
                ),
                _i9.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: BasketScreenNavigator.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreenRoute extends _i9.PageRouteInfo<void> {
  const SplashScreenRoute()
      : super(
          SplashScreenRoute.name,
          path: '/',
        );

  static const String name = 'SplashScreenRoute';
}

/// generated route for
/// [_i2.DetailTenseScreen]
class DetailTenseScreenRoute
    extends _i9.PageRouteInfo<DetailTenseScreenRouteArgs> {
  DetailTenseScreenRoute({
    required String tense,
    _i10.Key? key,
  }) : super(
          DetailTenseScreenRoute.name,
          path: 'DetailTenseScreen',
          args: DetailTenseScreenRouteArgs(
            tense: tense,
            key: key,
          ),
        );

  static const String name = 'DetailTenseScreenRoute';
}

class DetailTenseScreenRouteArgs {
  const DetailTenseScreenRouteArgs({
    required this.tense,
    this.key,
  });

  final String tense;

  final _i10.Key? key;

  @override
  String toString() {
    return 'DetailTenseScreenRouteArgs{tense: $tense, key: $key}';
  }
}

/// generated route for
/// [_i3.BottomNavigator]
class BottomNavigatorRoute extends _i9.PageRouteInfo<void> {
  const BottomNavigatorRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BottomNavigatorRoute.name,
          path: '/navigator',
          initialChildren: children,
        );

  static const String name = 'BottomNavigatorRoute';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class MainScreenNavigator extends _i9.PageRouteInfo<void> {
  const MainScreenNavigator({List<_i9.PageRouteInfo>? children})
      : super(
          MainScreenNavigator.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainScreenNavigator';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class FavoriteScreenNavigator extends _i9.PageRouteInfo<void> {
  const FavoriteScreenNavigator({List<_i9.PageRouteInfo>? children})
      : super(
          FavoriteScreenNavigator.name,
          path: 'favorite',
          initialChildren: children,
        );

  static const String name = 'FavoriteScreenNavigator';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class AllWordsScreenNavigator extends _i9.PageRouteInfo<void> {
  const AllWordsScreenNavigator({List<_i9.PageRouteInfo>? children})
      : super(
          AllWordsScreenNavigator.name,
          path: 'all_words',
          initialChildren: children,
        );

  static const String name = 'AllWordsScreenNavigator';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class BasketScreenNavigator extends _i9.PageRouteInfo<void> {
  const BasketScreenNavigator({List<_i9.PageRouteInfo>? children})
      : super(
          BasketScreenNavigator.name,
          path: 'basket',
          initialChildren: children,
        );

  static const String name = 'BasketScreenNavigator';
}

/// generated route for
/// [_i5.MainScreen]
class MainScreenRoute extends _i9.PageRouteInfo<void> {
  const MainScreenRoute()
      : super(
          MainScreenRoute.name,
          path: '',
        );

  static const String name = 'MainScreenRoute';
}

/// generated route for
/// [_i6.FavoriteScreen]
class FavoriteScreenRoute extends _i9.PageRouteInfo<void> {
  const FavoriteScreenRoute()
      : super(
          FavoriteScreenRoute.name,
          path: '',
        );

  static const String name = 'FavoriteScreenRoute';
}

/// generated route for
/// [_i7.AllWordsScreen]
class AllWordsScreenRoute extends _i9.PageRouteInfo<void> {
  const AllWordsScreenRoute()
      : super(
          AllWordsScreenRoute.name,
          path: '',
        );

  static const String name = 'AllWordsScreenRoute';
}

/// generated route for
/// [_i8.BasketScreen]
class BasketScreenRoute extends _i9.PageRouteInfo<void> {
  const BasketScreenRoute()
      : super(
          BasketScreenRoute.name,
          path: '',
        );

  static const String name = 'BasketScreenRoute';
}
