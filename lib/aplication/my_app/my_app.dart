import 'package:flutter/material.dart';
import 'package:superclean/aplication/my_app/my_app_vm.dart';
import 'package:superclean/aplication/navigation/router.gr.dart';
import 'package:superclean/aplication/ui/themes/app_theme.dart';
import 'package:superclean/service_locator.dart';

class MyApp extends StatelessWidget {
 
  final  MyAppViewModel model;
  final _appRouter = ServiceLocator.instace.router;

  MyApp({Key? key, required this.model }) : super (key: key);

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

/*
MaterialApp.router(
            routerDelegate: AutoRouterDelegate.declarative(   
                _appRouter,
                routes: (_) => [
                  // if the user is logged in, they may proceed to the main App
                  if (authService().isLoggedIn)
                    HomeRoute()
                  // if they are not logged in, bring them to the Login page 
                  else
                    LoginWrapperRoute(onLogin: () => authService().logIn),
                ],
            ),
            routeInformationParser:
                _appRouter.defaultRouteParser(includePrefixMatches: true));
    }
}*/
