import 'package:flutter/material.dart';
import 'package:superclean/aplication/navigation/router.dart';
import 'package:superclean/aplication/ui/themes/app_theme.dart';



       
class MyApp extends StatelessWidget {      
         
  final _appRouter = AppRouter();

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

