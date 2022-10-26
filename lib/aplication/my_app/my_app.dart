import 'package:flutter/material.dart';
import 'package:superclean/aplication/ui/themes/app_theme.dart';
import 'package:superclean/service_locator.dart';



       
class MyApp extends StatelessWidget {      

  final _appRouter = ServiceLocator.instace.router;

  MyApp({super.key});      
      
  @override      
  Widget build(BuildContext context){      
    return MaterialApp.router(      
      routerDelegate: _appRouter.delegate(),      
      routeInformationParser: _appRouter.defaultRouteParser(),    
      debugShowCheckedModeBanner: false,  
      theme: AppTheme.light,
    );      
  }      
}      

