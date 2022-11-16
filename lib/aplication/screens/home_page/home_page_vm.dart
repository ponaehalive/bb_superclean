// ignore_for_file: avoid_print

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/domain/services/secure_auth_data.dart';
import 'package:superclean/src/base_elements/base_view_model.dart';

class HomePageViewModel extends ChangeNotifier with BaseViewModel {
  final _appRouter = GetIt.instance<AppRouter>();

  String peremen = '';

  void init(context) {
    print('Init main page');
    SecureAuthData()
        .saveLocale(EasyLocalization.of(context)?.locale.countryCode);
    print(EasyLocalization.of(context)?.locale.languageCode);
  }

  void goToBBSeasonsList() => _appRouter.push(
        const SeasonsListRoute(),
      );
}
