// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/service_locator.dart';

import 'package:superclean/src/base_elements/base_view_model.dart';

class HomePageViewModel extends ChangeNotifier with BaseViewModel {
  final _appRouter = ServiceLocator.instace.router;

  String peremen = 'urarara';

  void change() {
    peremen = 'nononon';
    notifyListeners();
  }

  void init() {
    print('init 1 page');
  }

   void goToBBSeasonsList() =>
    _appRouter.push(
      const SeasonsListRouter(),
    );  

}
