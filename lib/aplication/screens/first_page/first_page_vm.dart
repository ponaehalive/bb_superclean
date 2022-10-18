// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import 'package:superclean/src/base_elements/base_view_model.dart';

class FirstPageViewModel extends ChangeNotifier with BaseViewModel {


  String peremen = 'urarara';

  void change() {
    peremen = 'nononon';
    notifyListeners();
  }

  void init() {
    print('init 1 page');
  }
}
