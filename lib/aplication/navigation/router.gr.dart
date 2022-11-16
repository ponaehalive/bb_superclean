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
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:auto_route/empty_router_widgets.dart' as _i6;
import 'package:flutter/material.dart' as _i12;

import '../screens/auth/auth_page.dart' as _i1;
import '../screens/auto_tabs_scaffold_page.dart' as _i2;
import '../screens/character_details_page/character_details_page.dart' as _i10;
import '../screens/actors_page/actors_page.dart' as _i9;
import '../screens/episode_info_page/episode_info_page.dart' as _i5;
import '../screens/home_page/home_page.dart' as _i8;
import '../screens/season_episodes_page/season_episodes_page.dart' as _i4;
import '../screens/seasons_list_page/seasons_list_page.dart' as _i3;
import '../screens/third_page/third_page.dart' as _i7;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AuthRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.AuthPage(),
      );
    },
    AutoTabsScaffoldRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.AutoTabsScaffoldPage(),
      );
    },
    SeasonsListRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SeasonsListPage(),
      );
    },
    SeasonEpisodesPageRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.SeasonEpisodesPage(),
      );
    },
    EpisodeInfoRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.EpisodeInfoPage(),
      );
    },
    HomePageRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    SecondRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.EmptyRouterPage(),
      );
    },
    ThirdRouter.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.ThirdPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.HomePage(),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ActorsPage(),
      );
    },
    CharacterDetailsRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CharacterDetailsPage(),
      );
    },
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(
          AuthRouter.name,
          path: '/',
        ),
        _i11.RouteConfig(
          AutoTabsScaffoldRoute.name,
          path: 'auto_scaffold',
          children: [
            _i11.RouteConfig(
              HomePageRouter.name,
              path: 'home_page',
              parent: AutoTabsScaffoldRoute.name,
              children: [
                _i11.RouteConfig(
                  HomeRoute.name,
                  path: '',
                  parent: HomePageRouter.name,
                )
              ],
            ),
            _i11.RouteConfig(
              SecondRouter.name,
              path: 'second',
              parent: AutoTabsScaffoldRoute.name,
              children: [
                _i11.RouteConfig(
                  CharactersRoute.name,
                  path: '',
                  parent: SecondRouter.name,
                ),
                _i11.RouteConfig(
                  CharacterDetailsRoute.name,
                  path: 'character_details',
                  parent: SecondRouter.name,
                ),
              ],
            ),
            _i11.RouteConfig(
              ThirdRouter.name,
              path: 'third',
              parent: AutoTabsScaffoldRoute.name,
            ),
          ],
        ),
        _i11.RouteConfig(
          SeasonsListRoute.name,
          path: 'seasons_list',
        ),
        _i11.RouteConfig(
          SeasonEpisodesPageRouter.name,
          path: 'season_episodes_list',
        ),
        _i11.RouteConfig(
          EpisodeInfoRouter.name,
          path: 'episode_info',
        ),
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthRouter extends _i11.PageRouteInfo<void> {
  const AuthRouter()
      : super(
          AuthRouter.name,
          path: '/',
        );

  static const String name = 'AuthRouter';
}

/// generated route for
/// [_i2.AutoTabsScaffoldPage]
class AutoTabsScaffoldRoute extends _i11.PageRouteInfo<void> {
  const AutoTabsScaffoldRoute({List<_i11.PageRouteInfo>? children})
      : super(
          AutoTabsScaffoldRoute.name,
          path: 'auto_scaffold',
          initialChildren: children,
        );

  static const String name = 'AutoTabsScaffoldRoute';
}

/// generated route for
/// [_i3.SeasonsListPage]
class SeasonsListRoute extends _i11.PageRouteInfo<void> {
  const SeasonsListRoute()
      : super(
          SeasonsListRoute.name,
          path: 'seasons_list',
        );

  static const String name = 'SeasonsListRoute';
}

/// generated route for
/// [_i4.SeasonEpisodesPage]
class SeasonEpisodesPageRouter extends _i11.PageRouteInfo<void> {
  const SeasonEpisodesPageRouter()
      : super(
          SeasonEpisodesPageRouter.name,
          path: 'season_episodes_list',
        );

  static const String name = 'SeasonEpisodesPageRouter';
}

/// generated route for
/// [_i5.EpisodeInfoPage]
class EpisodeInfoRouter extends _i11.PageRouteInfo<void> {
  const EpisodeInfoRouter()
      : super(
          EpisodeInfoRouter.name,
          path: 'episode_info',
        );

  static const String name = 'EpisodeInfoRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class HomePageRouter extends _i11.PageRouteInfo<void> {
  const HomePageRouter({List<_i11.PageRouteInfo>? children})
      : super(
          HomePageRouter.name,
          path: 'home_page',
          initialChildren: children,
        );

  static const String name = 'HomePageRouter';
}

/// generated route for
/// [_i6.EmptyRouterPage]
class SecondRouter extends _i11.PageRouteInfo<void> {
  const SecondRouter({List<_i11.PageRouteInfo>? children})
      : super(
          SecondRouter.name,
          path: 'second',
          initialChildren: children,
        );

  static const String name = 'SecondRouter';
}

/// generated route for
/// [_i7.ThirdPage]
class ThirdRouter extends _i11.PageRouteInfo<void> {
  const ThirdRouter()
      : super(
          ThirdRouter.name,
          path: 'third',
        );

  static const String name = 'ThirdRouter';
}

/// generated route for
/// [_i8.HomePage]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i9.ActorsPage]
class CharactersRoute extends _i11.PageRouteInfo<void> {
  const CharactersRoute()
      : super(
          CharactersRoute.name,
          path: '',
        );

  static const String name = 'CharactersRoute';
}

/// generated route for
/// [_i10.CharacterDetailsPage]
class CharacterDetailsRoute extends _i11.PageRouteInfo<void> {
  const CharacterDetailsRoute()
      : super(
          CharacterDetailsRoute.name,
          path: 'character_details',
        );

  static const String name = 'CharacterDetailsRoute';
}
