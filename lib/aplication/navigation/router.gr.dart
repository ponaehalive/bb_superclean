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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:auto_route/empty_router_widgets.dart' as _i2;
import 'package:flutter/material.dart' as _i8;

import '../screens/character_details_page/character_details_page.dart' as _i6;
import '../screens/characters_page/characters_page.dart' as _i5;
import '../screens/first_page/first_page.dart' as _i4;
import '../screens/home_page.dart' as _i1;
import '../screens/third_page/third_page.dart' as _i3;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    FirstRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    SecondRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.EmptyRouterPage(),
      );
    },
    ThirdRouter.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.ThirdPage(),
      );
    },
    FirstRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.FirstPage(),
      );
    },
    CharactersRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.CharactersPage(),
      );
    },
    CharacterDetailsRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.CharacterDetailsPage(),
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              FirstRouter.name,
              path: 'first',
              parent: HomeRoute.name,
              children: [
                _i7.RouteConfig(
                  FirstRoute.name,
                  path: '',
                  parent: FirstRouter.name,
                )
              ],
            ),
            _i7.RouteConfig(
              SecondRouter.name,
              path: 'second',
              parent: HomeRoute.name,
              children: [
                _i7.RouteConfig(
                  CharactersRoute.name,
                  path: '',
                  parent: SecondRouter.name,
                ),
                _i7.RouteConfig(
                  CharacterDetailsRoute.name,
                  path: ':userId',
                  parent: SecondRouter.name,
                ),
              ],
            ),
            _i7.RouteConfig(
              ThirdRouter.name,
              path: 'third',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class FirstRouter extends _i7.PageRouteInfo<void> {
  const FirstRouter({List<_i7.PageRouteInfo>? children})
      : super(
          FirstRouter.name,
          path: 'first',
          initialChildren: children,
        );

  static const String name = 'FirstRouter';
}

/// generated route for
/// [_i2.EmptyRouterPage]
class SecondRouter extends _i7.PageRouteInfo<void> {
  const SecondRouter({List<_i7.PageRouteInfo>? children})
      : super(
          SecondRouter.name,
          path: 'second',
          initialChildren: children,
        );

  static const String name = 'SecondRouter';
}

/// generated route for
/// [_i3.ThirdPage]
class ThirdRouter extends _i7.PageRouteInfo<void> {
  const ThirdRouter()
      : super(
          ThirdRouter.name,
          path: 'third',
        );

  static const String name = 'ThirdRouter';
}

/// generated route for
/// [_i4.FirstPage]
class FirstRoute extends _i7.PageRouteInfo<void> {
  const FirstRoute()
      : super(
          FirstRoute.name,
          path: '',
        );

  static const String name = 'FirstRoute';
}

/// generated route for
/// [_i5.CharactersPage]
class CharactersRoute extends _i7.PageRouteInfo<void> {
  const CharactersRoute()
      : super(
          CharactersRoute.name,
          path: '',
        );

  static const String name = 'CharactersRoute';
}

/// generated route for
/// [_i6.CharacterDetailsPage]
class CharacterDetailsRoute extends _i7.PageRouteInfo<void> {
  const CharacterDetailsRoute()
      : super(
          CharacterDetailsRoute.name,
          path: ':userId',
        );

  static const String name = 'CharacterDetailsRoute';
}
