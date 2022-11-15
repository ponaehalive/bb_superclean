import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:superclean/aplication/my_app/my_app.dart';
import 'package:superclean/aplication/my_app/my_app_vm.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:superclean/get_it_sl.dart';
import 'firebase_options.dart';

void main() async {
  setupGetIt();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    name: "dev project",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  final model = MyAppViewModel();
  await model.checkAuth();

  final app = EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ru', 'RU'),
    ],
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: MyApp(model: model),
  );

  runApp(app);
}
