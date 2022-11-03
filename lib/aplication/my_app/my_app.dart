import 'package:flutter/material.dart';
import 'package:superclean/aplication/my_app/my_app_vm.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/aplication/ui/themes/app_theme.dart';
import 'package:superclean/service_locator.dart';

class MyApp extends StatelessWidget {
  final MyAppViewModel model;
  final _appRouter = ServiceLocator.instace.router;

  MyApp({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        initialRoutes: [
          model.isAuth ? const AutoTabsScaffoldRoute() : const AuthRouter(),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
    );
  }
}
