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
import 'package:auto_route/empty_router_widgets.dart' as _i4;
import 'package:flutter/material.dart' as _i10;

import '../screens/auto_tabs_scaffold_page.dart' as _i1;
import '../screens/character_details_page/character_details_page.dart' as _i8;
import '../screens/characters_page/characters_page.dart' as _i7;
import '../screens/home_page/home_page.dart' as _i6;
import '../screens/season_episodes_page/season_episodes_page.dart' as _i3;
import '../screens/seasons_list_page/seasons_list_page.dart' as _i2;
import '../screens/third_page/third_page.dart' as _i5;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i10.GlobalKey<_i10.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AutoTabsScaffoldRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AutoTabsScaffoldPage(),
      );
    },
    SeasonsListRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.SeasonsListPage(),
      );
    },
    SeasonEpisodesPageRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SeasonEpisodesPage(),
      );
    },
    HomePageRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    SecondRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.EmptyRouterPage(),
      );
    },
    ThirdRouter.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.ThirdPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.HomePage(),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.CharactersPage(),
      );
    },
    CharacterDetailsRoute.name: (routeData) {
      return _i9.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.CharacterDetailsPage(),
      );
    },
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(
          AutoTabsScaffoldRoute.name,
          path: '/',
          children: [
            _i9.RouteConfig(
              HomePageRouter.name,
              path: 'home_page',
              parent: AutoTabsScaffoldRoute.name,
              children: [
                _i9.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomePageRouter.name,
                )
              ],
            ),
            _i9.RouteConfig(
              SecondRouter.name,
              path: 'second',
              parent: AutoTabsScaffoldRoute.name,
              children: [
                _i9.RouteConfig(
                  CharactersRoute.name,
                  path: '',
                  parent: SecondRouter.name,
                ),
                _i9.RouteConfig(
                  CharacterDetailsRoute.name,
                  path: 'character_details',
                  parent: SecondRouter.name,
                ),
              ],
            ),
            _i9.RouteConfig(
              ThirdRouter.name,
              path: 'third',
              parent: AutoTabsScaffoldRoute.name,
            ),
          ],
        ),
        _i9.RouteConfig(
          SeasonsListRoute.name,
          path: 'seasons_list',
        ),
        _i9.RouteConfig(
          SeasonEpisodesPageRouter.name,
          path: 'season_episodes_list',
        ),
      ];
}

/// generated route for
/// [_i1.AutoTabsScaffoldPage]
class AutoTabsScaffoldRoute extends _i9.PageRouteInfo<void> {
  const AutoTabsScaffoldRoute({List<_i9.PageRouteInfo>? children})
      : super(
          AutoTabsScaffoldRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'AutoTabsScaffoldRoute';
}

/// generated route for
/// [_i2.SeasonsListPage]
class SeasonsListRoute extends _i9.PageRouteInfo<void> {
  const SeasonsListRoute()
      : super(
          SeasonsListRoute.name,
          path: 'seasons_list',
        );

  static const String name = 'SeasonsListRoute';
}

/// generated route for
/// [_i3.SeasonEpisodesPage]
class SeasonEpisodesPageRouter extends _i9.PageRouteInfo<void> {
  const SeasonEpisodesPageRouter()
      : super(
          SeasonEpisodesPageRouter.name,
          path: 'season_episodes_list',
        );

  static const String name = 'SeasonEpisodesPageRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class HomePageRouter extends _i9.PageRouteInfo<void> {
  const HomePageRouter({List<_i9.PageRouteInfo>? children})
      : super(
          HomePageRouter.name,
          path: 'home_page',
          initialChildren: children,
        );

  static const String name = 'HomePageRouter';
}

/// generated route for
/// [_i4.EmptyRouterPage]
class SecondRouter extends _i9.PageRouteInfo<void> {
  const SecondRouter({List<_i9.PageRouteInfo>? children})
      : super(
          SecondRouter.name,
          path: 'second',
          initialChildren: children,
        );

  static const String name = 'SecondRouter';
}

/// generated route for
/// [_i5.ThirdPage]
class ThirdRouter extends _i9.PageRouteInfo<void> {
  const ThirdRouter()
      : super(
          ThirdRouter.name,
          path: 'third',
        );

  static const String name = 'ThirdRouter';
}

/// generated route for
/// [_i6.HomePage]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i7.CharactersPage]
class CharactersRoute extends _i9.PageRouteInfo<void> {
  const CharactersRoute()
      : super(
          CharactersRoute.name,
          path: '',
        );

  static const String name = 'CharactersRoute';
}

/// generated route for
/// [_i8.CharacterDetailsPage]
class CharacterDetailsRoute extends _i9.PageRouteInfo<void> {
  const CharacterDetailsRoute()
      : super(
          CharacterDetailsRoute.name,
          path: 'character_details',
        );

  static const String name = 'CharacterDetailsRoute';
}
