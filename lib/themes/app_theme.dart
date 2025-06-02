import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.mainColor,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: TextTheme(
      // bodyLarge: TextStyle(color: AppColors.text),
    ),
    // buttonTheme: ButtonThemeData(buttonColor: AppColors.primary),
  );
}
