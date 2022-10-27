import 'package:flutter/material.dart';
import 'package:superclean/aplication/ui/themes/app_colors.dart';

abstract class AppTheme {
  static final light = ThemeData(
    primarySwatch: Colors.green,
    scaffoldBackgroundColor: AppColors.darkBackground,
  );
}
