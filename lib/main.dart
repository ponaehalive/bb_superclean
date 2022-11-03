import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superclean/aplication/my_app/my_app.dart';
import 'package:superclean/aplication/my_app/my_app_vm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]);
  final model = MyAppViewModel();
  await model.checkAuth();
  final app = MyApp(model: model);

  runApp(app);
}
 