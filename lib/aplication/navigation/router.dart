import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:superclean/aplication/screens/first_page/first_page.dart';
import 'package:superclean/aplication/screens/home_page.dart';

import 'package:superclean/aplication/screens/characters_page/characters_page.dart';
import 'package:superclean/aplication/screens/third_page/third_page.dart';

part 'router.gr.dart';

AppRouter get router => AppRouter();

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: HomePage, children: [
      AutoRoute(path: 'first', name: 'FirstRouter', page: FirstPage),
      AutoRoute(path: 'second', name: 'SecondRouter', page: CharactersPage),
      AutoRoute(path: 'third', name: 'ThirdRouter', page: ThirdPage)
    ])
  ],
)
class AppRouter extends _$AppRouter {}
