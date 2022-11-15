import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:superclean/aplication/my_app/my_app_vm.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/aplication/ui/themes/app_theme.dart';

class MyApp extends StatelessWidget {
  final MyAppViewModel model;
  final _appRouter = GetIt.instance<AppRouter>();
  MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      routerDelegate: _appRouter.delegate(
        initialRoutes: [
          model.isAuth ? const AutoTabsScaffoldRoute() : const AuthRouter(),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      /*   localizationsDelegates: const [

    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: const [
    Locale('en', 'EN'), // English, no country code
    Locale('ru', 'RU'), // Spanish, no country code
  ], */
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
