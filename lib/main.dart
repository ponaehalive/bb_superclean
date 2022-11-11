import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superclean/aplication/my_app/my_app.dart';
import 'package:superclean/aplication/my_app/my_app_vm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:superclean/service_locator.dart';
import 'firebase_options.dart';

void main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
      name: "dev project", options: DefaultFirebaseOptions.currentPlatform);
/* 
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, */

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final model = MyAppViewModel();
  await model.checkAuth();
  final app = MyApp(model: model);

  runApp(app);
}
