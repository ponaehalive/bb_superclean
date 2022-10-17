// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    FirstRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const FirstPage(),
      );
    },
    SecondRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SecondPage(),
      );
    },
    ThirdRouter.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ThirdPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          HomeRoute.name,
          path: '/',
          children: [
            RouteConfig(
              FirstRouter.name,
              path: 'first',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              SecondRouter.name,
              path: 'second',
              parent: HomeRoute.name,
            ),
            RouteConfig(
              ThirdRouter.name,
              path: 'third',
              parent: HomeRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [FirstPage]
class FirstRouter extends PageRouteInfo<void> {
  const FirstRouter()
      : super(
          FirstRouter.name,
          path: 'first',
        );

  static const String name = 'FirstRouter';
}

/// generated route for
/// [SecondPage]
class SecondRouter extends PageRouteInfo<void> {
  const SecondRouter()
      : super(
          SecondRouter.name,
          path: 'second',
        );

  static const String name = 'SecondRouter';
}

/// generated route for
/// [ThirdPage]
class ThirdRouter extends PageRouteInfo<void> {
  const ThirdRouter()
      : super(
          ThirdRouter.name,
          path: 'third',
        );

  static const String name = 'ThirdRouter';
}
